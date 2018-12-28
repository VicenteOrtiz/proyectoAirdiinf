<?php

use Illuminate\Database\Seeder;

class RolesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('roles')->insert([
        	'type' => 1,
            'description' => 'Usuario comun: Puede recorrer la pagina, comprar y editar su perfil.',
            'created_at' => now(),
            'updated_at' => now(), 
        ]);
    }
}
