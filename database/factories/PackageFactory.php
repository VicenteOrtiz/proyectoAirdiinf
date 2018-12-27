<?php

use Faker\Generator as Faker;

$factory->define(App\Package::class, function (Faker $faker) {
    //$countries_id = DB::table('countries')->select('id')->get();
    $hotel_id = DB::table('hotels')->select('id')->get();
    $car_id = DB::table('cars')->select('id')->get();
    $flight_id = DB::table('flights')->select('id')->get();
    return [
        'precioPaquete'=>$faker->numberBetween(0,500),
    	'fechaInicio'=> $faker->dateTimeBetween($startDate = 'now',$endDate = '+1 years'),
    	'fechaTermino'=> $faker->dateTime($startDate='now',$endDate = '+1 years'),
    	'hotel_id' => $hotel_id->random()->id,
    	'car_id' => $car_id->random()->id,
    	'flight_id'=> $flight_id->random()->id,
    ];
});
