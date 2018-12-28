<?php

use Faker\Generator as Faker;

$factory->define(App\Hotelreserve::class, function (Faker $faker) {
    $reserve_id = DB::table('reserves')->select('id')->get();
    //$hotel_id = DB::table('hotels')->select('id')->get();

    $hotelroom_id = DB::table('hotelrooms')->select('id')->get();

    return [
        'reserve_id' => $reserve_id->random()->id,
        //'hotel_id' => $hotel_id->random()->id,
        'hotelroom_id' => $hotelroom_id->random()->id,
    ];
});
