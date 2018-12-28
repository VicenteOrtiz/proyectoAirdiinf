<?php

use Illuminate\Database\Seeder;

class HotelroomsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        factory(App\Hotelroom::class, 5) -> create();
    }
}
