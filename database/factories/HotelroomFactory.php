<?php

use Faker\Generator as Faker;

$factory->define(App\Hotelroom::class, function (Faker $faker) {

	$hotels = DB::table('hotels')->select('id')->get();

    return [

        'numberOfBeds' => $faker->numberBetween(1,4),
        'roomType' => $faker->numberBetween(1,3),
        'roomNumber' => $faker->numberBetween(1,100),
        'roomPricePerDay' => $faker->numberBetween(20000,50000),
        'floorNumber' => $faker->numberBetween(1,25),
        'available' => $faker->numberBetween(0,1),
        'hotel_id' => $hotels->random()->id,
    ];
}); 
