<?php

namespace App\Http\Controllers\Api;

use App\Http\ApiResponse;
use App\Http\Controllers\Controller;
use App\Http\Requests\Post\StoreRequest;
use App\Http\Requests\ReactRequest;
use App\Http\Resources\PostResource;
use App\Models\Community;
use App\Models\Post;
use App\Models\User;
use Illuminate\Http\Request;

class PostController extends Controller
{
    public function index()
    {
        return PostResource::collection(Post::orderBy('created_at', 'desc')->get());
    }

    public function show(Post $post)
    {
        return new PostResource($post);
    }

    public function userPosts(User $user)
    {
        return PostResource::collection($user->posts()->orderBy('created_at', 'desc')->get());
    }

    public function communityPosts(Community $community)
    {
        return PostResource::collection($community->posts);
    }

    public function store(StoreRequest $request)
    {
        $post = Post::create($request->validated());
        return ApiResponse::json(201, $post);
    }

    public function react(Post $post, ReactRequest $request)
    {
        $user = $request->user();
        $reaction = $post->reactionExists($user->id, $request->reaction_id);
        if ($reaction) {
            $post->reactions()->find($reaction->id)->delete();
        } else {
            $post->reactions()->create([
                'user_id' => $user->id,
                'reaction_id' => $request->reaction_id,
            ]);
        }
        return new PostResource($post);
    }


    public function destroy(Post $post, Request $request)
    {
        if ($post->user_id === $request->user()->id) {
            $post->delete();
            return ApiResponse::json(200, $post);
        }
        return ApiResponse::error(400, "У вас недостаточно прав для удаления этой записи");
    }
}
