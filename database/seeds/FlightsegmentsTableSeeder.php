<?php

use Illuminate\Database\Seeder;

class FlightsegmentsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        factory(App\Flightsegment::class, 10) -> create();
    }
}
