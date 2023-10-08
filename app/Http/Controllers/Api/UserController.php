<?php

namespace App\Http\Controllers\Api;

use App\Http\ApiResponse;
use App\Http\Controllers\Controller;
use App\Http\Requests\User\LoginRequest;
use App\Http\Requests\User\RegisterRequest;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    public function login(LoginRequest $request)
    {
        if (Auth::attempt($request->validated())) {
            return ApiResponse::json(400, ["token" => $request->user()->generateToken()]);
        }
        return ApiResponse::error(401, "Invalid credentials");
    }

    public function register(RegisterRequest $request)
    {
        $user = User::create([
                'password' => Hash::make($request->password),
                'last_active_time' => now(),
            ] + $request->validated());
        return ApiResponse::json(201, $user);
    }
}
