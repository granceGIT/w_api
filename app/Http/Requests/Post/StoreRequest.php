<?php

namespace App\Http\Requests\Post;

use Illuminate\Foundation\Http\FormRequest;

class StoreRequest extends FormRequest
{
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'content' => ['required_without:images', 'string'],
            'images' => ['nullable', 'array'],
            'images.*' => ['required', 'mimes:jpg,jpeg,png,bmp,webp', 'max:20000'],
            'community_id' => ['nullable', 'exists:communities,id'],
        ];
    }
}
