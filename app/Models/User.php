<?php

namespace App\Models;

use App\Http\FileManager;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Support\Facades\Hash;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'surname',
        'login',
        'education',
        'job',
        'country',
        'city',
        'birthdate',
        'status',
        'image',
        'password',
        'api_token',
        'last_active_time',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'api_token',
    ];


    public function setPasswordAttribute($value)
    {
        $this->attributes['password'] = Hash::make($value);
    }

    public function getFullImagePath()
    {
        return env('APP_URL') . env('BASE_STORAGE_PATH') . FileManager::$userAvatarsUploadPath . '/' . $this->image;
    }

    public function generateToken()
    {
        if (!$this->api_token) {
            $token = $this->createToken("user")->plainTextToken;
            $this->update(['api_token' => $token]);
        }
        return $this->api_token;
    }

    public function resetToken()
    {
        if ($this->update(['api_token' => null])) {
            $this->tokens()->delete();
        }
    }

    public function friendshipExists($user_id)
    {
        $user = $this;
        // пользователь может быть как в качестве отправителя заявки, так и в качестве получателя. Проверяем оба случая
        return Friendship::where(function ($query) use ($user_id, $user) {
            $query->where('sender_id', $user->id)->where('recipient_id', $user_id);
        })->orWhere(function ($query) use ($user_id, $user) {
            $query->where('sender_id', $user_id)->where('recipient_id', $user->id);
        })->first();
    }

    public function isSubscribedToCommunity($id)
    {
        return !!$this->subscriptions()->where('community_id', $id)->first();
    }

    public function reactedPosts()
    {
        // TODO: переделать в raw запрос с правильной сортировкой по дате установки реакции
        $reactedPostIds = $this->reactions()->select('reactionable_id')->where('reactionable_type', Post::class)->distinct();
        return Post::whereIn('id', $reactedPostIds)->orderByDesc('id');
    }

    public function friendsPosts()
    {
        $friendPostIds = $this->friends()->select('id');
        return Post::whereIn('user_id', $friendPostIds)->orderByDesc('id');
    }

    public function subscribedCommunitiesPosts()
    {
        $subscribedCommunitiesPostIds = $this->subscriptions()->select('community_id');
        return Post::whereIn('community_id', $subscribedCommunitiesPostIds)->orderByDesc('id');
    }

    public function friends()
    {
        $senderIds = Friendship::where('recipient_id', $this->id)->where('friendship_status_id', 2)->select('sender_id');
        $recipientIds = Friendship::where('sender_id', $this->id)->where('friendship_status_id', 2)->select('recipient_id')->union($senderIds);

        return User::whereIn('id', $recipientIds);
    }


    /**
     * Model relationships
     */
    public function posts()
    {
        return $this->hasMany(Post::class);
    }

    public function created_communities()
    {
        return $this->hasMany(Community::class);
    }

    public function editable_communities()
    {
        return $this->hasMany(CommunityEditor::class);
    }

    public function comments()
    {
        return $this->hasMany(Comment::class);
    }

    public function reactions()
    {
        return $this->hasMany(SetReaction::class);
    }

    public function albums()
    {
        return $this->hasMany(Album::class);
    }


    public function subscriptions()
    {
        return $this->belongsToMany(Community::class, 'subscriptions')->withPivot('message');
    }
}
