<?php

use Faker\Generator as Faker;

$factory->define(Model::class, function (Faker $faker) {
    return [
        //
        'reserve_id' => $reserves_id->random()->id,
        'package_id' => $packages_id->random()->id,
    ];
});
