<?php

use Illuminate\Database\Seeder;

class PackageReservesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        factory(App\PackageReserve::class, 10) -> create();
    }
}
