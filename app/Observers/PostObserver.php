<?php

namespace App\Observers;


use App\Http\FileManager;
use App\Models\Post;

class PostObserver
{
    public function creating(Post $post)
    {
        $user = auth('sanctum')->user();
        $post->user_id = $user->id;
    }
}
