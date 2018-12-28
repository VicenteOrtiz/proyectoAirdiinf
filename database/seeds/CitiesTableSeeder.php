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

    	/*DB::table('cities')->insert([
        	'cityName'=>'Santiago',
        	'country_id' => 1,
        ]);

        DB::table('cities')->insert([
        	'cityName'=>'Concepcion',
        	'country_id' => 1,
        ]);

        DB::table('cities')->insert([
        	'cityName'=>'Punta Arenas',
        	'country_id' => 1,
        ]);*/

        factory(App\City::class, 10) -> create();
    }
}
