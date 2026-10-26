# BÁO CÁO CHI TIẾT CÁC THAY ĐỔI GIA CỐ BẢO MẬT HỆ THỐNG DDH-ELECTRONICS
> **Học phần:** Phát triển phần mềm web an toàn  
> **Giảng viên hướng dẫn:** ThS. Phương Văn Cảnh  
> **Căn cứ thực nghiệm:** Kịch bản kiểm thử trong `TEST_ATTACKS_DEMO.bat` & Giám sát an ninh `START_SNORT_IDS.bat`

---

## 📌 TỔNG QUAN KIẾN TRÚC PHÒNG THỦ THEO CHIỀU SÂU (DEFENSE-IN-DEPTH)

Hệ thống được thiết kế theo mô hình **3 lớp phòng thủ liên hoàn**:
1. **Lớp Chu vi Mạng (Network Perimeter):** Hệ thống phát hiện xâm nhập **Snort IDS** (`my_sql.rules`) giám sát các gói tin tại cổng mạng (Port 80, 8000, 443).
2. **Lớp Máy chủ Web (Web Server / Proxy):** Cấu hình **Nginx Virtual Host** HTTPS TLS 1.2/1.3, cấm tuyệt đối việc truy cập các tệp ẩn (`.env`, `.git`) và cưỡng chế chuyển hướng 301 sang HTTPS.
3. **Lớp Ứng dụng & Dữ liệu (Application & Database):** Mã nguồn **Laravel 11** được gia cố toàn diện chống lại **OWASP Top 10** thông qua Middleware, Controllers và Eloquent ORM.

---

## 🛡️ CHI TIẾT CÁC SỬA ĐỔI MÃ NGUỒN THEO TỪNG BÀI TEST TRONG `TEST_ATTACKS_DEMO.bat`

---

### [BÀI TEST 1 & 2]: PHÒNG CHỐNG TẤN CÔNG SQL INJECTION & UNION SELECT

* **Mục tiêu kiểm thử:** Hacker gửi payload `' OR 1=1 --` hoặc `UNION SELECT id,name,password FROM users` qua tham số tìm kiếm `search` nhằm vượt qua xác thực hoặc trích xuất dữ liệu bảng `users`.
* **Phân loại OWASP:** **OWASP A03:2021 – Injection**.

#### 1. Các tệp mã nguồn liên quan:
* `DDH-Electronics/app/Http/Controllers/ProductController.php` (Dòng 18-20)
* `DDH-Electronics/app/Http/Controllers/Api/MobileApiController.php` (Dòng 96-98)
* `DDH-Electronics/app/Http/Middleware/SnortIdSimulator.php` (Dòng 24-44)

#### 2. Phân tích chi tiết Trước vs Sau khi sửa đổi:

##### ❌ NGUY CƠ TRƯỚC PHÒNG THỦ (BEFORE - DỄ BỊ HACK):
Nếu dùng cách ghép chuỗi SQL truyền thống:
```php
// CỰC KỲ NGUY HIỂM: Ghép chuỗi trực tiếp từ $_GET / $request
$search = $request->input('search');
$products = DB::select("SELECT * FROM products WHERE name LIKE '%" . $search . "%'");
```
* Khi hacker nhập: `' OR 1=1 --`, câu lệnh trở thành:
  `SELECT * FROM products WHERE name LIKE '%' OR 1=1 --%'`
  -> Mệnh đề `1=1` luôn đúng, làm lộ toàn bộ sản phẩm và bypass logic lọc.
* Khi nhập `UNION SELECT id, name, password FROM users --`, hacker có thể trích xuất toàn bộ mật khẩu tài khoản người dùng về giao diện web.

##### ✅ GIẢI PHÁP GIA CỐ MÃ NGUỒN (AFTER - ĐÃ SỬA VÀO WEB):
Hệ thống chuyển đổi 100% sang sử dụng **Eloquent ORM Query Builder với cơ chế Prepared Statements (PDO Parameterized Binding)**:

* **Tại `ProductController.php`:**
```php
$query = Product::query();

if ($request->has('search')) {
    // 🛡️ Dữ liệu $request->search được đưa vào placeholder '?' của PDO
    $query->where('name', 'like', '%' . $request->search . '%');
}
```

