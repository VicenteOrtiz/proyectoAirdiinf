<?php

use Faker\Generator as Faker;

$factory->define(Model::class, function (Faker $faker) {
    return [
        //
        'hotel_id' => $hotels_id->random()->id,
        'reserve_id' => $reserves_id->random()->id,
    ];
});
