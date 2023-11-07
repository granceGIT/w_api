<?php

namespace App\Observers;

use App\Models\Album;
use App\Models\Community;

class CommunityObserver
{
    public function creating(Community $community)
    {
        $user = auth('sanctum')->user();
        $community->user_id = $user->id;
    }

    public function created(Community $community): void
    {
        Album::create(['name' => 'Основной', 'is_primary' => 1, 'user_id' => $community->user_id, 'community_id' => $community->id]);
    }
}
