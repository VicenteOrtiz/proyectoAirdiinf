<?php

use Faker\Generator as Faker;

$factory->define(App\Insurence::class, function (Faker $faker) {
    return [
        'amount'=>$faker->numberBetween(0,50000),
    	'description' => $faker-> realText($maxNbChars = 200, $indexSize = 2),
    ];
});
