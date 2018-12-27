<?php

use Illuminate\Database\Seeder;

class FlightreservesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        factory(App\Flightreserve::class, 10) -> create();
    }
}
