<?php

namespace App\Http;


use Illuminate\Support\Facades\Storage;

class FileManager
{
    static string $postUploadPath = '/uploads/posts';
    static string $avatarsUploadPath = '/uploads/avatars';
    static string $commentsUploadPath = '/uploads/comments';
    static string $defaultUploadPath = '/uploads';

    public static function upload($file, $dir)
    {
        $path = $file->store($dir ?? self::$defaultUploadPath, 'public');
        return pathinfo($path, PATHINFO_BASENAME);
    }

    public static function delete($fileName, $url)
    {
        $path = '/public' . $url . '/' . $fileName;
        if (Storage::exists($path)) {
            return Storage::delete($path);
        }
        return false;
    }

    public static function update($fileName, $newFile, $dir)
    {
        self::delete($fileName, $dir);
        return self::upload($newFile, $dir);
    }
}
