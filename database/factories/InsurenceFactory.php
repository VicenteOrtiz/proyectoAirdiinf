<?php

use Faker\Generator as Faker;

$factory->define(App\Insurence::class, function (Faker $faker) {
    return [
        'amount'=>$faker->numberBetween(0,500),
    	'description' => $faker-> realText($maxNbChars = 200, $indexSize = 2),
    ];
});
