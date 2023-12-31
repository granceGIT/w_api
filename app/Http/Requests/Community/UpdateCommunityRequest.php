<?php

namespace App\Http\Requests\Community;

use App\Models\Community;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class UpdateCommunityRequest extends FormRequest
{
    public function authorize()
    {
        return $this->user()->id === $this->community->user_id;
    }

    public function rules(): array
    {
        return [
            'name' => ['sometimes', 'string'],
            'description' => ['sometimes', 'string'],
            'alias' => ['sometimes', 'string', Rule::unique('communities', 'alias')->ignore($this->community), 'regex:/^[a-zA-Z]{1}[a-zA-Z\d_]{2,24}$/'],
            'image' => ['sometimes', 'mimes:jpg,jpeg,png,bmp,webp', 'max:20000'],
        ];
    }

    public function messages()
    {
        return [
            'regex' => 'Поле, длиной от 3 до 25 символов может состоять из латинских букв, цифр и знака подчеркивания и может начинаться с буквы',
        ];
    }
}
