<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class SnortIdSimulator
{
    /**
     * Giám sát lưu lượng HTTP và kích hoạt cảnh báo Snort IDS theo thời gian thực
     * Mô phỏng chính xác hành vi của engine Snort với bộ rules my_sql.rules (EPU)
     */
    public function handle(Request $request, Closure $next): Response
    {
        $rawUrl = urldecode($request->fullUrl());
        $payloads = json_encode($request->all(), JSON_UNESCAPED_UNICODE);
        $fullPayload = $rawUrl . ' ' . $payloads;
        $clientIp = $request->ip() ?: '127.0.0.1';
        $clientPort = rand(49152, 65535);
        $timeStr = date('m/d-H:i:s.') . substr(str_pad(intval(microtime(true) * 1000000) % 1000000, 6, '0', STR_PAD_LEFT), 0, 6);

        // 1. Kiểm tra Rule 100001: SQL Injection ' OR 1=1 --
        if (stripos($fullPayload, "' OR 1=1") !== false || stripos($fullPayload, "' or 1=1") !== false) {
            $this->logAlert(
                "[**] [1:100001:2] [ALARM-SQLi] SQL Injection Attempt Detected: ' OR 1=1 -- [**]\n" .
                "[Classification: Web Application Attack] [Priority: 1]\n" .
                "{$timeStr} {$clientIp}:{$clientPort} -> 127.0.0.1:8000 TCP TTL:64 TOS:0x0 ID:12345 IpLen:20 DgmLen:528 DF\n" .
                "***A**** Seq: 0x1A2B3C4D  Ack: 0x5E6F7A8B  Win: 0xFAF0  TcpLen: 32\n" .
                "Payload Match: ' OR 1=1 --\n"
            );
        }

        // 2. Kiểm tra Rule 100002: UNION SELECT
        if (stripos($fullPayload, 'UNION') !== false && stripos($fullPayload, 'SELECT') !== false) {
            $this->logAlert(
                "[**] [1:100002:2] [ALARM-SQLi] SQL Injection UNION SELECT Data Extraction [**]\n" .
                "[Classification: Attempted Information Leak] [Priority: 1]\n" .
                "{$timeStr} {$clientIp}:{$clientPort} -> 127.0.0.1:8000 TCP TTL:64 TOS:0x0 ID:12346 IpLen:20 DgmLen:612 DF\n" .
                "***A**** Seq: 0x2A3B4C5D  Ack: 0x6E7F8A9B  Win: 0xFAF0  TcpLen: 32\n" .
                "Payload Match: UNION SELECT\n"
            );
        }

        // 3. Kiểm tra Rule 100003: DROP TABLE
        if (stripos($fullPayload, 'DROP TABLE') !== false) {
            $this->logAlert(
                "[**] [1:100003:2] [ALARM-SQLi] Destructive SQL Injection DROP TABLE [**]\n" .
                "[Classification: Attempted Administrator Privilege Gain] [Priority: 1]\n" .
                "{$timeStr} {$clientIp}:{$clientPort} -> 127.0.0.1:8000 TCP TTL:64 TOS:0x0 ID:12347 IpLen:20 DgmLen:540 DF\n" .
                "***A**** Seq: 0x3A4B5C6D  Ack: 0x7E8F9A0B  Win: 0xFAF0  TcpLen: 32\n" .
                "Payload Match: DROP TABLE\n"
            );
        }

        // 4. Kiểm tra Rule 100004: Sensitive File Scanning (.env / wp-admin)
        if (stripos($rawUrl, '.env') !== false || stripos($rawUrl, 'wp-admin') !== false) {
            $this->logAlert(
                "[**] [1:100004:1] [ALARM-PROBE] Sensitive File Access Attempt (.env / config) [**]\n" .
                "[Classification: Information Disclosure] [Priority: 2]\n" .
                "{$timeStr} {$clientIp}:{$clientPort} -> 127.0.0.1:8000 TCP TTL:64 TOS:0x0 ID:12348 IpLen:20 DgmLen:480 DF\n" .
                "***A**** Seq: 0x4A5B6C7D  Ack: 0x8E9F0A1B  Win: 0xFAF0  TcpLen: 32\n" .
                "Payload Match: .env\n"
            );
        }

        // 5. Kiểm tra Rule 100005: Brute Force Login POST flood
        if ($request->isMethod('POST') && $request->is('login')) {
            $loginCountKey = 'snort_bf_' . $clientIp;
            $attempts = cache()->get($loginCountKey, 0) + 1;
            cache()->put($loginCountKey, $attempts, now()->addSeconds(20));

            if ($attempts >= 5) {
                $this->logAlert(
                    "[**] [1:100005:1] [ALARM-BRUTEFORCE] High Frequency POST to /login (Brute Force Detected) [**]\n" .
                    "[Classification: Suspicious Login Activity] [Priority: 1]\n" .
                    "{$timeStr} {$clientIp}:{$clientPort} -> 127.0.0.1:8000 TCP TTL:64 TOS:0x0 ID:12349 IpLen:20 DgmLen:590 DF\n" .
                    "Threshold Exceeded: {$attempts} POST requests to /login within 20s (Rate Limit Active)\n"
                );
            }
        }

        return $next($request);
    }

    protected function logAlert(string $alertText): void
    {
        $logPath = storage_path('logs/snort_alerts.log');
        $divider = "--------------------------------------------------------------------------------\n";
        file_put_contents($logPath, $alertText . $divider, FILE_APPEND | LOCK_EX);
    }
}
