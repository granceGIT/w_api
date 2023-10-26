<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CommunityTypeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('community_types')->insert([
            [
                'id' => 1,
                'name' => 'Публичное',
                'description' => 'Просматривать записи могут все пользователи.',
            ],
            [
                'id' => 2,
                'name' => 'Закрытое',
                'description' => 'Просматривать записи могут только участники сообщества (подписчики).',
            ],
        ]);
    }
}
