<?php

use Illuminate\Database\Seeder;
use App\User;
use App\Trip;
use App\Achievement;
use App\UserAchievement;


class DatabaseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run(){
        // Disable foreign key checking because truncate() will fail
        DB::statement('SET FOREIGN_KEY_CHECKS = 0');
        User::truncate();
        Trip::truncate();
        Achievement::truncate();
        factory(User::class, 10)->create();
        factory(Trip::class, 10)->create();
        factory(Achievement::class, 20)->create();
        factory(UserAchievement::class, 10)->create();
        // Enable it back
        DB::statement('SET FOREIGN_KEY_CHECKS = 1');
        }
}
