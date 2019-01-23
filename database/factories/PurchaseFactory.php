<?php

use Faker\Generator as Faker;

$factory->define(App\Purchase::class, function (Faker $faker) {
	$payment_id = DB::table('payments')->select('id')->get();
    $reserve_id = DB::table('reserves')->select('id')->get();
    return [
        'totalPrice' => $faker->numberBetween(100,20000),
    	'date'=> $faker->dateTimeBetween($startDate = 'now',$endDate = '+1 weeks'),
    	'payment_id'=>$payment_id->random()->id,
    	'reserve_id'=>$reserve_id->random()->id,
    ];
});
