<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

// Public routes
Route::controller(\App\Http\Controllers\Api\UserController::class)->group(function () {
    Route::post('/login', 'login');
    Route::post('/register', 'register');
});
