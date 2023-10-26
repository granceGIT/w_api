<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class UserResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'surname' => $this->surname,
            'birthdate' => $this->birthdate,
            'image' => $this->image,
            'status' => $this->status,
            'job' => $this->job,
            'education' => $this->education,
            'country' => $this->country,
            'city' => $this->city,
            'last_active_time' => $this->last_active_time,
        ];
    }
}
