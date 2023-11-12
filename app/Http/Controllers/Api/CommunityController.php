<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\FileManager;
use App\Http\Requests\Community\StoreCommunityRequest;
use App\Http\Requests\Community\UpdateCommunityRequest;
use App\Http\Resources\CommunityResource;
use App\Models\Community;
use Illuminate\Http\Request;

class CommunityController extends Controller
{
    public function index(Request $request)
    {
        $limit = $request->limit ?? Community::$defaultRowsPerPage;
        return CommunityResource::collection(Community::simplePaginate($limit));
    }

    public function show(Community $community)
    {
        return new CommunityResource($community);
    }

    public function store(StoreCommunityRequest $request)
    {
        $validated = $request->validated();
        if ($request->image) {
            $validated['image'] = FileManager::upload($request->image, FileManager::$communityAvatarsUploadPath);
        }
        return new CommunityResource(Community::create($validated));
    }

    public function update(Community $community, UpdateCommunityRequest $request)
    {
        $validated = $request->validated();
        if ($request->image) {
            $validated['image'] = FileManager::update($community->image, $request->image, FileManager::$communityAvatarsUploadPath);
        }
        $community->update($validated);
        return new CommunityResource($community);
    }

    public function destroy(Community $community)
    {
        // delete community handle
    }

    public function subscribe(Community $community, Request $request)
    {
        $community->subscribers()->attach($request->user());
        return new CommunityResource($community);
    }

    public function unsubscribe(Community $community, Request $request)
    {
        $community->subscribers()->detach($request->user());
        return new CommunityResource($community);
    }
}
