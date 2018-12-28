<?php

use Faker\Generator as Faker;

$factory->define(App\Flightreserve::class, function (Faker $faker) {
    $reserve_id = DB::table('reserves')->select('id')->get();
    $flight_id = DB::table('flights')->select('id')->get();
    $airplaneseat_id = DB::table('airplaneseats')->select('id')->get();
    return [
        'reserve_id' => $reserve_id->random()->id,
        'airplaneseat_id'=>$airplaneseat_id->random()->id,
    ];
});
