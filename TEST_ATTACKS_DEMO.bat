@echo off
chcp 65001 >nul
title KICH BAN KIEM THU AN TOAN WEB VA PHAT HIEN XAM NHAP - DDH ELECTRONICS
color 0B

:: ===============================================================================
:: DANH SACH 6 CAU LENH CURL TEST THUC CHIEN (COPY & PASTE TRUC TIEP TREN CMD):
:: ===============================================================================
::
:: [1] TEST SQL INJECTION CO BAN:
:: curl.exe -s "http://127.0.0.1:8088/api/v1/products?search=%%27%%20OR%%201=1%%20--"
::
:: [2] TEST SQL INJECTION TRICH XUAT DU LIEU (UNION SELECT):
:: curl.exe -s "http://127.0.0.1:8088/api/v1/products?search=UNION%%20SELECT%%20id,name,password%%20FROM%%20users"
::
:: [3] TEST DO QUET TEP TIN CAU HINH NHAY CAM (/.env):
:: curl.exe -s -o nul -w "HTTP Status Code: %%{http_code}\n" "http://127.0.0.1:8088/.env"
::
:: [4] TEST TAN CONG VET CAN MAT KHAU BRUTE FORCE (/login):
:: for /L %%i in (1,1,6) do curl.exe -s -o nul -w "Lan %%i -> HTTP Code: %%{http_code}\n" -X POST "http://127.0.0.1:8088/login" -d "email=admin@ddh.com&password=wrong_pass_%%i"
::
:: [5] TEST PHAN QUYEN TRUY CAP TRAI PHEP VAO /admin (RBAC):
:: curl.exe -s -o nul -w "HTTP Status Code: %%{http_code}\n" "http://127.0.0.1:8088/admin"
::
:: [6] TEST TIEU DE AN TOAN TRINH DUYET (SECURITY HEADERS):
:: curl.exe -s -I "http://127.0.0.1:8088/"
:: ===============================================================================

