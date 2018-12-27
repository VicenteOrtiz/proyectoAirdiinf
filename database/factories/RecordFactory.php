<?php

use Faker\Generator as Faker;

$factory->define(App\Record::class, function (Faker $faker) {
    return [
        'logDate' => $faker->dateTimeBetween($starDate = 'now',$endDate = '+1 years'),
    	'logDescription' => $faker-> realText($maxNbChars = 200, $indexSize = 2),
    ];
});
