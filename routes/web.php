<?php

use App\Http\Controllers\API\Controller;
use Illuminate\Support\Facades\Route;

Route::fallback([Controller::class, 'fallback']);
