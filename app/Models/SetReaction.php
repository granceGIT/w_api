<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SetReaction extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'reaction_id',
    ];

    public $timestamps = false;

    /**
     * Model relationships
     */
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function reaction()
    {
        return $this->belongsTo(Reaction::class);
    }

    public function reactionable()
    {
        return $this->morphTo();
    }
}
