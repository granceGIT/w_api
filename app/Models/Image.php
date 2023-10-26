<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Image extends Model
{
    use HasFactory;

    protected $fillable = [
        'image_id',
        'album_id',
        'alt',
    ];

    /**
     * Model relationships
     */
    public function imageable()
    {
        return $this->morphTo();
    }
}
