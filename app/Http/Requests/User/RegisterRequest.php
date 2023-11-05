<?php

namespace App\Http\Requests\User;

use Illuminate\Foundation\Http\FormRequest;

class RegisterRequest extends FormRequest
{
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'login' => ['required', 'string', 'unique:users,login'],
            'name' => ['required', 'string'],
            'surname' => ['required', 'string'],
            'password' => ['required', 'min:5', 'string'],
            'passwordConfirmation' => ['required', 'same:password'],
        ];
    }
}
