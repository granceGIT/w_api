<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Reaction extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'url',
    ];

    public static function withSetReactions($reactionable_id, $reactionable_type)
    {
        return self::with([
            'setReactions' => function ($query) use ($reactionable_id, $reactionable_type) {
                $query->where('reactionable_id', $reactionable_id)->where('reactionable_type', $reactionable_type);
            },
        ]);
    }

    public function setReactions()
    {
        return $this->hasMany(SetReaction::class);
    }

}
