<?php

namespace App\Observers;

use App\Models\Album;
use App\Models\User;

class UserObserver
{
    public function created(User $user)
    {
        Album::create(['name' => 'Основной', 'is_primary' => 1, 'user_id' => $user->id]);
    }
}
