<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
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
    ];

    public function generateToken()
    {
        if (!$this->api_token) {
            $token = $this->createToken("user")->plainTextToken;
            $this->update(['api_token' => $token]);
        }
        return $this->api_token;
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
        return $this->belongsToMany(Community::class)->withPivot('subscription_status_id', 'message');
    }
}
