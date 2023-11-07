<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ReactionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $imagesPath = '/assets/images/icons/reactions/';
        $fullPath = env('APP_URL') . env('BASE_STORAGE_PATH') . $imagesPath;

        DB::table('reactions')->insert([
            [
                'id' => 1,
                'name' => 'Сердце',
                'url' => $fullPath . 'hearth.png',
            ],
            [
                'id' => 2,
                'name' => 'Палец вверх',
                'url' => $fullPath . 'thumb_up.png',
            ],
            [
                'id' => 3,
                'name' => 'Палец вниз',
                'url' => $fullPath . 'thumb_down.png',
            ],
            [
                'id' => 4,
                'name' => 'Смех',
                'url' => $fullPath . 'rofl.png',
            ],
            [
                'id' => 5,
                'name' => 'Удивление',
                'url' => $fullPath . 'wow.png',
            ],
        ]);
    }
}
