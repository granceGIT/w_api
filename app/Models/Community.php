<?php

namespace App\Models;

use App\Http\FileManager;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Community extends Model
{
    use HasFactory;

    public static int $defaultRowsPerPage = 5;

    protected $fillable = [
        'user_id',
        'type_id',
        'name',
        'description',
        'alias',
        'image',
    ];

    public function getFullImagePath()
    {
        return env('APP_URL') . env('BASE_STORAGE_PATH') . FileManager::$communityAvatarsUploadPath . '/' . $this->image;
    }

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

    public function editors()
    {
        return $this->hasMany(CommunityEditor::class);
    }

    public function subscribers()
    {
        return $this->belongsToMany(User::class, 'subscriptions')->withPivot('message');
    }
}