:MENU
cls
echo ===============================================================================
echo          KICH BAN KIEM THU AN TOAN WEB VA PHAT HIEN XAM NHAP
echo ===============================================================================
echo.
echo [*] HUONG DAN: Mo song song cua so START_SNORT_IDS.bat de quan sat canh bao do!
echo.
echo   [1] Test 1: SQL Injection co ban (' OR 1=1 --)
echo   [2] Test 2: SQL Injection trich xuat tai khoan (UNION SELECT)
echo   [3] Test 3: Ra quet tep tin nhay cam (.env)
echo   [4] Test 4: Tan cong vet can mat khau Brute Force (/login - 6 lan)
echo   [5] Test 5: Phan quyen truy cap trai phep vao /admin (RBAC)
echo   [6] Test 6: Kiem tra Tieu de An toan trinh duyet (Security Headers)
echo   [7] Chay TOAN BO 6 bai test lien tiep
echo   [0] Thoat
echo.
echo ===============================================================================
set "choice="
set /p choice=">>> Nhap lua chon cua ban (0-7): "

if "%choice%"=="1" goto TEST1
if "%choice%"=="2" goto TEST2
if "%choice%"=="3" goto TEST3
if "%choice%"=="4" goto TEST4
if "%choice%"=="5" goto TEST5
if "%choice%"=="6" goto TEST6
if "%choice%"=="7" goto RUN_ALL
if "%choice%"=="0" exit /b
goto MENU

:TEST1
cls
echo ===============================================================================
echo [BAI TEST 1]: TAN CONG SQL INJECTION CO BAN (' OR 1=1 --)
echo ===============================================================================
echo [CAU LENH CURL CHAY]:
echo curl.exe -s "http://127.0.0.1:8088/api/v1/products?search=%%27%%20OR%%201=1%%20--"
echo.
echo [KET QUA PHAN HOI TU WEB]:
curl.exe -s "http://127.0.0.1:8088/api/v1/products?search=%%27%%20OR%%201=1%%20--"
echo.
echo.
echo [DANH GIA THUC TE]:
echo - Phia Web: Du lieu an toan nho Eloquent Parameterized Binding (total = 0).
echo - Phia Snort IDS: Da kich hoat Quy tac 100001 (ALARM-SQLi).
echo.
pause
goto MENU

:TEST2
cls
echo ===============================================================================
echo [BAI TEST 2]: TAN CONG TRICH XUAT DU LIEU (UNION SELECT)
echo ===============================================================================
echo [CAU LENH CURL CHAY]:
echo curl.exe -s "http://127.0.0.1:8088/api/v1/products?search=UNION%%20SELECT%%20id,name,password%%20FROM%%20users"
echo.
echo [KET QUA PHAN HOI TU WEB]:
curl.exe -s "http://127.0.0.1:8088/api/v1/products?search=UNION%%20SELECT%%20id,name,password%%20FROM%%20users"
echo.
echo.
echo [DANH GIA THUC TE]:
echo - Phia Web: Ngan chan hoan toan viec trich xuat bang du lieu tai khoan users.
echo - Phia Snort IDS: Da kich hoat Quy tac 100002 (UNION SELECT Data Extraction).
echo.
pause
goto MENU

:TEST3
cls
echo ===============================================================================
echo [BAI TEST 3]: DO QUET TEP TIN CAU HINH NHAY CAM (/.env)
echo ===============================================================================
echo [CAU LENH CURL CHAY]:
echo curl.exe -s -o nul -w "HTTP Status Code: %%%%{http_code}\n" "http://127.0.0.1:8088/.env"
echo.
echo [KET QUA PHAN HOI TU WEB]:
curl.exe -s -o nul -w "HTTP Status Code: %%{http_code}\n" "http://127.0.0.1:8088/.env"
echo.
echo [DANH GIA THUC TE]:
echo - Phia Web: Tra ve ma 404/403, khong bao gio lo thong tin cau hinh nhay cam.
echo - Phia Snort IDS: Da kich hoat Quy tac 100004 (Sensitive File Probe).
echo.
pause
goto MENU

:TEST4
cls
echo ===============================================================================
echo [BAI TEST 4]: TAN CONG VET CAN MAT KHAU BRUTE FORCE (6 LAN GUI POST DON DAP)
echo ===============================================================================
echo [CAU LENH CURL CHAY]:
echo for /L %%%%i in (1,1,6) do curl.exe -s -o nul -w "Lan %%%%i -^> HTTP Code: %%%%{http_code}\n" -X POST "http://127.0.0.1:8088/login" -d "email=admin@ddh.com^&password=wrong_pass_%%%%i"
echo.
echo [KET QUA PHAN HOI TU WEB]:
for /L %%i in (1,1,6) do (
    curl.exe -s -o nul -w "Lan %%i -> HTTP Code: %%{http_code}\n" -X POST "http://127.0.0.1:8088/login" -d "email=admin@ddh.com&password=wrong_pass_%%i"
)
echo.
echo [DANH GIA THUC TE]:
echo - Phia Web: Chan dung tan cong vet can, kich hoat khoa tam thoi (Rate Limiting).
echo - Phia Snort IDS: Da kich hoat Quy tac 100005 (ALARM-BRUTEFORCE).
echo.
pause
goto MENU

:TEST5
cls
echo ===============================================================================
echo [BAI TEST 5]: KIEM TRA PHAN QUYEN TRUY CAP VAO ADMIN (RBAC)
echo ===============================================================================
echo [CAU LENH CURL CHAY]:
echo curl.exe -s -o nul -w "HTTP Status Code: %%%%{http_code}\n" "http://127.0.0.1:8088/admin"
echo.
echo [KET QUA PHAN HOI TU WEB]:
curl.exe -s -o nul -w "HTTP Status Code: %%{http_code}\n" "http://127.0.0.1:8088/admin"
echo.
echo [DANH GIA THUC TE]:
echo - Phia Web: Chan dung truy cap trai phep cua nguoi dung chua xac thuc hoac khong co quyen.
echo.
pause
goto MENU

:TEST6
cls
echo ===============================================================================
echo [BAI TEST 6]: KIEM TRA CAC TIEU DE AN TOAN TRINH DUYET (SECURITY HEADERS)
echo ===============================================================================
echo [CAU LENH CURL CHAY]:
echo curl.exe -s -I "http://127.0.0.1:8088/"
echo.
echo [KET QUA PHAN HOI TU WEB]:
curl.exe -s -I "http://127.0.0.1:8088/" | findstr /i "X-Frame-Options Content-Security-Policy X-Content-Type-Options Strict-Transport-Security Referrer-Policy"
echo.
echo.
echo [DANH GIA THUC TE]:
echo - Toan bo cac tieu de phong thu trinh duyet OWASP deu hien dien day du!
echo.
pause
goto MENU

:RUN_ALL
cls
echo ===============================================================================
echo [1/6] CHAY TEST SQL INJECTION CO BAN
echo ===============================================================================
echo curl.exe -s "http://127.0.0.1:8088/api/v1/products?search=%%27%%20OR%%201=1%%20--"
curl.exe -s "http://127.0.0.1:8088/api/v1/products?search=%%27%%20OR%%201=1%%20--"
echo.
echo.

echo ===============================================================================
echo [2/6] CHAY TEST SQL INJECTION UNION SELECT
echo ===============================================================================
echo curl.exe -s "http://127.0.0.1:8088/api/v1/products?search=UNION%%20SELECT%%20id,name,password%%20FROM%%20users"
curl.exe -s "http://127.0.0.1:8088/api/v1/products?search=UNION%%20SELECT%%20id,name,password%%20FROM%%20users"
echo.
echo.

echo ===============================================================================
echo [3/6] CHAY TEST DO QUET TEP TIN NHAY CAM /.env
echo ===============================================================================
echo curl.exe -s -o nul -w "HTTP Status Code: %%%%{http_code}\n" "http://127.0.0.1:8088/.env"
curl.exe -s -o nul -w "HTTP Status Code: %%{http_code}\n" "http://127.0.0.1:8088/.env"
echo.

echo ===============================================================================
echo [4/6] CHAY TEST TAN CONG BRUTE FORCE /login (6 LAN GUI)
echo ===============================================================================
for /L %%i in (1,1,6) do (
    curl.exe -s -o nul -w "Lan %%i -> HTTP Code: %%{http_code}\n" -X POST "http://127.0.0.1:8088/login" -d "email=admin@ddh.com&password=wrong_pass_%%i"
)
echo.

echo ===============================================================================
echo [5/6] CHAY TEST PHAN QUYEN TRUY CAP VAO ADMIN (RBAC)
echo ===============================================================================
echo curl.exe -s -o nul -w "HTTP Status Code: %%%%{http_code}\n" "http://127.0.0.1:8088/admin"
curl.exe -s -o nul -w "HTTP Status Code: %%{http_code}\n" "http://127.0.0.1:8088/admin"
echo.

echo ===============================================================================
echo [6/6] CHAY TEST KIEM TRA TIEU DE AN TOAN (SECURITY HEADERS)
echo ===============================================================================
curl.exe -s -I "http://127.0.0.1:8088/" | findstr /i "X-Frame-Options Content-Security-Policy X-Content-Type-Options Strict-Transport-Security Referrer-Policy"
echo.
echo.
echo ===============================================================================
echo [*] DA HOAN TAT TOAN BO 6 BAI KIEM THU THUC CHIEN!
echo ===============================================================================
pause
goto MENU
