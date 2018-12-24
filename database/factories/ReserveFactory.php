<?php

use Faker\Generator as Faker;

$factory->define(App\Reserve::class, function (Faker $faker) {
	$insurence_id = DB::table('insurences')->select('id')->get();
    $car_id = DB::table('cars')->select('id')->get();
    return [
        'reserveDate'=> $faker->dateTime('now',null),
    	'reserveBalance' => $faker->numberBetween(0,20000),
    	'insurance' => $faker->numberBetween(0,1),
    ];
});
