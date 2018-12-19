<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // $this->call(UsersTableSeeder::class);
        $this->call(CountriesTableSeeder::class);
        $this->call(CitiesTableSeeder::class);
        $this->call(FlightsTableSeeder::class);
        $this->call(HotelsTableSeeder::class);
        $this->call(CarsTableSeeder::class);
        $this->call(AirportsTableSeeder::class);
        $this->call(AirplaneseatsTableSeeder::class);
        $this->call(HotelroomsTableSeeder::class);
        $this->call(PassengersTableSeeder::class);
    }
}
