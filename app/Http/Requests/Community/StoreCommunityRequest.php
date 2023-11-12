<?php

namespace App\Http\Requests\Community;

use Illuminate\Foundation\Http\FormRequest;

class StoreCommunityRequest extends FormRequest
{
    public function rules(): array
    {
        return [
            'name' => ['required', 'string'],
            'description' => ['nullable', 'string'],
            'alias' => ['nullable', 'string', 'unique:communities,alias'],
            'image' => ['nullable', 'mimes:jpg,jpeg,png,bmp,webp', 'max:20000'],
        ];
    }
}
