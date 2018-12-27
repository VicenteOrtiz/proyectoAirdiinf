<?php

use Illuminate\Database\Seeder;

class FlightReservesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        factory(App\FlightReserve::class, 10) -> create();
    }
}
