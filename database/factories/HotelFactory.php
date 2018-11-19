<?php

use Faker\Generator as Faker;

$factory->define(App\Hotel::class, function (Faker $faker) {
    return [
        'hotelName' => $faker->company,
        'stars' => $faker->numberBetween(1,5),
        'hotelCapacity' => $faker->numberBetween(100,200),
        'phoneNumber' => $faker->e164PhoneNumber,
        'address' => $faker->address,
    ];
});
