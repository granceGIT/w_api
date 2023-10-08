<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Community extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'type_id',
        'name',
        'description',
        'alias',
    ];

    /**
     * Model relationships
     */
    public function posts()
    {
        return $this->hasMany(Post::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function type()
    {
        return $this->belongsTo(CommunityType::class);
    }

    public function albums()
    {
        return $this->hasMany(Album::class);
    }

    public function subscribers()
    {
        return $this->belongsToMany(User::class)->withPivot('subscription_status_id', 'message');
    }
}
