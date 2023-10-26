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
        DB::table('reactions')->insert([
            [
                'id' => 1,
                'name' => 'Сердце',
                'url' => 'http://localhost:8000/storage/assets/images/icons/reactions/hearth.png',
            ],
            [
                'id' => 2,
                'name' => 'Палец вверх',
                'url' => 'http://localhost:8000/storage/assets/images/icons/reactions/thumb_up.png',
            ],
            [
                'id' => 3,
                'name' => 'Палец вниз',
                'url' => 'http://localhost:8000/storage/assets/images/icons/reactions/thumb_down.png',
            ],
            [
                'id' => 4,
                'name' => 'Смех',
                'url' => 'http://localhost:8000/storage/assets/images/icons/reactions/rofl.png',
            ],
            [
                'id' => 5,
                'name' => 'Удивление',
                'url' => 'http://localhost:8000/storage/assets/images/icons/reactions/wow.png',
            ],
        ]);
    }
}
