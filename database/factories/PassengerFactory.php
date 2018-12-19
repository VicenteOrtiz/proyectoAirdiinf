<?php

use Faker\Generator as Faker;

$factory->define(App\Passenger::class, function (Faker $faker) {
    return [
        'name'=>$faker->firstname,
        'surname'=>$faker->lastname,
        'age'=>$faker->numberBetween(1,100),
        'checkIn'=>$faker->numberBetween(0,1),
    ];
});
