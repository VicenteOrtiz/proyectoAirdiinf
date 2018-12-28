<?php

use Faker\Generator as Faker;

$factory->define(App\Package::class, function (Faker $faker) {
    $hotelroom_id = DB::table('hotelrooms')->select('id')->get();
    $car_id = DB::table('cars')->select('id')->get();
    $airplaneseat_id = DB::table('airplaneseats')->select('id')->get();
    return [
        'precioPaquete'=>$faker->numberBetween(0,500),
    	'fechaInicio'=> $faker->dateTimeBetween($startDate = 'now',$endDate = '+1 weeks'),
    	'fechaTermino'=> $faker->dateTimeBetween($startDate='+1 weeks',$endDate = '+2 weeks'),
        'hotelroom_id' => $hotelroom_id->random()->id,
    	'car_id' => $car_id->random()->id,
        'airplaneseat_id'=>$airplaneseat_id->random()->id,
    ];
});
