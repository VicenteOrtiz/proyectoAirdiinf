<?php

use Faker\Generator as Faker;

$factory->define(App\Flightsegment::class, function (Faker $faker) {
    $flight_id = DB::table('flights')->select('id')->get();
    $segment_id = DB::table('segments')->select('id')->get();
    return [
        'flight_id' => $flight_id->random()->id,
        'segment_id' => $segment_id->random()->id,
    ];
});
