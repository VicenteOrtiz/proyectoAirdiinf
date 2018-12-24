<?php

use Faker\Generator as Faker;

$factory->define(App\Record::class, function (Faker $faker) {
    return [
        'logDate' => $faker->dateTime('now',null),
    	'logDescription' => $faker-> realText($maxNbChars = 200, $indexSize = 2),
    ];
});
