<?php

namespace App\Http\Resources;

use App\Models\Reaction;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class PostResource extends JsonResource
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
            'user' => new UserResource($this->user),
            'community_id' => $this->whenNotNull($this->community_id),
            'community' => $this->whenHas('community'),
            'content' => $this->content,
            'created_at' => $this->created_at,
            'set_reactions' => $this->reactions,
            'reactions' => ReactionResource::collection(Reaction::all()),
        ];
    }
}
