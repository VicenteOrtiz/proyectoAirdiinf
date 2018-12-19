<?php

use Illuminate\Database\Seeder;

class CountriesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {

    	DB::table('countries')->insert([
        	'countryName'=>'Chile',
        	
 
        ]);

        factory(App\Country::class, 10) -> create();


    }
}
