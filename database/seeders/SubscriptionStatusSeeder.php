<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class SubscriptionStatusSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('subscription_statuses')->insert([
            [
                'id' => 1,
                'name' => 'Принят',
            ],
            [
                'id' => 2,
                'name' => 'Отправлен',
            ],
            [
                'id' => 3,
                'name' => 'Отклонен',
            ],
        ]);
    }
}
