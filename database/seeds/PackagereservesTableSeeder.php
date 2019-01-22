<?php

use Illuminate\Database\Seeder;

class PackagereservesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        factory(App\Packagereserve::class, 5) -> create();
    }
}
