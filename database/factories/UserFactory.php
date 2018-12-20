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
    return [
        'name'=>$faker->name, 
        'email'=>$faker->safeEmail, 
        'password'=>$faker->realText,
        'surname'=>$faker->lastname,
        'age'=>$faker->numberBetween(1,100),
        'passportNumber'=>$faker->numberBetween(1,100),
        'phoneNumber'=>$faker->numberBetween(1,100),
        'disability'=>$faker->numberBetween(0,1), 
    ];
});
