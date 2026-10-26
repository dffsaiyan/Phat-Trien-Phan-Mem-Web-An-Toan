# 🛡️ BÁO CÁO CHUYÊN ĐỀ: PHÁT TRIỂN PHẦN MỀM WEB AN TOÀN (EPU)

> **Học phần:** Phát triển phần mềm web an toàn (Mã học phần: 002033)  
> **Trường Đại học Điện lực (EPU)** – Khoa Công nghệ Thông tin  
> **Giảng viên hướng dẫn:** ThS. Phương Văn Cảnh  
> **Lớp:** D18CNPM2 | **Khóa:** 2023 - 2028  
> **Đề tài:** *Phát triển và nâng cao an toàn bảo mật cho website bán hàng thiết bị số DDH Electronics*

---

## 👥 THÀNH VIÊN NHÓM THỰC HIỆN

| STT | Họ và tên sinh viên | Mã sinh viên | Vai trò & Nhiệm vụ chính |
| :---: | :--- | :---: | :--- |
| **1** | **Nguyễn Đức Dương** | `23810310091` | **Trưởng nhóm:** Rà soát kiến trúc, gia cố mã nguồn Laravel 11 (OWASP Top 10), phòng chống SQLi, Brute Force, Upload Web Shell, phân quyền RBAC và tổng hợp báo cáo. |
| **2** | **Nguyễn Văn Đạt** | `23810310093` | Cấu hình máy chủ Web Reverse Proxy Nginx HTTPS (TLS 1.2/1.3), xây dựng bộ quy tắc phát hiện xâm nhập Snort IDS (`my_sql.rules`) và giám sát an ninh mạng thời gian thực. |
| **3** | **Nguyễn Văn Hiếu** | `23810310112` | Xây dựng kịch bản kiểm thử an ninh tự động hóa (cURL CLI), thực nghiệm đối chứng 6 bài test Before vs After và kiểm tra các tiêu đề bảo mật HTTP (Security Headers). |

---

## 🏛️ KIẾN TRÚC AN TOÀN ĐA TẦNG (DEFENSE-IN-DEPTH)

Dự án áp dụng mô hình bảo vệ chuyên sâu 4 lớp:
1. **Tầng Mạng (Network):** Giám sát lưu lượng gói tin thời gian thực bằng **Snort IDS v2.9** với bộ 5 quy tắc tùy biến (`my_sql.rules`), tự động bắt gói tin tấn công và phát chuông/cảnh báo đỏ.
2. **Tầng Dịch vụ (Web Server):** Cấu hình **Nginx Reverse Proxy** mã hóa truyền thông HTTPS (TLS 1.2/1.3), tự động chuyển hướng 301, chặn triệt để hành vi rà quét tệp tin nhạy cảm (`.env`, `.git`).
3. **Tầng Ứng dụng (Application):** Thiết lập **7 Tiêu đề bảo mật HTTP (Security Headers)**: `Content-Security-Policy (CSP)`, `X-Frame-Options: SAMEORIGIN`, `X-Content-Type-Options: nosniff`, `HSTS`; bảo vệ Session Cookie với cờ `HttpOnly` và `SameSite=Lax`.
4. **Tầng Mã nguồn & Dữ liệu (Source Code & DB):**
   * **Chống SQL Injection:** 100% truy vấn dùng **Eloquent ORM & Parameterized Prepared Statements**.
   * **Chống Brute Force:** Giới hạn tần suất **Rate Limiting (`throttle:5,0.33`)** kết hợp **Math CAPTCHA** động.
   * **Chống Web Shell / RCE:** Thuật toán tải tệp tin an toàn 5 lớp (Blacklist đuôi thực thi, Whitelist định dạng ảnh, đọc mã nhị phân MIME bằng `PHP Fileinfo` và đổi tên ngẫu nhiên bằng `UUID v4`).
   * **Kiểm soát truy cập (RBAC):** Middleware kiểm tra quyền quản trị `is_admin`, chặn đứng bằng mã lỗi **`HTTP 403 Forbidden`**.

---

## 🚀 HƯỚNG DẪN CÀI ĐẶT & CHẠY DỰ ÁN CHO THÀNH VIÊN NHÓM

