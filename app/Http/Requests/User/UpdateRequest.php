<?php

namespace App\Http\Requests\User;

use Illuminate\Foundation\Http\FormRequest;

class UpdateRequest extends FormRequest
{
    public function rules(): array
    {
        return [
            'name' => ['required', 'string'],
            'surname' => ['required', 'string'],
            'birthdate' => ['nullable', 'date'],
            'status' => ['nullable', 'string'],
            'job' => ['nullable', 'string'],
            'image' => ['nullable', 'file', 'mimes:png,jpg,jpeg'],
            'education' => ['nullable', 'string'],
            'country' => ['nullable', 'string'],
            'city' => ['nullable', 'string'],
            'new_password' => ['sometimes', 'min:5', 'string'],
            'password' => ['required', 'string'],
        ];
    }
}
