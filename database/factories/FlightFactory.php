<?php

use Faker\Generator as Faker;

$factory->define(App\Flight::class, function (Faker $faker) {

	$faker->addProvider(new \Faker\Provider\Fakecar($faker));

	$city_id = DB::table('cities')->select('id')->get();

    return [

    	'flightNumber' => $faker->vehicleRegistration('[A-Z]{2}[0-9]{4}'),
        'airplaneModel' => $faker->vehicleRegistration,
		'airplaneCapacity' => $faker->numberBetween(80, 150),

		//'departureLocation' => $faker->country,
		//'departureLocation' => $cityName->random()->cityName,
		'departure_id' => $city_id->random()->id,



		//'arrivalLocation' => $faker->country,
		//'arrivalLocation' => $cityName->random()->cityName,
		'arrival_id' => $city_id->random()->id,

		'confirmed' => $faker->numberBetween(0,1),
		//'flightDate' => $faker->numberBetween(1,28).'/'.$faker->numberBetween(1,12).'/'.$faker->numberBetween(2018,2020),
		'flightDate' => $faker->dateTimeBetween($startDate = 'now',$endDate = '+1 years'),
		'departureTime' => $faker->time($format = 'H:i'),
    ];
});
