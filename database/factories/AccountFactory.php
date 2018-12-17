<?php

use Faker\Generator as Faker;

$factory->define(App\Account::class, function (Faker $faker) {
    return [
        'bankName' => $faker->company,
        'balance' => $faker->numberBetween(1000,2000),
    ];
});
