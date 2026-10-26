<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use Illuminate\Routing\Controllers\HasMiddleware;
use Illuminate\Routing\Controllers\Middleware;

class LoginController extends Controller implements HasMiddleware
{
    use AuthenticatesUsers;

    protected $redirectTo = '/';

    public static function middleware(): array
    {
        return [
            new Middleware('guest', except: ['logout']),
            // 🛡️ OWASP: Chống tấn công Brute-Force - Tối đa 5 lần thử / 20 giây (Môi trường Demo)
            new Middleware('throttle:5,0.33', only: ['login']),
        ];
    }

    /**
     * Hiển thị form đăng nhập kèm mã kiểm tra CAPTCHA chống Bot
     */
    public function showLoginForm()
    {
        $num1 = rand(2, 9);
        $num2 = rand(1, 9);
        session(['login_captcha_answer' => $num1 + $num2]);
        $captchaQuestion = "$num1 + $num2";

        return view('auth.login', compact('captchaQuestion'));
    }

    /**
     * Xác thực thông tin đăng nhập kèm CAPTCHA
     */
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
}
