<?php

use Illuminate\Database\Seeder;

class HotelsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {

    	DB::table('hotels')->insert([
        	'hotelName'=>'Hotel W',
        	'stars' => 5,
            'hotelCapacity' => 150,
            'phoneNumber' => '+56982457543',
            'address' => 'Isidora Goyenechea 3000, Las Condes, Región Metropolitana',
            'city_id' => 1,
            'created_at' => now(),
            'updated_at' => now(), 

        ]);

        DB::table('hotels')->insert([
        	'hotelName'=>'Radisson Petra Concepcion',
        	'stars' => 5,
            'hotelCapacity' => 200,
            'phoneNumber' => '+56982457123',
            'address' => 'Autopista Concepcion Talcahuano 8676, Concepción, Región del Bío Bío',
            'city_id' => 2,
            'created_at' => now(),
            'updated_at' => now(), 

        ]);

         DB::table('hotels')->insert([
            'hotelName'=>'Hyatt Punta Arenas',
            'stars' => 5,
            'hotelCapacity' => 200,
            'phoneNumber' => '+56982457123',
            'address' => 'Autopista Concepcion Talcahuano 8676, Punta Arenas, Región de Magallanes y la Antártida',
            'city_id' => 3,
            'created_at' => now(),
            'updated_at' => now(), 

        ]);

        DB::table('hotels')->insert([
            'hotelName'=>'Marriot Rio de Janeiro',
            'stars' => 5,
            'hotelCapacity' => 200,
            'phoneNumber' => '+56982457123',
            'address' => 'Autopista Concepcion Talcahuano 8676, Rio de Janeiro, Brazil',
            'city_id' => 4,
            'created_at' => now(),
            'updated_at' => now(), 

        ]);

        DB::table('hotels')->insert([
            'hotelName'=>'Empire Hotel',
            'stars' => 5,
            'hotelCapacity' => 200,
            'phoneNumber' => '+56982457123',
            'address' => 'Central Park Av 123',
            'city_id' => 5,
            'created_at' => now(),
            'updated_at' => now(), 

        ]);

        DB::table('hotels')->insert([
            'hotelName'=>'Hilton Auckland',
            'stars' => 5,
            'hotelCapacity' => 200,
            'phoneNumber' => '+56982457123',
            'address' => 'Aotearoa Street 123',
            'city_id' => 6,
            'created_at' => now(),
            'updated_at' => now(), 

        ]);


        factory(App\Hotel::class, 5) -> create();
    }
}
