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
            'alias' => ['nullable', 'string', 'unique:communities,alias', 'regex:/[a-zA-Z\d\_]{3,25}/'],
            'image' => ['nullable', 'mimes:jpg,jpeg,png,bmp,webp', 'max:20000'],
        ];
    }

    public function messages()
    {
        return [
            'regex:/[a-zA-Z\d]{3,25}/' => 'Поле может состоять из латинских символов, цифр и знака подчеркивания',
        ];
    }
}
