<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Http\Resources\MissingValue;
use Illuminate\Support\Facades\Auth;

class ReactionResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        $user = auth('sanctum')->user();
        $loadedSetReactions = collect($this->whenLoaded('setReactions'));
        return [
            'id' => $this->id,
            'name' => $this->name,
            'url' => $this->url,
            'my_reaction' => $loadedSetReactions->contains(fn($item) => $item->user_id == $user?->id),
            'count' => $loadedSetReactions->count(),
        ];
    }
}
