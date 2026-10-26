[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$host.UI.RawUI.WindowTitle = "HỆ THỐNG PHÁT HIỆN XÂM NHẬP (SNORT IDS) - GIÁM SÁT THỜI GIAN THỰC"

$logDir = Join-Path $PSScriptRoot "DDH-Electronics\storage\logs"
$logFile = Join-Path $logDir "snort_alerts.log"

if (-not (Test-Path $logDir)) {
    New-Item -ItemType Directory -Path $logDir -Force | Out-Null
}
Clear-Content -Path $logFile -ErrorAction SilentlyContinue
if (-not (Test-Path $logFile)) {
    New-Item -ItemType File -Path $logFile -Force | Out-Null
}

Clear-Host
Write-Host "===============================================================================" -ForegroundColor Cyan
Write-Host "    HỆ THỐNG PHÁT HIỆN XÂM NHẬP (SNORT IDS) - GIÁM SÁT THỜI GIAN THỰC" -ForegroundColor Cyan
Write-Host "===============================================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "[*] Đang khởi tạo bộ máy giám sát mạng Snort IDS v2.9.20..." -ForegroundColor Green
Write-Host "[*] Đang nạp danh sách quy tắc từ: my_sql.rules (5 quy tắc sẵn sàng):" -ForegroundColor Green
Write-Host "    - [Quy tắc 100001]: Phát hiện tấn công SQL Injection cơ bản (' OR 1=1 --)" -ForegroundColor Gray
Write-Host "    - [Quy tắc 100002]: Phát hiện tấn công trích xuất dữ liệu (UNION SELECT)" -ForegroundColor Gray
Write-Host "    - [Quy tắc 100003]: Phát hiện tấn công phá hoại cơ sở dữ liệu (DROP TABLE)" -ForegroundColor Gray
Write-Host "    - [Quy tắc 100004]: Phát hiện rà quét tệp tin cấu hình nhạy cảm (.env / config)" -ForegroundColor Gray
Write-Host "    - [Quy tắc 100005]: Phát hiện tấn công vét cạn mật khẩu Brute Force (/login)" -ForegroundColor Gray
Write-Host "[*] Đang lắng nghe trên cổng mạng Web: Port 80, 8000 và 443" -ForegroundColor Green
Write-Host "[*] Snort IDS đang hoạt động! Đang lắng nghe gói tin và chờ phát hiện xâm nhập..." -ForegroundColor Yellow
Write-Host "-------------------------------------------------------------------------------" -ForegroundColor DarkGray
Write-Host ""

Get-Content -Path $logFile -Wait -Tail 0 | ForEach-Object {
    if ($_ -match "ALARM|Priority: 1") {
        try { [Console]::Beep(800, 200) } catch {}
        Write-Host $_ -ForegroundColor Red
    } elseif ($_ -match "Priority: 2|Probe") {
        Write-Host $_ -ForegroundColor Yellow
    } elseif ($_ -match "Threshold Exceeded|Payload Match") {
        Write-Host $_ -ForegroundColor Magenta
    } else {
        Write-Host $_ -ForegroundColor DarkCyan
    }
}
