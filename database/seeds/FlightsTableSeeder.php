<?php

use Illuminate\Database\Seeder;

class FlightsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
    	DB::table('flights')->insert([
        	'flightNumber'=>'P10XS9',
        	'airplaneModel' => 'AvionBacan 123',
            'airplaneCapacity' => 200,
            'departure_id' => 1,
            'arrival_id' => 2,
            'flightDate' => '2019-02-21',
            'departureTime' => '18:45',
            'confirmed' => true,
            'pricePerSeat' => 500,
            'created_at' => now(),
            'updated_at' => now(), 

        ]);


        factory(App\Flight::class, 100)->create();
    }
}
