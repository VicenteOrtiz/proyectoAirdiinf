<?php

use Illuminate\Database\Seeder;

class AirplaneseatsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        factory(App\Airplaneseat::class, 5) -> create();
    }
}