* **Tại `MobileApiController.php`:**
```php
if ($request->search) {
    // 🛡️ Tham số hóa an toàn, không thể chèn cú pháp SQL
    $query->where('name', 'like', '%' . $request->search . '%');
}
```

* **Bản chất kỹ thuật bảo vệ:**
  Database Driver (PDO MySQL) tách rời hoàn toàn giữa **Cấu trúc lệnh SQL** và **Tham số dữ liệu**. Chuỗi `' OR 1=1 --` hay `UNION SELECT` chỉ được coi là một chuỗi ký tự (Literal String) bình thường để so khớp tên sản phẩm. Do không có sản phẩm nào tên là `' OR 1=1 --`, hệ thống trả về kết quả rỗng (`total: 0`), tuyệt đối không bị khai thác.

#### 3. Tầng Giám sát Mạng (Snort IDS):
Trong `SnortIdSimulator.php`, hệ thống áp dụng 2 quy tắc từ `my_sql.rules`:
* **Rule 100001:** Bắt gói tin chứa chuỗi `' OR 1=1` -> Kích hoạt cảnh báo đỏ `[ALARM-SQLi] SQL Injection Attempt Detected`.
* **Rule 100002:** Bắt gói tin đồng thời chứa `UNION` và `SELECT` -> Kích hoạt cảnh báo đỏ `[ALARM-SQLi] SQL Injection UNION SELECT Data Extraction`.

---

### [BÀI TEST 3]: PHÒNG CHỐNG DÒ QUÉT TỆP TIN CẤU HÌNH NHẠY CẢM (`.env`)

* **Mục tiêu kiểm thử:** Hacker gửi request truy cập thẳng vào `http://127.0.0.1:8000/.env` để lấy cắp khóa bí mật `APP_KEY`, thông tin tài khoản cơ sở dữ liệu `DB_USERNAME`, `DB_PASSWORD`.
* **Phân loại OWASP:** **OWASP A05:2021 – Security Misconfiguration**.

#### 1. Các tệp mã nguồn và cấu hình liên quan:
* `DDH-Electronics/nginx/ddh-electronics.conf` (Dòng 56-59)
* Kiến trúc thư mục Laravel `public/index.php`
* `DDH-Electronics/app/Http/Middleware/SnortIdSimulator.php` (Dòng 57-66)

#### 2. Phân tích chi tiết Trước vs Sau khi sửa đổi:

##### ❌ NGUY CƠ TRƯỚC PHÒNG THỦ (BEFORE):
* Nếu quản trị viên cấu hình Web Server trỏ Document Root vào thư mục gốc của dự án (`/DDH-Electronics/` thay vì `/DDH-Electronics/public/`), tệp `.env` sẽ trở thành một tệp tĩnh công khai.
* Bất kỳ ai mở trình duyệt gõ `/.env` đều tải về được toàn bộ chuỗi kết nối Database và mật khẩu hệ thống.

##### ✅ GIẢI PHÁP GIA CỐ MÃ NGUỒN & HẠ TẦNG (AFTER):
* **Tầng Web Server Nginx (`nginx/ddh-electronics.conf`):**
  Cấu hình khối chặn toàn bộ các tệp và thư mục ẩn bắt đầu bằng dấu chấm (`.`):
```nginx
# 🛡️ OWASP: Chặn tuyệt đối việc truy cập các tệp ẩn và nhạy cảm (.env, .git, .htaccess)
location ~ /\. {
    deny all;
    access_log off;
    log_not_found off;
    return 404;
}
```
* **Tầng Ứng dụng Laravel:**
  Document Root được cô lập hoàn toàn tại thư mục `public/`. Tệp `.env` nằm ở thư mục cha bên ngoài tầm với của Web Server. Mọi truy vấn vào `/.env` đều trả về HTTP Code `404 Not Found` hoặc `403 Forbidden`.

* **Tầng Giám sát Mạng (Snort IDS):**
  Quy tắc **Rule 100004** trong `my_sql.rules` nhận diện chuỗi `.env` hoặc `wp-admin` trên URL và phát cảnh báo:
  `[ALARM-PROBE] Sensitive File Access Attempt (.env / config)`.

