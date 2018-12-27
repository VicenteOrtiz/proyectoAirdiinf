<?php

use Faker\Generator as Faker;

$factory->define(App\Role::class, function (Faker $faker) {
    return [
        'type' => $faker->numberBetween(0,1),
    ];
});
