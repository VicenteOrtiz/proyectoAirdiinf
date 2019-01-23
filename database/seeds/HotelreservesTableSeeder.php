<?php

use Illuminate\Database\Seeder;

class HotelreservesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        factory(App\Hotelreserve::class, 5) -> create();
    }
}
