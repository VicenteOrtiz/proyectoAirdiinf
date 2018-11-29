<?php

use Faker\Generator as Faker;

$factory->define(App\Car::class, function (Faker $faker) {
    return [
        'carModel' => $faker->vehicle,
        'vehicleRegistration' => $faker->vehicleRegistration,
        'available' => $faker->numberBetween(0,1),
        'passengerCapacity' => $faker->numberBetween(3,8), 
        'pricePerHour' => $faker->numberBetween(10,200),
    ];
});
