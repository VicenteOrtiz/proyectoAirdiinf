<?php

use Illuminate\Database\Seeder;

class HotelsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        factory(App\Hotel::class, 10) -> create();

        DB::table('hotels')->insert([
        	'hotelName'=>'Best hotel',
        	'stars'=>5,
        	'hotelCapacity'=>123,
        	'phoneNumber'=>'+56972512245',
        	'address'=>'Alameda 123',
            'location_id' => 1,
        ]);

        DB::table('hotels')->insert([
        	'hotelName'=>'worst hotel',
        	'stars'=>1,
        	'hotelCapacity'=>100,
        	'phoneNumber'=>'+56972512245',
        	'address'=>'Alameda 000',
            'location_id' => 1,
        ]);
    }
}
