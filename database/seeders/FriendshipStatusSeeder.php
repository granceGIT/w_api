<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class FriendshipStatusSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('friendship_statuses')->insert([
            [
                'id' => 1,
                'name' => 'Отправлен',
            ],
            [
                'id' => 2,
                'name' => 'Принят',
            ],
            [
                'id' => 3,
                'name' => 'Отклонен',
            ],
        ]);
    }
}
