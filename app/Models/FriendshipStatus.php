<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FriendshipStatus extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
    ];

}
