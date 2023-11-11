<?php

namespace App\Http\Controllers\Api;

use App\Http\ApiResponse;
use App\Http\Controllers\Controller;
use App\Http\FileManager;
use App\Http\Requests\User\AddFriendRequest;
use App\Http\Requests\User\LoginRequest;
use App\Http\Requests\User\RegisterRequest;
use App\Http\Requests\User\UpdateRequest;
use App\Http\Resources\PostResource;
use App\Http\Resources\UserResource;
use App\Models\Friendship;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    public function login(LoginRequest $request)
    {
        if (Auth::attempt($request->validated())) {
            $user = $request->user();
            return ApiResponse::json(200, [
                "user" => new UserResource($user),
                "token" => $user->generateToken(),
            ]);
        }
        return ApiResponse::error(401, "Неверные данные");
    }

    public function register(RegisterRequest $request)
    {
        $user = User::create([
                'last_active_time' => now(),
            ] + $request->validated());
        return ApiResponse::json(201, $user);
    }

    public function logout(Request $request)
    {
        $request->user()->resetToken();
        return ApiResponse::json(200, [
            'message' => 'logout',
        ]);
    }

    public function profile(Request $request)
    {
        return new UserResource($request->user());
    }

    public function show(User $user)
    {
        return new UserResource($user);
    }

    public function update(UpdateRequest $request)
    {
        $user = $request->user();
        if (Hash::check($request->password, $user->password)) {
            $validated = $request->validated();
            if ($request->image) $validated['image'] = $user->uploadImage($request->image);
            if ($request->new_password) $validated['password'] = $request->new_password;
            $user->update($validated);
            return new UserResource($user);
        }
        return ApiResponse::error(400, "Неверный пароль");

    }

    public function addFriend(AddFriendRequest $request)
    {
        $user = $request->user();
        $friendship = $user->friendshipExists($request->user_id);
        // TODO: нужно переделать
        if ($friendship) {
            $message = match ($friendship->friendship_status_id) {
                1 => "Заявка уже отправлена",
                2 => "Пользователь уже в вашем списке друзей",
                default => "Заявка отклонена",
            };
            return ApiResponse::error(400, $message);
        }
        $friendship = Friendship::create(['sender_id' => $user->id, 'recipient_id' => $request->user_id,]);
        return ApiResponse::json(201, $friendship);
    }

    public function index(Request $request)
    {
        $users = User::orderBy('id', 'desc');
        if ($request->search) {
            $users->where('name', 'like', "%{$request->search}%")->orWhere('surname', 'like', "%{$request->search}%");
        }
        return UserResource::collection($users->get());
    }
}
