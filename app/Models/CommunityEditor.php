<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CommunityEditor extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'community_id',
        'role',
        'description',
        'public',
    ];

    /**
     * Model relationships
     */
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function community()
    {
        return $this->belongsTo(Community::class);
    }
}
