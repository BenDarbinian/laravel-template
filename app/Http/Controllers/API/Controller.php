<?php

declare(strict_types=1);

namespace App\Http\Controllers\API;

use Illuminate\Http\JsonResponse;

class Controller extends \App\Http\Controllers\Controller
{
    /**
     * @return JsonResponse
     */
    public function fallback(): JsonResponse
    {
        return response()->json([
            'code' => JsonResponse::HTTP_NOT_FOUND,
            'message' => 'Endpoint not found.',
        ], JsonResponse::HTTP_NOT_FOUND);
    }
}