---

### [BÀI TEST 4]: PHÒNG CHỐNG VÉT CẠN MẬT KHẨU BRUTE FORCE (`/login`)

* **Mục tiêu kiểm thử:** Hacker sử dụng công cụ tự động gửi hàng loạt request POST sai mật khẩu liên tiếp vào `/login` nhằm tìm ra mật khẩu quản trị viên.
* **Phân loại OWASP:** **OWASP A07:2021 – Identification and Authentication Failures**.

#### 1. Các tệp mã nguồn liên quan:
* `DDH-Electronics/routes/web.php` (Dòng 42-43)
* `DDH-Electronics/app/Http/Controllers/Auth/LoginController.php` (Dòng 18-61)
* `DDH-Electronics/resources/views/auth/login.blade.php` (Form nhập CAPTCHA)
* `DDH-Electronics/app/Http/Middleware/SnortIdSimulator.php` (Dòng 68-82)

#### 2. Phân tích chi tiết Trước vs Sau khi sửa đổi:

##### ❌ NGUY CƠ TRƯỚC PHÒNG THỦ (BEFORE):
Route `/login` không có giới hạn số lần thử (Rate Limit) và không có mã xác minh CAPTCHA. Kẻ tấn công có thể chạy script gửi 10.000 mật khẩu/phút cho đến khi tìm được mật khẩu đúng.

##### ✅ GIẢI PHÁP GIA CỐ MÃ NGUỒN (AFTER):
Hệ thống triển khai cơ chế **Phòng vệ 3 Lớp**:

* **Lớp 1: Rate Limiting ở tầng Route (`routes/web.php` & `LoginController.php`):**
```php
// routes/web.php
Route::post('login', [App\Http\Controllers\Auth\LoginController::class, 'login'])
    ->middleware('throttle:5,0.33'); // Cho phép tối đa 5 lần thử / 20 giây (0.33 phút)
```
```php
// app/Http/Controllers/Auth/LoginController.php
public static function middleware(): array
{
    return [
        new Middleware('guest', except: ['logout']),
        // 🛡️ Giới hạn 5 lần đăng nhập trong 20 giây cho kịch bản Demo
        new Middleware('throttle:5,0.33', only: ['login']),
    ];
}
```
* **Lớp 2: Xác minh người thật bằng Toán học Math CAPTCHA (`LoginController.php`):**
  Mỗi lần tải form đăng nhập, hệ thống tự động sinh ngẫu nhiên một phép toán số học và lưu kết quả vào Session bảo mật:
```php
public function showLoginForm()
{
    $num1 = rand(2, 9);
    $num2 = rand(1, 9);
    session(['login_captcha_answer' => $num1 + $num2]);
    $captchaQuestion = "$num1 + $num2";

    return view('auth.login', compact('captchaQuestion'));
}

protected function validateLogin(Request $request)
{
    $request->validate([
        $this->username() => 'required|string',
        'password' => 'required|string',
        'captcha' => [
            'required',
            'numeric',
            function ($attribute, $value, $fail) {
                $expected = session('login_captcha_answer');
                if ($expected === null || (int)$value !== (int)$expected) {
                    $fail('Mã bảo vệ CAPTCHA không chính xác!');
                }
            },
        ],
    ], [
        'captcha.required' => 'Vui lòng giải phép tính CAPTCHA xác minh.',
        'captcha.numeric' => 'Mã CAPTCHA phải là số.',
    ]);
}
```
* **Lớp 3: Giám sát tần suất gói tin Snort IDS (`SnortIdSimulator.php`):**
  **Rule 100005** theo dõi số lượng POST tới `/login` theo IP. Nếu vượt quá 5 request trong vòng 20 giây, lập tức nổ còi cảnh báo:
  `[ALARM-BRUTEFORCE] High Frequency POST to /login (Brute Force Detected)`.

---

### [BÀI TEST 5]: KIỂM SOÁT PHÂN QUYỀN TRUY CẬP QUẢN TRỊ (RBAC)

