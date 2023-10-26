<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ReactRequest extends FormRequest
{
    public function rules(): array
    {
        return [
            'reaction_id' => ['required', 'exists:reactions,id'],
        ];
    }
}
