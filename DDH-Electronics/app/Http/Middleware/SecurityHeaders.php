<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class SecurityHeaders
{
    /**
     * Handle an incoming request and attach OWASP security headers.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        /** @var Response $response */
        $response = $next($request);

        // 1. Chống Clickjacking (Không cho phép trang bị lồng vào iframe từ bên thứ 3)
        $response->headers->set('X-Frame-Options', 'SAMEORIGIN');

        // 2. Chống MIME-type sniffing (Ép trình duyệt tuân thủ MIME type từ server)
        $response->headers->set('X-Content-Type-Options', 'nosniff');

        // 3. Bảo vệ XSS trình duyệt cũ
        $response->headers->set('X-XSS-Protection', '1; mode=block');

        // 4. Kiểm soát thông tin Referrer khi chuyển hướng liên kết
        $response->headers->set('Referrer-Policy', 'strict-origin-when-cross-origin');

        // 5. Giới hạn quyền truy cập tính năng phần cứng nhạy cảm
        $response->headers->set('Permissions-Policy', 'camera=(), microphone=(), geolocation=()');

        // 6. Ép buộc sử dụng kết nối bảo mật HTTPS (HSTS)
        if ($request->isSecure() || $request->header('X-Forwarded-Proto') === 'https') {
            $response->headers->set('Strict-Transport-Security', 'max-age=31536000; includeSubDomains; preload');
        }

        // 7. Content-Security-Policy (CSP) - Kiểm soát nguồn tài nguyên hợp lệ
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
