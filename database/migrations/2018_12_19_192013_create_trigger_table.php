<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTriggerTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::statement('
            CREATE OR REPLACE FUNCTION darRol()
            RETURNS trigger AS
            $$
                /*DECLARE
                i INTEGER := 25;
                j INTEGER := 0;
                valor INTEGER := NEW.id;*/
                BEGIN           
                /*LOOP*/ 
                 UPDATE users
                 SET rol_id = 1
                 WHERE users.id = NEW.id   
                /*END LOOP*/ ;
                RETURN NEW;
            END
            $$ LANGUAGE plpgsql;
        ');
        DB::unprepared('
        CREATE TRIGGER asignarRol AFTER INSERT ON users FOR EACH ROW
        EXECUTE PROCEDURE darRol();
        ');
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('trigger');
    }
}
