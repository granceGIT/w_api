<?php

namespace App\Models;

use App\Http\FileManager;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    use HasFactory;

    public static int $defaultRowsPerPage = 5;

    protected $fillable = [
        'user_id',
        'community_id',
        'content',
    ];

    public function reactionExists($user_id, $reaction_id)
    {
        return $this->reactions()->where('user_id', $user_id)->where('reaction_id', $reaction_id)->first();
    }

    public function addImages($images, $userId, $communityId = false)
    {
        if ($communityId) $album = Album::where('is_primary', 1)->where('community_id', $communityId)->first();
        else $album = Album::where('is_primary', 1)->where('user_id', $userId)->whereNull('community_id')->first();
        foreach ($images as $image) {
            $filename = FileManager::upload($image, FileManager::$postUploadPath);
            $this->images()->create(['album_id' => $album->id, 'image' => $filename]);
        }
        return true;
    }

    /**
     * Override methods
     */

    function delete()
    {
        // TODO: удаление комментариев (когда будут реализованы)

        // Удаление изображений связанных с постом
        foreach ($this->images as $image) {
            FileManager::delete($image->image, FileManager::$postUploadPath);
            $image->delete();
        }

        // Удаление реакций связанных с постом
        $this->reactions()->delete();

        parent::delete();
    }

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

    public function comments()
    {
        return $this->morphMany(Comment::class, 'commentable');
    }

    public function reactions()
    {
        return $this->morphMany(SetReaction::class, 'reactionable');
    }

    public function images()
    {
        return $this->morphMany(Image::class, 'imageable');
    }
}