* **Mục tiêu kiểm thử:** Người dùng bình thường (đã đăng nhập tài khoản khách mua hàng, `is_admin = 0`) hoặc khách lạ cố tình gõ link `http://127.0.0.1:8000/admin` để truy cập trang quản trị trái phép.
* **Phân loại OWASP:** **OWASP A01:2021 – Broken Access Control**.

#### 1. Các tệp mã nguồn liên quan:
* `DDH-Electronics/app/Http/Controllers/AdminController.php` (Dòng 23-53)

#### 2. Phân tích chi tiết Trước vs Sau khi sửa đổi:

##### ❌ NGUY CƠ TRƯỚC PHÒNG THỦ (BEFORE):
Nhiều hệ thống chỉ dùng `auth` middleware (kiểm tra xem người dùng đã đăng nhập chưa). Nếu khách hàng thường mua hàng đăng nhập xong rồi gõ `/admin`, hệ thống vẫn cho phép vào quản trị vì nghĩ rằng "đã đăng nhập là được".

##### ✅ GIẢI PHÁP GIA CỐ MÃ NGUỒN (AFTER):
Trong `AdminController.php`, triển khai giao thức `HasMiddleware` để kiểm tra phân quyền chặt chẽ theo vai trò (Role-Based Access Control):

```php
class AdminController extends Controller implements HasMiddleware
{
    public static function middleware(): array
    {
        return [
            // Lớp 1: Bắt buộc phải đăng nhập (Chưa đăng nhập -> Chuyển hướng 302 về /login)
            new Middleware('auth'),

            // Lớp 2: Kiểm tra vai trò người dùng (RBAC)
            function ($request, $next) {
                $user = auth()->user();
                $method = $request->route()->getActionMethod();
                $writerMethods = ['posts', 'createPost', 'storePost', 'editPost', 'updatePost', 'deletePost'];

                // 1. Super Admin (admin@ddh.com) -> Toàn quyền
                if ($user->email === 'admin@ddh.com') {
                    return $next($request);
                }

                // 2. Tài khoản có cờ is_admin = 1 -> Cho phép quản trị
                if ($user->is_admin) {
                    return $next($request);
                }

                // 3. Tài khoản Người viết bài (can_write_posts) -> Chỉ được thao tác bài viết
                if ($user->can_write_posts && in_array($method, $writerMethods)) {
                    return $next($request);
                }

                // 🛡️ TẤT CẢ TRƯỜNG HỢP CÒN LẠI: TỪ CHỐI THẲNG THỪNG VỚI MÃ LỖI 403
                abort(403, 'Truy cập bị từ chối: Bạn không có quyền truy cập vào khu vực quản trị DDH Electronics!');
            }
        ];
    }
}
```

* **Kết quả thực tế:** Khi khách hàng thường (`nguyenhieudocla123a@gmail.com`) truy cập `/admin`, server lập tức ngắt luồng và trả về trang lỗi **`403 Forbidden`**, bảo vệ toàn bộ dữ liệu đơn hàng và doanh thu.

---

### [BÀI TEST 6]: THIẾT LẬP TIÊU ĐỀ AN TOÀN TRÌNH DUYỆT (SECURITY HEADERS)

* **Mục tiêu kiểm thử:** Kiểm tra các HTTP Response Header trả về từ Web Server nhằm ngăn chặn các kỹ thuật tấn công Clickjacking, MIME-sniffing, XSS và đánh cắp Cookie.
* **Phân loại OWASP:** **OWASP A05:2021 – Security Misconfiguration**.

#### 1. Các tệp mã nguồn liên quan:
* `DDH-Electronics/app/Http/Middleware/SecurityHeaders.php` (Tạo mới toàn bộ file)
* `DDH-Electronics/bootstrap/app.php` (Dòng 14-17 - Đăng ký Middleware toàn cục)

#### 2. Phân tích chi tiết Trước vs Sau khi sửa đổi:

##### ❌ NGUY CƠ TRƯỚC PHÒNG THỦ (BEFORE):
Phản hồi HTTP từ server mặc định không có tiêu đề bảo mật. Kẻ tấn công có thể:
* Nhúng website vào một thẻ `<iframe>` trong suốt trên trang web độc hại để lừa người dùng bấm chuột (Clickjacking).
* Đánh lừa trình duyệt thực thi file text/ảnh giả mạo dưới dạng Javascript (MIME sniffing).

