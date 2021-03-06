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
        $this->call(RolesTableSeeder::class);
        $this->call(RecordsTableSeeder::class);
        $this->call(UsersTableSeeder::class);
        $this->call(CountriesTableSeeder::class);
        $this->call(CitiesTableSeeder::class);
        $this->call(AirportsTableSeeder::class);
        $this->call(FlightsTableSeeder::class);
        $this->call(HotelsTableSeeder::class);
        $this->call(CarsTableSeeder::class);
        $this->call(PassengersTableSeeder::class);
        //$this->call(UsersTableSeeder::class);   
        $this->call(PaymentsTableSeeder::class);
        //$this->call(AirplaneseatsTableSeeder::class);
        $this->call(HotelroomsTableSeeder::class);
        $this->call(PackagesTableSeeder::class);
        $this->call(InsurencesTableSeeder::class);
        $this->call(ReservesTableSeeder::class);
        $this->call(PurchasesTableSeeder::class);
        $this->call(SegmentsTableSeeder::class);
        $this->call(HotelreservesTableSeeder::class);
        $this->call(PackagereservesTableSeeder::class);
        $this->call(FlightsegmentsTableSeeder::class);
        $this->call(FlightreservesTableSeeder::class);

    }
}
