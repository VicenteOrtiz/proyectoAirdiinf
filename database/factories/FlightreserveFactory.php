<?php

use Faker\Generator as Faker;

$factory->define(App\Flightreserve::class, function (Faker $faker) {
    $reserve_id = DB::table('reserves')->select('id')->get();
    $flight_id = DB::table('flights')->select('id')->get();
    return [
        'reserve_id' => $reserve_id->random()->id,
        'flight_id' => $flight_id->random()->id,
    ];
});