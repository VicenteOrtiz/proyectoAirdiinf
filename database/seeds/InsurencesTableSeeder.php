<?php

use Illuminate\Database\Seeder;

class InsurencesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        factory(App\Insurence::class, 5) -> create();
    }
}
