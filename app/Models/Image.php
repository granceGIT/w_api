<?php

namespace App\Models;

use App\Http\FileManager;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Image extends Model
{
    use HasFactory;

    protected $fillable = [
        'image',
        'alt',
        'album_id',
    ];

    public function fullImagePath()
    {
        $pathToDir = match ($this->imageable_type) {
            Post::class => FileManager::$postUploadPath,
            Comment::class => FileManager::$commentsUploadPath,
            default => FileManager::$defaultUploadPath,
        };
        return env('APP_URL') . env('BASE_STORAGE_PATH') . $pathToDir . '/' . $this->image;
    }

    /**
     * Model relationships
     */
    public function imageable()
    {
        return $this->morphTo();
    }
}
