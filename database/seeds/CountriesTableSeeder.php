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
        	'created_at' => now(),
            'updated_at' => now(), 
        ]);

        DB::table('countries')->insert([
            'countryName'=>'Brazil',
            'created_at' => now(),
            'updated_at' => now(), 
        ]);

        DB::table('countries')->insert([
            'countryName'=>'Estados Unidos',
            'created_at' => now(),
            'updated_at' => now(), 
        ]);

        DB::table('countries')->insert([
            'countryName'=>'Nueva Zelanda',
            'created_at' => now(),
            'updated_at' => now(), 
        ]);



        factory(App\Country::class, 5) -> create();


    }
}
