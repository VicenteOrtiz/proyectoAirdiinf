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

    	/*DB::table('countries')->insert([
        	'countryName'=>'Chile',
<<<<<<< HEAD
        	
 
        ]);*/
=======
        	'created_at' => now(),
            'updated_at' => now(), 
        ]);
>>>>>>> master

        factory(App\Country::class, 5) -> create();


    }
}
