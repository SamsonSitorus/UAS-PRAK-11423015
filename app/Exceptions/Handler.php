<?php

namespace App\Exceptions;

use Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;
use Throwable;
use Illuminate\Auth\AuthenticationException;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
use Symfony\Component\HttpKernel\Exception\HttpException;

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
    }

    /**
     * Render an exception into an HTTP response.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Throwable  $exception
     * @return \Illuminate\Http\Response
     */
    public function render($request, Throwable $exception)
    {
        $isJson = $request->expectsJson();

        if ($exception instanceof AuthenticationException) {
            return $this->handleException($exception, $isJson, 'Unauthenticated', 401);
        }

        if ($exception instanceof ModelNotFoundException) {
            return $this->handleException($exception, $isJson, 'Resource not found', 404);
        }

        if ($exception instanceof NotFoundHttpException) {
            return $this->handleException($exception, $isJson, 'Not Found', 404);
        }

        if ($exception instanceof HttpException) {
            return $this->handleException($exception, $isJson, $exception->getMessage(), $exception->getStatusCode());
        }

        return $this->handleException($exception, $isJson, 'Something went wrong', 500);
    }

    protected function handleException(Throwable $exception, bool $isJson, string $message, int $statusCode)
    {
        if ($isJson) {
            return response()->json(['error' => $message], $statusCode);
        }

        return response()->view('errors.custom', [
            'message' => $message,
            'exception' => $exception,
        ], $statusCode);
    }
}
