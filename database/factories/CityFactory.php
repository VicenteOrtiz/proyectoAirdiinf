<?php

use Faker\Generator as Faker;

$factory->define(App\City::class, function (Faker $faker) {

	$countries_id = DB::table('countries')->select('id')->get();

    return [
        'cityName' => $faker->unique()->city,
        'country_id' => $countries_id->random()->id,
    ];
});
