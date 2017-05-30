<?php

/*
|--------------------------------------------------------------------------
| Model Factories
|--------------------------------------------------------------------------
|
| Here you may define all of your model factories. Model factories give
| you a convenient way to create models for testing and seeding your
| database. Just tell the factory how a default model should look.
|
*/

$factory->define(App\User::class, function (Faker\Generator $faker) {
    $hasher = app()->make('hash');
    return [
        'name' => $faker->name,
        'email' => $faker->email,
        'password' => $hasher->make("secret")
    ];
});
$factory->define(App\Achievement::class, function (Faker\Generator $faker) {
    return [
        'name' => $faker->name,
        'exp' => mt_rand(1,1000),
        'type' => array_rand(array('single','overall')),
        'threshold' => mt_rand(1,10),
        'threshold_type' => array_rand(array('cadence','speed','distance','time'))
    ];
});
$factory->define(App\Trip::class, function (Faker\Generator $faker) {
    return [
        'user_id' => mt_rand(1,10),
        'start_longitude' => 360/mt_rand(1,10),
        'start_latitude' => 360/mt_rand(1,10),
        'end_longitude' => 360/mt_rand(1,10),
        'end_latitude' => 360/mt_rand(1,10),
        'start_time' => $faker->dateTime($max='now'),
        'finish_time' => $faker->dateTime($max='now'),
        'distance' => mt_rand(1,1000),
        'top_speed' => mt_rand(1,100),
        'top_cadence' => mt_rand(1,100),
        'average_cadence' => mt_rand(1,100),

    ];
});
$factory->define(App\UserAchievement::class, function (Faker\Generator $faker) {
    return [
    	'user_id' => mt_rand(1,10),
        'achievement_id' => mt_rand(1,10),
        'trip_id' => mt_rand(1,10),
    ];
});
