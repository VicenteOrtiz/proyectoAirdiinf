<?php

use Illuminate\Database\Seeder;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {

    	DB::table('users')->insert([
        	'rol_id'=>'1',
        	'record_id' => 1,
        	'name' => "admin",
        	'surname' => "admin",
        	'age' => 0,
        	'email' => 'admin@admin.com',
        	'passportNumber' => '00000000',
        	'phoneNumber' => '0000000',
        	'disability' => false,
        	'password' => bcrypt('admin'),

            'created_at' => now(),
            'updated_at' => now(), 
        ]);

        factory(App\User::class, 5) -> create();
    }
}
