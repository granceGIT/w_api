<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Album extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'user_id',
        'community_id',
        'is_primary',
    ];


    /**
     * Model relationships
     */
    public function type()
    {
        return $this->belongsTo(AlbumType::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function community()
    {
        return $this->belongsTo(Community::class);
    }

    public function images()
    {
        return $this->morphMany(Image::class, 'imageable');
    }
}
