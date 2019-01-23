<?php

use Illuminate\Database\Seeder;

class CitiesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {

    	DB::table('cities')->insert([
        	'cityName'=>'Santiago',
        	'country_id' => 1,
            'created_at' => now(),
            'updated_at' => now(), 
        ]);

        DB::table('cities')->insert([
        	'cityName'=>'Concepcion',
        	'country_id' => 1,
            'created_at' => now(),
            'updated_at' => now(), 
        ]);

        DB::table('cities')->insert([
        	'cityName'=>'Punta Arenas',
        	'country_id' => 1,
            'created_at' => now(),
            'updated_at' => now(), 
        ]);

        factory(App\City::class, 20) -> create();
    }
}
