<?php

use Faker\Generator as Faker;

$factory->define(App\Package::class, function (Faker $faker) {
    return [
        'precioPaquete'=>$faker->numberBetween(0,500),
    	'fechaInicio'=> $faker->dateTime('now',null),
    	'fechaTermino'=> $faker->dateTime('now',null),
    ];
});
