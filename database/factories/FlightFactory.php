<?php

use Faker\Generator as Faker;

$factory->define(App\Flight::class, function (Faker $faker) {

	$faker->addProvider(new \Faker\Provider\Fakecar($faker));

    return [

    	'flightNumber' => $faker->vehicleRegistration('[A-Z]{2}[0-9]{4}'),
        'airplaneModel' => $faker->vehicleRegistration,
		'airplaneCapacity' => $faker->numberBetween(80, 150),
		'departureLocation' => $faker->country,
		'arrivalLocation' => $faker->country,
		'confirmed' => $faker->numberBetween(0,1),
    ];
});
