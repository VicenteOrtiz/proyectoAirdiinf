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


        factory(App\Hotel::class, 5) -> create();
    }
}
