<?php

use Faker\Generator as Faker;

$factory->define(App\Payment::class, function (Faker $faker) {
    return [
        'paymentMethod'=>$faker->creditCardType,
<<<<<<< HEAD
        'bankName'=>$faker->company,
=======
    	'bankName'=>$faker->company,
>>>>>>> master
    ];
});