### 1. Chuẩn bị môi trường:
* Cài đặt **XAMPP** (hoặc MySQL Server cổng 3306).
* PHP >= 8.2 (Khuyên dùng PHP 8.3).
* Composer & Node.js.

### 2. Cài đặt Cơ sở dữ liệu:
1. Mở **XAMPP** -> Bật service **MySQL**.
2. Truy cập phpMyAdmin (`http://localhost/phpmyadmin/`), tạo một cơ sở dữ liệu mới có tên:
   👉 **`powehzbb_Advanced_Web_development`** (Bảng mã: `utf8mb4_unicode_ci`).
3. Import file dữ liệu đã có sẵn trong dự án:
   📂 `DDH-Electronics/powehzbb_Advanced_Web_development.sql`

### 3. Cài đặt mã nguồn Web:
Mở cửa sổ dòng lệnh tại thư mục `DDH-Electronics/`:
```bash
# Cài đặt thư viện backend
composer install

# Tạo file cấu hình môi trường từ mẫu
cp .env.example .env

# Sinh khóa bí mật ứng dụng
php artisan key:generate

# Tạo liên kết lưu trữ công khai
php artisan storage:link
```

---

## ⚡ HỆ THỐNG KHỞI ĐỘNG & TEST 1 CÚ CLICK (3 FILE .BAT)

Nhóm đã đóng gói toàn bộ quy trình vận hành và kiểm thử vào 3 file script tự động hóa:

1. **`START_DEMO_WEB.bat`**:  
   * Tự động kiểm tra và khởi động MySQL XAMPP.
   * Khởi động máy chủ Laravel trên cổng chuyên dụng **`8088`** (`http://127.0.0.1:8088`).
   * Khởi động đường hầm công khai **Cloudflare Tunnel (HTTPS)** và tự động mở trình duyệt.

2. **`START_SNORT_IDS.bat`**:  
   * Khởi tạo bộ máy giám sát mạng Snort IDS nạp bộ quy tắc `my_sql.rules`.
   * Lắng nghe lưu lượng trên cổng mạng và nổ cảnh báo đỏ rực rỡ khi phát hiện payload tấn công.

3. **`TEST_ATTACKS_DEMO.bat`**:  
   * Menu tương tác tự động gửi 6 kịch bản tấn công đối chứng Before vs After:
     * **[1]** Test SQL Injection cơ bản (`' OR 1=1 --`) -> Kích hoạt Snort Rule 100001.
     * **[2]** Test SQLi trích xuất dữ liệu (`UNION SELECT`) -> Kích hoạt Snort Rule 100002.
     * **[3]** Test rà quét tệp nhạy cảm (`/.env`) -> Kích hoạt Snort Rule 100004.
     * **[4]** Test vét cạn mật khẩu Brute Force (`/login`) -> Kích hoạt Snort Rule 100005 + Khóa HTTP 429.
     * **[5]** Test phân quyền leo thang truy cập (`/admin`) -> Chặn đứng HTTP 403 Forbidden.
     * **[6]** Test tiêu đề an toàn trình duyệt (Security Headers & Cookie HttpOnly/SameSite).
     * **[7]** Chạy tự động liên hoàn cả 6 bài test.

---

## 📚 TÀI LIỆU ĐỒ ÁN ĐÍNH KÈM

* 📄 **File Báo cáo chính thức:** [`BaoCao_PTPMWebAT.pdf`](./BaoCao_PTPMWebAT.pdf) & [`BaoCao_PTPMWebAT.docx`](./BaoCao_PTPMWebAT.docx) (58 trang chuẩn EPU).
* 📝 **Tài liệu câu hỏi vấn đáp với Thầy Phương Văn Cảnh:** [`3_TRU_COT_DO_AN_WEB_AN_TOAN.txt`](./3_TRU_COT_DO_AN_WEB_AN_TOAN.txt)
* 🛠️ **Chi tiết các file mã nguồn đã gia cố:** [`CHI_TIET_SUA_DOI_BAO_MAT_WEB.md`](./CHI_TIET_SUA_DOI_BAO_MAT_WEB.md)
* 📜 **Tệp quy tắc phát hiện xâm nhập Snort:** [`my_sql.rules`](./my_sql.rules)

---
*© 2026 - 2027 Nhóm sinh viên D18CNPM2 - Đại học Điện lực (EPU)*
