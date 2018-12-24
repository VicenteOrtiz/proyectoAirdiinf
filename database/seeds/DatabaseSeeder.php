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
<<<<<<< HEAD
        $this->call(RolesTableSeeder::class);
        $this->call(UsersTableSeeder::class);
=======
        //$this->call(UsersTableSeeder::class);
>>>>>>> 8a82be147eeebc1b99e354a54d4df96e4b34fa43
        $this->call(CountriesTableSeeder::class);
        $this->call(CitiesTableSeeder::class);
        $this->call(FlightsTableSeeder::class);
        $this->call(HotelsTableSeeder::class);
        $this->call(CarsTableSeeder::class);
        $this->call(AirportsTableSeeder::class);
        //$this->call(AirplaneseatsTableSeeder::class);
        $this->call(HotelroomsTableSeeder::class);
<<<<<<< HEAD
        $this->call(PassengersTableSeeder::class);
        
        $this->call(UsersTableSeeder::class);   
        $this->call(PaymentsTableSeeder::class);
        $this->call(PackagesTableSeeder::class);
=======
        //$this->call(PassengersTableSeeder::class);
        //$this->call(PaymentsTableSeeder::class);
        //$this->call(PackagesTableSeeder::class);
>>>>>>> 8a82be147eeebc1b99e354a54d4df96e4b34fa43
    }
}
