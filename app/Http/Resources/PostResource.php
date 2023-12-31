<?php

namespace App\Http\Resources;

use App\Models\Post;
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
            'community' => $this->when($this->community_id, new CommunityResource($this->community)),
            'content' => $this->content,
            'created_at' => $this->created_at,
            'reactions' => ReactionResource::collection(Reaction::withSetReactions($this->id, Post::class)->get()),
            'images' => ImageResource::collection($this->images),
        ];
    }
}