##### ✅ GIẢI PHÁP GIA CỐ MÃ NGUỒN (AFTER):
Tạo Middleware `SecurityHeaders.php` và gắn trực tiếp vào tất cả các HTTP Request của ứng dụng trong `bootstrap/app.php`:

* **Nội dung Middleware `SecurityHeaders.php`:**
```php
namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class SecurityHeaders
{
    public function handle(Request $request, Closure $next): Response
    {
        $response = $next($request);

        // 1. Chống Clickjacking: Cấm các trang web khác nhúng web này vào iframe
        $response->headers->set('X-Frame-Options', 'SAMEORIGIN');

        // 2. Chống MIME-sniffing: Ép trình duyệt tuân thủ MIME type khai báo từ server
        $response->headers->set('X-Content-Type-Options', 'nosniff');

        // 3. Bật bộ lọc XSS tích hợp của trình duyệt
        $response->headers->set('X-XSS-Protection', '1; mode=block');

        // 4. Kiểm soát rò rỉ URL gốc khi người dùng bấm vào liên kết ngoài
        $response->headers->set('Referrer-Policy', 'strict-origin-when-cross-origin');

        // 5. Cấm trình duyệt tự ý kích hoạt Camera, Micro, Định vị GPS
        $response->headers->set('Permissions-Policy', 'camera=(), microphone=(), geolocation=()');

        // 6. Cưỡng chế kết nối bảo mật HTTPS (HSTS)
        if ($request->isSecure() || $request->header('X-Forwarded-Proto') === 'https') {
            $response->headers->set('Strict-Transport-Security', 'max-age=31536000; includeSubDomains; preload');
        }

        // 7. Content Security Policy (CSP): Chỉ cho phép tải mã nguồn, style, font từ nguồn uy tín
        $csp = "default-src 'self' https: data:; " .
               "script-src 'self' 'unsafe-inline' 'unsafe-eval' https://cdn.jsdelivr.net https://cdnjs.cloudflare.com; " .
               "style-src 'self' 'unsafe-inline' https://cdn.jsdelivr.net https://cdnjs.cloudflare.com https://fonts.googleapis.com; " .
               "font-src 'self' data: https://cdnjs.cloudflare.com https://fonts.gstatic.com; " .
               "img-src 'self' data: https: http:; " .
               "frame-ancestors 'self';";
        $response->headers->set('Content-Security-Policy', $csp);

        return $response;
    }
}
```

* **Đăng ký vào nhân ứng dụng (`bootstrap/app.php`):**
```php
->withMiddleware(function (Middleware $middleware): void {
    // 🛡️ Tự động gắn Security Headers vào 100% Request gửi tới Web
    $middleware->append(\App\Http\Middleware\SecurityHeaders::class);
    $middleware->append(\App\Http\Middleware\SnortIdSimulator::class);
})
```

---

## 🌟 TÍNH NĂNG BẢO MẬT BỔ SUNG: CHỐNG UPLOAD WEB SHELL & RCE

* **Mục tiêu kiểm thử:** Hacker giả danh tải ảnh đại diện / ảnh sản phẩm nhưng thực chất tải lên file script mã độc (ví dụ: `shell.php`, `backdoor.phtml`) để chiếm quyền điều khiển máy chủ (Remote Code Execution - RCE).
* **Phân loại OWASP:** **OWASP A04:2021 – Insecure Design / Unrestricted File Upload**.

#### 1. Tệp mã nguồn liên quan:
* `DDH-Electronics/app/Http/Controllers/AdminController.php` (Dòng 58-87)

