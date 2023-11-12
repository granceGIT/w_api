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
use Illuminate\Support\Facades\DB;

class PostController extends Controller
{
    public function index(Request $request)
    {
        $limit = $request->limit ?? Post::$defaultRowsPerPage;
        return PostResource::collection(Post::orderByDesc('created_at')->simplePaginate($limit));
    }

    public function show(Post $post)
    {
        return new PostResource($post);
    }

    public function userPosts(User $user, Request $request)
    {
        $limit = $request->limit ?? Post::$defaultRowsPerPage;
        return PostResource::collection($user->posts()->whereNull('community_id')->orderByDesc('created_at')->simplePaginate($limit));
    }

    public function userReactions(Request $request)
    {
        $user = $request->user();
        $limit = $request->limit ?? Post::$defaultRowsPerPage;
        return PostResource::collection($user->reactedPosts()->simplePaginate($limit));
    }

    public function friendsPosts(Request $request)
    {
        $user = $request->user();
        $limit = $request->limit ?? Post::$defaultRowsPerPage;
        return PostResource::collection($user->friendsPosts()->simplePaginate($limit));
    }

    public function userSubscribedCommunitiesPosts(Request $request)
    {
        $user = $request->user();
        $limit = $request->limit ?? Post::$defaultRowsPerPage;
        return PostResource::collection($user->subscribedCommunitiesPosts()->simplePaginate($limit));
    }

    public function communityPosts(Community $community, Request $request)
    {
        $limit = $request->limit ?? Post::$defaultRowsPerPage;
        return PostResource::collection($community->posts()->orderByDesc('created_at')->simplePaginate($limit));
    }

    public function store(StoreRequest $request)
    {
        DB::beginTransaction();
        try {
            $post = Post::create($request->validated());
            if ($request->images) {
                $post->addImages($request->images, $request->user()->id, $request->community_id);
            }
            DB::commit();
            return ApiResponse::json(201, new PostResource($post));

        } catch (\Throwable $e) {
            DB::rollBack();
        }
        return ApiResponse::error(500, "Что-то пошло не так...");
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
