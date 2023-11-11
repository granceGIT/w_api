<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

// Public routes
Route::controller(\App\Http\Controllers\Api\UserController::class)->group(function () {
    Route::post('/login', 'login');
    Route::post('/register', 'register');

    Route::get('/users/{user}', 'show');
    Route::get('/users', 'index');
});

Route::controller(\App\Http\Controllers\Api\PostController::class)->group(function () {
    Route::get('/posts', 'index');
    Route::get('/posts/{post}', 'show');
    Route::get('/users/{user}/posts', 'userPosts');
    Route::get('/communities/{community}/posts', 'communityPosts');
});

Route::controller(\App\Http\Controllers\Api\PostController::class)->group(function () {
    Route::get('/communities', 'index');
    Route::get('/communities/{community}', 'show');
    Route::post('/communities/{community}', 'store');
    Route::put('/communities/{community}', 'update');
    Route::delete('/communities/{community}', 'destroy');
});

Route::middleware('auth:sanctum')->group(function () {
    Route::controller(\App\Http\Controllers\Api\UserController::class)->group(function () {
        Route::get('/profile', 'profile');
        Route::put('/profile', 'update');
        Route::post('/profile/addFriend', 'addFriend');

        Route::get('/logout', 'logout');
    });

    Route::controller(\App\Http\Controllers\Api\PostController::class)->group(function () {
        Route::post('/posts', 'store');

        Route::delete('/posts/{post}', 'destroy');
        Route::post('/posts/{post}/react', 'react');
    });
});
