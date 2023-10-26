<?php

namespace App\Http;

use Illuminate\Http\JsonResponse;

class ApiResponse
{
    public static function json($status, $data): JsonResponse
    {
        return response()->json($data, $status);
    }

    public static function error($status, $message, $errors = []): JsonResponse
    {
        $resp = [
            'error' => [
                'code' => $status,
                'message' => $message,
            ],
        ];
        if ($errors != []) {
            $resp['error']['errors'] = $errors;
        }
        return response()->json($resp, $status);
    }
}
