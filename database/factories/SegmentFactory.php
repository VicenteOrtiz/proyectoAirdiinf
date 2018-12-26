<?php

use Faker\Generator as Faker;

$factory->define(App\Segment::class, function (Faker $faker) {
    return [
        'destinyCity' => $faker->city,
        'waitingTime' => $faker->numberBetween(10,100),
    ];
});
