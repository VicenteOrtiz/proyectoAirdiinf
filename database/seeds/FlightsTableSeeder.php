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

        DB::table('flights')->insert([
            'flightNumber'=>'P10XS9',
            'airplaneModel' => 'AvionBacan 123',
            'airplaneCapacity' => 200,
            'departure_id' => 2,
            'arrival_id' => 1,
            'flightDate' => '2019-02-28',
            'departureTime' => '18:45',
            'confirmed' => true,
            'pricePerSeat' => 480,
            'created_at' => now(),
            'updated_at' => now(), 
        ]);

        DB::table('flights')->insert([
            'flightNumber'=>'P10XS9',
            'airplaneModel' => 'AvionBacan 123',
            'airplaneCapacity' => 200,
            'departure_id' => 1,
            'arrival_id' => 3,
            'flightDate' => '2019-01-25',
            'departureTime' => '18:45',
            'confirmed' => true,
            'pricePerSeat' => 500,
            'created_at' => now(),
            'updated_at' => now(), 
        ]);

        DB::table('flights')->insert([
            'flightNumber'=>'P10XS9',
            'airplaneModel' => 'AvionBacan 123',
            'airplaneCapacity' => 200,
            'departure_id' => 3,
            'arrival_id' => 1,
            'flightDate' => '2019-02-1',
            'departureTime' => '18:45',
            'confirmed' => true,
            'pricePerSeat' => 500,
            'created_at' => now(),
            'updated_at' => now(), 
        ]);

        DB::table('flights')->insert([
            'flightNumber'=>'P10XS9',
            'airplaneModel' => 'AvionBacan 123',
            'airplaneCapacity' => 200, 
            'departure_id' => 1,
            'arrival_id' => 4,
            'flightDate' => '2019-01-28',
            'departureTime' => '18:45',
            'confirmed' => true,
            'pricePerSeat' => 500,
            'created_at' => now(),
            'updated_at' => now(), 
        ]);

        DB::table('flights')->insert([
            'flightNumber'=>'P10XS9',
            'airplaneModel' => 'AvionBacan 123',
            'airplaneCapacity' => 200,
            'departure_id' => 4,
            'arrival_id' => 1,
            'flightDate' => '2019-02-4',
            'departureTime' => '18:45',
            'confirmed' => true,
            'pricePerSeat' => 500,
            'created_at' => now(),
            'updated_at' => now(), 
        ]);

        DB::table('flights')->insert([
            'flightNumber'=>'P10XS9',
            'airplaneModel' => 'AvionBacan 123',
            'airplaneCapacity' => 200,
            'departure_id' => 1,
            'arrival_id' => 5,
            'flightDate' => '2019-02-4',
            'departureTime' => '18:45',
            'confirmed' => true,
            'pricePerSeat' => 500,
            'created_at' => now(),
            'updated_at' => now(), 
        ]);

        DB::table('flights')->insert([
            'flightNumber'=>'P10XS9',
            'airplaneModel' => 'AvionBacan 123',
            'airplaneCapacity' => 200,
            'departure_id' => 5,
            'arrival_id' => 1,
            'flightDate' => '2019-02-11',
            'departureTime' => '18:45',
            'confirmed' => true,
            'pricePerSeat' => 500,
            'created_at' => now(),
            'updated_at' => now(), 
        ]);

        DB::table('flights')->insert([
            'flightNumber'=>'P10XS9',
            'airplaneModel' => 'AvionBacan 123',
            'airplaneCapacity' => 200,
            'departure_id' => 1,
            'arrival_id' => 6,
            'flightDate' => '2019-02-10',
            'departureTime' => '18:45',
            'confirmed' => true,
            'pricePerSeat' => 500,
            'created_at' => now(),
            'updated_at' => now(), 
        ]);

        DB::table('flights')->insert([
            'flightNumber'=>'P10XS9',
            'airplaneModel' => 'AvionBacan 123',
            'airplaneCapacity' => 200,
            'departure_id' => 6,
            'arrival_id' => 1,
            'flightDate' => '2019-02-17',
            'departureTime' => '18:45',
            'confirmed' => true,
            'pricePerSeat' => 500,
            'created_at' => now(),
            'updated_at' => now(), 
        ]);
        


        factory(App\Flight::class, 100)->create();
    }
}
