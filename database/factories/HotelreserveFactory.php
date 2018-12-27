<?php

use Faker\Generator as Faker;

$factory->define(App\Hotelreserve::class, function (Faker $faker) {
    //$countries_id = DB::table('countries')->select('id')->get();
    $reserve_id = DB::table('reserves')->select('id')->get();
    $hotel_id = DB::table('hotels')->select('id')->get();
    return [
        //'country_id' => $countries_id->random()->id,
        'reserve_id' => $reserve_id->random()->id,
        'hotel_id' => $hotel_id->random()->id,
    ];
});
