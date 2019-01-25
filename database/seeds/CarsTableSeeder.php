<?php

use Illuminate\Database\Seeder;

class CarsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {

    	DB::table('cars')->insert([
        	'carModel'=>'BMW M3',
        	'vehicleRegistration' => 'IOU123',
        	'available' => 1,
        	'passengerCapacity' => 5,
        	'pricePerHour' => 100,
        	'city_id' => 1,
            'created_at' => now(),
            'updated_at' => now(), 
        ]);

        DB::table('cars')->insert([
        	'carModel'=>'Audi R8',
        	'vehicleRegistration' => 'ABC135',
        	'available' => 1,
        	'passengerCapacity' => 3,
        	'pricePerHour' => 150,
        	'city_id' => 2,
            'created_at' => now(),
            'updated_at' => now(), 
        ]);

        DB::table('cars')->insert([
        	'carModel'=>'Ferrari 480 Italia',
        	'vehicleRegistration' => 'CYFJ18',
        	'available' => 1,
        	'passengerCapacity' => 2,
        	'pricePerHour' => 350,
        	'city_id' => 3,
            'created_at' => now(),
            'updated_at' => now(), 
        ]);

        DB::table('cars')->insert([
        	'carModel'=>'Chevrolet Camaro SS',
        	'vehicleRegistration' => 'KHLG99',
        	'available' => 1,
        	'passengerCapacity' => 2,
        	'pricePerHour' => 350,
        	'city_id' => 5,
            'created_at' => now(),
            'updated_at' => now(), 
        ]);

        DB::table('cars')->insert([
        	'carModel'=>'Toyota Corolla',
        	'vehicleRegistration' => 'CYJS18',
        	'available' => 1,
        	'passengerCapacity' => 2,
        	'pricePerHour' => 350,
        	'city_id' => 5,
            'created_at' => now(),
            'updated_at' => now(), 
        ]);

        DB::table('cars')->insert([
        	'carModel'=>'Kia Sportage',
        	'vehicleRegistration' => 'PLOJ18',
        	'available' => 1,
        	'passengerCapacity' => 2,
        	'pricePerHour' => 350,
        	'city_id' => 6,
            'created_at' => now(),
            'updated_at' => now(), 
        ]);


        factory(App\Car::class, 5) -> create(); 
    }
}
