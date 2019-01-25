<?php

use Illuminate\Database\Seeder;

class PackagesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {


    	DB::table('packages')->insert([
        	'hotelroom_id'=>26,
        	'car_id'=>2,
        	'destiny_id'=>1,
        	'home_id'=>2,
        	'precioPaquete'=>543,
        	'fechaInicio'=>'2019-02-21',
        	'fechaTermino'=>'2019-02-28',
        ]);

        DB::table('packages')->insert([
        	'hotelroom_id'=>51,
        	'car_id'=>3,
        	'destiny_id'=>3,
        	'home_id'=>4,
        	'precioPaquete'=>543,
        	'fechaInicio'=>'2019-02-21',
        	'fechaTermino'=>'2019-02-28',
        ]);

        DB::table('packages')->insert([
        	'hotelroom_id'=>76,
        	'car_id'=>4,
        	'destiny_id'=>5,
        	'home_id'=>6,
        	'precioPaquete'=>543,
        	'fechaInicio'=>'2019-02-21',
        	'fechaTermino'=>'2019-02-28',
        ]);

        DB::table('packages')->insert([
        	'hotelroom_id'=>101,
        	'car_id'=>5,
        	'destiny_id'=>7,
        	'home_id'=>8,
        	'precioPaquete'=>543,
        	'fechaInicio'=>'2019-02-21',
        	'fechaTermino'=>'2019-02-28',
        ]);

        DB::table('packages')->insert([
        	'hotelroom_id'=>126,
        	'car_id'=>6,
        	'destiny_id'=>9,
        	'home_id'=>10,
        	'precioPaquete'=>543,
        	'fechaInicio'=>'2019-02-21',
        	'fechaTermino'=>'2019-02-28',
        ]);



        //factory(App\Package::class, 5) -> create();
    }
}
