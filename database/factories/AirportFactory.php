<?php

use Faker\Generator as Faker;

$factory->define(App\Airport::class, function (Faker $faker) {
    return [
        'name' => $faker->company,
        'address' => $faker->address,
        'city' => $faker->city,
        'phoneNumber' => $faker->e164PhoneNumber,
    ];
});
