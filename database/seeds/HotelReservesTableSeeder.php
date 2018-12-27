<?php

use Illuminate\Database\Seeder;

class HotelReservesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        factory(App\HotelReserve::class, 10) -> create();
    }
}
