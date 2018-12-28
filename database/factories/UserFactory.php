<?php

use Faker\Generator as Faker;

/*
|--------------------------------------------------------------------------
| Model Factories
|--------------------------------------------------------------------------
|
| This directory should contain each of the model factory definitions for
| your application. Factories provide a convenient way to generate new
| model instances for testing / seeding your application's database.
|
*/

$factory->define(App\User::class, function (Faker $faker) {
    $record_id = DB::table('records')->select('id')->get();
    return [
        'name'=>$faker->name, 
        'email'=>$faker->unique()->safeEmail, 
        'password'=>$faker->realText,
        'surname'=>$faker->lastname,
        'age'=>$faker->numberBetween(1,100),
        'passportNumber'=>$faker->numberBetween(1,100),
        'phoneNumber'=>$faker->numberBetween(1,100),
        'disability'=>$faker->numberBetween(0,1), 
        'record_id'=>$record_id->random()->id,
    ];
});
