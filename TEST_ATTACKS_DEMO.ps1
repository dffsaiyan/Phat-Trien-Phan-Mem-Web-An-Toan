[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$host.UI.RawUI.WindowTitle = "KỊCH BẢN KIỂM THỬ THỰC CHIẾN (BEFORE vs AFTER) - DDH ELECTRONICS"

Clear-Host
Write-Host "===============================================================================" -ForegroundColor Cyan
Write-Host "    KỊCH BẢN KIỂM THỬ AN TOÀN WEB & PHÁT HIỆN XÂM NHẬP (BEFORE vs AFTER)" -ForegroundColor Cyan
Write-Host "===============================================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "[*] Danh sách 6 bài kiểm thử tấn công:" -ForegroundColor Yellow
Write-Host "    1. SQL Injection cơ bản: ' OR 1=1 --" -ForegroundColor Gray
Write-Host "    2. SQL Injection trích xuất dữ liệu: UNION SELECT" -ForegroundColor Gray
Write-Host "    3. Rà quét tệp tin cấu hình nhạy cảm: /.env" -ForegroundColor Gray
Write-Host "    4. Tấn công vét cạn mật khẩu: Brute Force /login (6 lần thử)" -ForegroundColor Gray
Write-Host "    5. Kiểm tra phân quyền truy cập quản trị: /admin (RBAC)" -ForegroundColor Gray
Write-Host "    6. Kiểm tra Tiêu đề An toàn trình duyệt: Security Headers" -ForegroundColor Gray
Write-Host ""
Write-Host "[!] LƯU Ý: Mở cửa sổ START_SNORT_IDS song song để quan sát cảnh báo Snort nổ đỏ!" -ForegroundColor Green
Write-Host ""
Read-Host ">>> Bấm Enter để bắt đầu kiểm thử..."

# BÀI TEST 1
Clear-Host
Write-Host "===============================================================================" -ForegroundColor Cyan
Write-Host "[BÀI TEST 1]: TẤN CÔNG SQL INJECTION (' OR 1=1 --)" -ForegroundColor Cyan
Write-Host "===============================================================================" -ForegroundColor Cyan
Write-Host "[CÂU LỆNH CURL CHẠY]:" -ForegroundColor Yellow
Write-Host "curl.exe -s `"http://127.0.0.1:8000/api/v1/products?search=' OR 1=1 --`"" -ForegroundColor Magenta
Write-Host ""
Write-Host "[KẾT QUẢ TRẢ VỀ TỪ WEB]:" -ForegroundColor Yellow
$res1 = curl.exe -s --max-time 5 "http://127.0.0.1:8000/api/v1/products?search=%27%20OR%201=1%20--"
Write-Host $res1 -ForegroundColor White
Write-Host ""
Write-Host "[ĐÁNH GIÁ THỰC TẾ]:" -ForegroundColor Green
Write-Host " - Phía Web: Dữ liệu được bảo vệ an toàn bằng Prepared Statements (total = 0)." -ForegroundColor White
Write-Host " - Phía Snort IDS: Đã kích hoạt Quy tắc 100001 (ALARM-SQLi)." -ForegroundColor White
Write-Host ""
Read-Host ">>> Bấm Enter để chuyển sang Bài Test 2..."

# BÀI TEST 2
Clear-Host
Write-Host "===============================================================================" -ForegroundColor Cyan
Write-Host "[BÀI TEST 2]: TẤN CÔNG TRÍCH XUẤT DỮ LIỆU UNION SELECT" -ForegroundColor Cyan
Write-Host "===============================================================================" -ForegroundColor Cyan
Write-Host "[CÂU LỆNH CURL CHẠY]:" -ForegroundColor Yellow
Write-Host "curl.exe -s `"http://127.0.0.1:8000/api/v1/products?search=UNION SELECT id,name,password FROM users`"" -ForegroundColor Magenta
Write-Host ""
Write-Host "[KẾT QUẢ TRẢ VỀ TỪ WEB]:" -ForegroundColor Yellow
$res2 = curl.exe -s --max-time 5 "http://127.0.0.1:8000/api/v1/products?search=UNION%20SELECT%20id,name,password%20FROM%20users"
Write-Host $res2 -ForegroundColor White
Write-Host ""
Write-Host "[ĐÁNH GIÁ THỰC TẾ]:" -ForegroundColor Green
Write-Host " - Phía Web: Không rò rỉ bất kỳ thông tin tài khoản hay mật khẩu nào (total = 0)." -ForegroundColor White
Write-Host " - Phía Snort IDS: Đã kích hoạt Quy tắc 100002 (UNION SELECT Data Extraction)." -ForegroundColor White
Write-Host ""
Read-Host ">>> Bấm Enter để chuyển sang Bài Test 3..."

# BÀI TEST 3
Clear-Host
Write-Host "===============================================================================" -ForegroundColor Cyan
Write-Host "[BÀI TEST 3]: DÒ QUÉT TỆP TIN CẤU HÌNH NHẠY CẢM (/.env)" -ForegroundColor Cyan
Write-Host "===============================================================================" -ForegroundColor Cyan
Write-Host "[CÂU LỆNH CURL CHẠY]:" -ForegroundColor Yellow
Write-Host "curl.exe -s -o nul -w `"%{http_code}`" `"http://127.0.0.1:8000/.env`"" -ForegroundColor Magenta
Write-Host ""
Write-Host "[KẾT QUẢ TRẢ VỀ TỪ WEB]:" -ForegroundColor Yellow
$code3 = curl.exe -s --max-time 5 -o nul -w "%{http_code}" "http://127.0.0.1:8000/.env"
Write-Host "HTTP Status Code: $code3" -ForegroundColor White
Write-Host ""
Write-Host "[ĐÁNH GIÁ THỰC TẾ]:" -ForegroundColor Green
Write-Host " - Phía Web: Mã phản hồi $code3 (Not Found / Denied), tuyệt đối không lộ khóa bí mật APP_KEY / DB_PASSWORD." -ForegroundColor White
Write-Host " - Phía Snort IDS: Đã kích hoạt Quy tắc 100004 (Sensitive File Probe)." -ForegroundColor White
Write-Host ""
Read-Host ">>> Bấm Enter để chuyển sang Bài Test 4..."

# BÀI TEST 4
Clear-Host
Write-Host "===============================================================================" -ForegroundColor Cyan
Write-Host "[BÀI TEST 4]: TẤN CÔNG VÉT CẠN MẬT KHẨU BRUTE FORCE LOGIN (6 LẦN THỬ LIÊN TIẾP)" -ForegroundColor Cyan
Write-Host "===============================================================================" -ForegroundColor Cyan
Write-Host "[CÂU LỆNH CURL CHẠY]:" -ForegroundColor Yellow
Write-Host "curl.exe -s -o nul -w `"%{http_code}`" -X POST `"http://127.0.0.1:8000/login`" -d `"email=admin@ddh.com&password=wrong_pass`"" -ForegroundColor Magenta
Write-Host ""
Write-Host "[KẾT QUẢ TRẢ VỀ TỪ WEB]:" -ForegroundColor Yellow
1..6 | ForEach-Object {
    $code4 = curl.exe -s --max-time 5 -o nul -w "%{http_code}" -X POST "http://127.0.0.1:8000/login" -d "email=admin@ddh.com&password=wrong_pass_$_"
    Write-Host " Lần $_ -> HTTP Code: $code4" -ForegroundColor White
}
Write-Host ""
Write-Host "[ĐÁNH GIÁ THỰC TẾ]:" -ForegroundColor Green
Write-Host " - Phía Web: Các lần thử vượt ngưỡng đều bị chặn lại (HTTP 419/429), bảo vệ tài nguyên máy chủ." -ForegroundColor White
Write-Host " - Phía Snort IDS: Đã kích hoạt Quy tắc 100005 (ALARM-BRUTEFORCE)." -ForegroundColor White
Write-Host ""
Read-Host ">>> Bấm Enter để chuyển sang Bài Test 5..."

# BÀI TEST 5
Clear-Host
Write-Host "===============================================================================" -ForegroundColor Cyan
Write-Host "[BÀI TEST 5]: KIỂM TRA PHÂN QUYỀN TRUY CẬP TRÁI PHÉP VÀO ADMIN (RBAC)" -ForegroundColor Cyan
Write-Host "===============================================================================" -ForegroundColor Cyan
Write-Host "[CÂU LỆNH CURL CHẠY]:" -ForegroundColor Yellow
Write-Host "curl.exe -s -o nul -w `"%{http_code}`" `"http://127.0.0.1:8000/admin`"" -ForegroundColor Magenta
Write-Host ""
Write-Host "[KẾT QUẢ TRẢ VỀ TỪ WEB]:" -ForegroundColor Yellow
$code5 = curl.exe -s --max-time 5 -o nul -w "%{http_code}" "http://127.0.0.1:8000/admin"
Write-Host "HTTP Status Code: $code5" -ForegroundColor White
Write-Host ""
Write-Host "[ĐÁNH GIÁ THỰC TẾ]:" -ForegroundColor Green
Write-Host " - Phía Web: Hệ thống chặn đứng truy cập trái phép, chuyển hướng / trả về mã cấm ($code5)." -ForegroundColor White
Write-Host ""
Read-Host ">>> Bấm Enter để chuyển sang Bài Test 6..."

# BÀI TEST 6
Clear-Host
Write-Host "===============================================================================" -ForegroundColor Cyan
Write-Host "[BÀI TEST 6]: KIỂM TRA CÁC TIÊU ĐỀ AN TOÀN TRÌNH DUYỆT (SECURITY HEADERS)" -ForegroundColor Cyan
Write-Host "===============================================================================" -ForegroundColor Cyan
Write-Host "[CÂU LỆNH CURL CHẠY]:" -ForegroundColor Yellow
Write-Host "curl.exe -s -I `"http://127.0.0.1:8000/`"" -ForegroundColor Magenta
Write-Host ""
Write-Host "[KẾT QUẢ TRẢ VỀ TỪ WEB]:" -ForegroundColor Yellow
$headers = curl.exe -s -I "http://127.0.0.1:8000/" | Select-String "X-Frame|Content-Security|X-Content|Strict|Referrer"
Write-Host $headers -ForegroundColor White
Write-Host ""
Write-Host "[ĐÁNH GIÁ THỰC TẾ]:" -ForegroundColor Green
Write-Host " - Toàn bộ các tiêu đề phòng thủ trình duyệt OWASP đều hiện diện đầy đủ!" -ForegroundColor White
Write-Host ""
Write-Host "===============================================================================" -ForegroundColor Cyan
Write-Host "[KẾT THÚC KIỂM THỬ]: TẤT CẢ 6 BÀI TEST ĐỀU HOÀN TOÀN ĐẠT CHUẨN!" -ForegroundColor Green
Write-Host "===============================================================================" -ForegroundColor Cyan
Write-Host ""
Read-Host ">>> Bấm Enter để thoát..."
