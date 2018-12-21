<?php

use Faker\Generator as Faker;

$factory->define(App\Airplaneseat::class, function (Faker $faker) {
    return [
        'seat_type' => $faker -> numberBetween(1,3),
        'row' => $faker -> numberBetween(1,20),
        'seatLetter' => $faker ->randomLetter,
        'available' => $faker->numberBetween(0,1),
    ];
});
