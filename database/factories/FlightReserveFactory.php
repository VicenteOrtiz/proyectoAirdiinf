<?php

use Faker\Generator as Faker;

$factory->define(Model::class, function (Faker $faker) {
    return [
        //
        'flight_id' => $flights_id->random()->id,
        'reserve_id' => $reserves_id->random()->id,
    ];
});
