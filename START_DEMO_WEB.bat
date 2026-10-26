@echo off
:: [EN] Set console code page to UTF-8 for Vietnamese display
:: [VI] Thiet lap bang ma UTF-8 de hien thi tieng Viet tren Command Prompt
chcp 65001 >nul
title DDH-ELECTRONICS - HE THONG KHOI DONG TU DONG
color 0A

echo =====================================================================
echo    HE THONG KHOI DONG TU DONG - DDH ELECTRONICS (LARAVEL 11)
echo =====================================================================
echo.

:: =====================================================================
:: 1. DATABASE SERVICE (MYSQL)
:: [EN] Check if MySQL is running on port 3306. If not, auto-start XAMPP MySQL.
:: [VI] Kiem tra MySQL tren cong 3306. Neu chua chay, tu dong khoi dong tu XAMPP.
:: =====================================================================
echo [*] Dang kiem tra trang thai Co so du lieu MySQL (Port 3306)...
netstat -ano | findstr :3306 >nul
if %errorlevel% neq 0 (
    echo [!] MySQL chua chay. Dang tu dong khoi dong MySQL tu XAMPP...
    if exist "C:\xampp\mysql_start.bat" (
        start "XAMPP MySQL Service" /min "C:\xampp\mysql_start.bat"
        timeout /t 3 /nobreak >nul
        echo [OK] Da khoi dong MySQL thanh cong!
    ) else (
        echo [CANH BAO] Khong tim thay XAMPP tai C:\xampp. Vui long bat MySQL bang tay!
    )
) else (
    echo [OK] Co so du lieu MySQL da san sang!
)
echo.

:: =====================================================================
:: 2. APPLICATION SERVER (LARAVEL)
:: [EN] Start Laravel 11 local development server on port 8088
:: [VI] Khoi dong may chu web noi bo Laravel 11 tai cong 8088
:: =====================================================================
echo [*] Dang khoi dong Web Server Laravel 11 (Port 8088)...
start "1. Laravel 11 Server (Port 8088)" cmd /k "cd /d "%~dp0DDH-Electronics" && php artisan serve"
timeout /t 2 /nobreak >nul
echo [OK] Web Server da khoi dong thanh cong tai: http://127.0.0.1:8088
echo.

:: =====================================================================
:: 3. PUBLIC SECURE TUNNEL (CLOUDFLARE)
:: [EN] Launch Cloudflare Quick Tunnel to expose port 8088 with public HTTPS
:: [VI] Khoi dong duong ham Cloudflare cap link HTTPS cong khai ra Internet
:: =====================================================================
echo [*] Dang tao duong ham HTTPS Cloudflare Tunnel...
start "2. Cloudflare HTTPS Tunnel" cmd /k "cloudflared tunnel --url http://127.0.0.1:8088"
timeout /t 2 /nobreak >nul
echo [OK] Duong ham Cloudflare Tunnel da san sang!
echo.

:: =====================================================================
:: 4. BROWSER LAUNCH
:: [EN] Automatically open the local website in default web browser
:: [VI] Tu dong mo trang web tren trinh duyet mac dinh
:: =====================================================================
echo [*] Dang mo trinh duyet...
start http://127.0.0.1:8088

echo =====================================================================
echo    DA KHOI DONG THANH CONG TOAN BO HE THONG!
echo    - Truy cap noi bo (Local):    http://127.0.0.1:8088
echo    - Truy cap tu xa (Internet):  Lay link HTTPS tai cua so Cloudflare
echo    - Luu y: Dong cac cua so con neu muon tat may chu.
echo =====================================================================
pause
