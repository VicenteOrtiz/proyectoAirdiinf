<?php

use Faker\Generator as Faker;

$factory->define(App\Hotel::class, function (Faker $faker) {

	$cities = DB::table('cities')->select('id')->get();

    return [
        'hotelName' => $faker->company,
        'stars' => $faker->numberBetween(1,5),
        'hotelCapacity' => $faker->numberBetween(100,200),
        'phoneNumber' => $faker->e164PhoneNumber,
        'address' => $faker->address,
        'location_id' => $cities->random()->id,
    ];
});
