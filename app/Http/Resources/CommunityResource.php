<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class CommunityResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        $user = auth('sanctum')->user();
        return [
            'id' => $this->id,
            'name' => $this->name,
            'user_id' => $this->user_id,
            'contributors' => CommunityEditorResource::collection($this->editors),
            'description' => $this->whenNotNull($this->description),
            'alias' => $this->whenNotNull($this->alias),
            'image' => $this->image ? $this->getFullImagePath() : $this->image,
            'sub_count' => $this->subscribers->count(),
            'subscribed' => $user?->isSubscribedToCommunity($this->id),
            'created_at' => $this->created_at,
        ];
    }
}
