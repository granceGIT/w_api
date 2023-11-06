<?php

namespace App\Http;


use Illuminate\Support\Facades\Storage;

class FileManager
{
    public static function upload($file, $dir = '/uploads')
    {
        $path = $file->store($dir, 'public');
        return pathinfo($path, PATHINFO_BASENAME);
    }

    public static function delete($fileName, $url)
    {
        $path = $url . $fileName;
        if (Storage::exists($path)) {
            return Storage::delete($path);
        }
        return false;
    }

    public static function update($fileName, $newFile, $dir)
    {
        $path = '/public' . $dir . '/';
        self::delete($fileName, $path);
        return self::upload($newFile, $dir);
    }
}