#### 2. Mã nguồn hàm xử lý Upload an toàn `handleSecureImageUpload`:
```php
private function handleSecureImageUpload($file, string $targetFolder = 'products'): string
{
    // LỚP 1: Kiểm tra Blacklist phần mở rộng nguy hiểm
    $clientExtension = strtolower($file->getClientOriginalExtension());
    $dangerousExtensions = ['php', 'phtml', 'phar', 'php5', 'php7', 'php8', 'sh', 'exe', 'bat', 'cmd', 'cgi', 'pl', 'py', 'asp', 'aspx', 'jsp'];
    if (in_array($clientExtension, $dangerousExtensions)) {
        abort(400, 'Tệp tin chứa phần mở rộng thực thi nguy hiểm bị hệ thống từ chối!');
    }

    // LỚP 2: Whitelist định dạng ảnh hợp lệ
    $allowedExtensions = ['jpg', 'jpeg', 'png', 'webp', 'gif'];
    if (!in_array($clientExtension, $allowedExtensions)) {
        abort(400, 'Định dạng tệp không được hỗ trợ (chỉ chấp nhận JPG, PNG, WEBP, GIF)!');
    }

    // LỚP 3: Đọc cấu trúc nhị phân thực tế bằng PHP Fileinfo (MIME sniffing)
    // Ngăn chặn kỹ thuật đổi tên file 'shell.php' thành 'shell.jpg'
    $realMime = $file->getMimeType();
    $allowedMimes = ['image/jpeg', 'image/png', 'image/webp', 'image/gif'];
    if (!in_array($realMime, $allowedMimes)) {
        abort(400, 'Nội dung tệp không phải là tệp ảnh hợp lệ!');
    }

    // LỚP 4: Đổi tên tệp ngẫu nhiên bằng mã định danh UUID v4
    // Triệt tiêu kỹ thuật Path Traversal (../../shell.php) và Null-Byte Injection (%00)
    $safeFilename = Str::uuid() . '.' . $clientExtension;

    // LỚP 5: Lưu tệp vào ổ đĩa công khai được kiểm soát
    $path = $file->storeAs($targetFolder, $safeFilename, 'public');

    return 'storage/' . $path;
}
```

---

## 🧹 DỌN SẠCH CƠ SỞ DỮ LIỆU & BẢO TOÀN DỮ LIỆU (DATABASE SANITIZATION)

Trong quá trình gia cố, hệ thống cũng đã được quét toàn bộ cơ sở dữ liệu MySQL và xử lý triệt để:
1. **Xóa sạch 100% link spam độc hại:** Quét và thay thế toàn bộ chuỗi spam quảng cáo `powercapital-hk.space` trong các bảng `notifications`, `orders`, `products`, `users`.
2. **Khắc phục lỗi font Tiếng Việt:** Chuẩn hóa toàn bộ bảng mã UTF-8 (`utf8mb4_unicode_ci`), xóa các chuỗi lỗi font hiển thị `???` trong phần mô tả sản phẩm và ghi chú đơn hàng.

---

## 📊 BẢNG TỔNG HỢP ÁNH XẠ FILE ĐÃ SỬA ĐỔI

| STT | Tệp tin sửa đổi / tạo mới | Chức năng bảo mật chính | Kiểm tra tương ứng |
| :---: | :--- | :--- | :--- |
| **1** | `app/Http/Controllers/ProductController.php` | Eloquent Parameterized Query | Test 1: SQLi cơ bản |
| **2** | `app/Http/Controllers/Api/MobileApiController.php` | Eloquent Parameterized Query | Test 2: UNION SELECT |
| **3** | `nginx/ddh-electronics.conf` | Chặn tệp ẩn `location ~ /\. { deny all; }` | Test 3: Dò quét `/.env` |
| **4** | `routes/web.php` & `LoginController.php` | Rate Limiter `throttle:5,0.33` + Math CAPTCHA | Test 4: Brute Force |
| **5** | `app/Http/Controllers/AdminController.php` | Phân quyền RBAC (`auth` + `is_admin` -> 403) | Test 5: Phân quyền `/admin` |
| **6** | `app/Http/Middleware/SecurityHeaders.php` | 7 Tiêu đề HTTP Security (CSP, nosniff, HSTS) | Test 6: Security Headers |
| **7** | `bootstrap/app.php` | Đăng ký toàn cục SecurityHeaders & Snort IDS | Áp dụng cho mọi Request |
| **8** | `app/Http/Controllers/AdminController.php` | Hàm `handleSecureImageUpload` (MIME finfo + UUID) | Chống Upload Web Shell |
| **9** | `app/Http/Middleware/SnortIdSimulator.php` | Mô phỏng Snort IDS 5 Rules thời gian thực | Kích hoạt cảnh báo đỏ trên console |
