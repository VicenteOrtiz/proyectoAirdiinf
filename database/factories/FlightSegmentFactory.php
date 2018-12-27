<?php

use Faker\Generator as Faker;

$factory->define(Model::class, function (Faker $faker) {
    return [
        //
        'flight_id' => $flights_id->random()->id,
        'segment_id' => $segments_id->random()->id,
    ];
});
