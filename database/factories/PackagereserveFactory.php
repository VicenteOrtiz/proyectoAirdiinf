<?php

use Faker\Generator as Faker;

$factory->define(App\Packagereserve::class, function (Faker $faker) {
    $reserve_id = DB::table('reserves')->select('id')->get();
    $package_id = DB::table('packages')->select('id')->get();
    return [
        'reserve_id' => $reserve_id->random()->id,
        'package_id' => $package_id->random()->id,
    ];
});
