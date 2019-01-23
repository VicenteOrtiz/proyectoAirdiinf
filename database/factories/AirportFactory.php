<?php

use Faker\Generator as Faker;

$factory->define(App\Airport::class, function (Faker $faker) {

	$cities_id = DB::table('countries')->select('id')->get();

    return [
        'name' => $faker->company,
        'address' => $faker->address,
        'city_id' => $cities_id->random()->id,
        'phoneNumber' => $faker->e164PhoneNumber,
    ];
});
