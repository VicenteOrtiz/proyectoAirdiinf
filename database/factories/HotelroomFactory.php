<?php

use Faker\Generator as Faker;

$factory->define(App\Hotelroom::class, function (Faker $faker) {

	$hotels = DB::table('hotels')->select('id')->get();

    return [

        'number_of_beds' => $faker->numberBetween(1,4),
        'room_type' => $faker->numberBetween(1,3),
        'room_number' => $faker->numberBetween(1,100),
        'room_price_per_day' => $faker->numberBetween(20000,50000),
        'floor_number' => $faker->numberBetween(1,25),
        'available' => $faker->numberBetween(0,1),
        'hotel_id' => $hotels->random()->id,
    ];
}); 
