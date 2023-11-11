<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
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
        // create community handle
    }

    public function update(UpdateCommunityRequest $request)
    {
        // update community handle
    }

    public function destroy(Community $community)
    {
        // delete community handle
    }
}
