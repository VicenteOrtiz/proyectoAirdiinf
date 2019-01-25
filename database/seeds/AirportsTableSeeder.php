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

        DB::table('airports')->insert([
            'name'=>'Aeropuerto Internacional de Galeão',
            'address' => 'Av. Vinte de Janeiro, s/nº - Ilha do Governador, Rio de Janeiro - RJ, 21941-900, Brasil',
            'city_id' => 4,
            'phoneNumber' => +56922451433,
            'created_at' => now(),
            'updated_at' => now(), 
        ]);

        DB::table('airports')->insert([
            'name'=>'Aeropuerto Internacional John F. Kennedy',
            'address' => 'Queens, Nueva York 11430, EE. UU.',
            'city_id' => 5,
            'phoneNumber' => '++ 718-244-4444',
            'created_at' => now(),
            'updated_at' => now(), 
        ]);

        DB::table('airports')->insert([
            'name'=>'Aeropuerto Internacional de Auckland',
            'address' => 'Ray Emery Dr, Auckland Airport, Auckland 2022, Nueva Zelanda',
            'city_id' => 6,
            'phoneNumber' => '+ 718-244-4444',
            'created_at' => now(),
            'updated_at' => now(), 
        ]);

        factory(App\Airport::class, 6) -> create();
    }
}
