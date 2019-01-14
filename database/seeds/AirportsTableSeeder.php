<?php

use Illuminate\Database\Seeder;

class AirportsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {

    	DB::table('airports')->insert([
        	'name'=>'Arturo Merino Benitez',
        	'address' => 'Aviador David Fuents, Pudahuel, RM',
        	'city_id' => 1,
        	'phoneNumber' => +56922451485,
            'created_at' => now(),
            'updated_at' => now(), 
        ]);

        DB::table('airports')->insert([
        	'name'=>'Carriel Sur',
        	'address' => 'Av. Pdte. Jorge Alessandri Rodriguez 5001, Talcahuano, Región del Bío Bío',
        	'city_id' => 2,
        	'phoneNumber' => +56922451123,
            'created_at' => now(),
            'updated_at' => now(), 
        ]);

        DB::table('airports')->insert([
        	'name'=>'Presidente Carlos Ibáñez del Campo',
        	'address' => 'Aeropuerto Presidente Carlos Ibáñez Del Campo, Km 20,5 Ruta 9 Norte, Punta - Arena, Punta Arenas, Región de Magallanes y de la Antártica Chilena',
        	'city_id' => 3,
        	'phoneNumber' => +56922451433,
            'created_at' => now(),
            'updated_at' => now(), 
        ]);

        factory(App\Airport::class, 6) -> create();
    }
}
