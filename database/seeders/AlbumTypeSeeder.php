<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class AlbumTypeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('album_types')->insert([
            [
                'id' => 1,
                'name' => 'Публичный',
                'description' => 'Просматривать содержимое могут все пользователи.',
            ],
            [
                'id' => 2,
                'name' => 'Приватный',
                'description' => 'Просматривать содержимое сможете только вы.',
            ],
        ]);
    }
}
