<?php

use Faker\Generator as Faker;

$factory->define(App\Airplaneseat::class, function (Faker $faker) {

	$passenger_id = DB::table('passengers')->select('id')->get();

    return [
        'seat_type' => $faker->numberBetween(1,3),
        'row' => $faker->numberBetween(1,20),
        'seat_letter' => $faker->randomLetter,
        'available' => $faker->numberBetween(0,1),
        'passenger_id' => $passenger_id->random()->id,
    ];
});
