<?php

namespace App\Exceptions;

use App\Http\ApiResponse;
use Illuminate\Auth\Access\AuthorizationException;
use Illuminate\Auth\AuthenticationException;
use Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;
use Symfony\Component\HttpKernel\Exception\HttpException;
use Throwable;

class Handler extends ExceptionHandler
{
    /**
     * The list of the inputs that are never flashed to the session on validation exceptions.
     *
     * @var array<int, string>
     */
    protected $dontFlash = [
        'current_password',
        'password',
        'password_confirmation',
    ];

    /**
     * Register the exception handling callbacks for the application.
     */
    public function register(): void
    {
        $this->reportable(function (Throwable $e) {
            //
        });

        // Validation exceptions
        $this->renderable(function (ValidationException $e, Request $request) {
            if ($request->is('api/*')) {
                return ApiResponse::error($e->status, "Validation error", $e->errors());
            }
        });

        // Http exceptions
        $this->renderable(function (HttpException $e, Request $request) {
            if ($request->is('api/*')) {
                return ApiResponse::error($e->getStatusCode(), $e->getMessage());
            }
        });

        // Authentication exceptions
        $this->renderable(function (AuthenticationException $e, Request $request) {
            if ($request->is('api/*')) {
                return ApiResponse::error(401, $e->getMessage());
            }
        });

        // Authorization exceptions
        $this->renderable(function (AuthorizationException $e, Request $request) {
            if ($request->is('api/*')) {
                return ApiResponse::error(403, $e->getMessage());
            }
        });

        //Other (server) exceptions
//        $this->renderable(function (\Exception $e, Request $request) {
//            if ($request->is('api/*')) {
//                return ApiResponse::error(500, "Что-то пошло не так...");
//            }
//        });
    }
}
