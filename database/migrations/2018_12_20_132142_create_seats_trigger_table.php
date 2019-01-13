<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateSeatsTriggerTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
    
      DB::statement('
            CREATE OR REPLACE FUNCTION llenarAsientos()
            RETURNS trigger AS
            $$
                DECLARE
                i INTEGER := 25;
                j INTEGER := 0;
                letter CHAR:= \'a\';
                valor INTEGER := NEW.id;
                BEGIN           
                LOOP 
                    EXIT WHEN j = i;
                    j := j + 1;
                    INSERT INTO airplaneseats( flight_id,passenger_id,seat_type,row,seat_letter,available,pricePerSeat_id,created_at,updated_at) VALUES 
                    (valor,null,1,j,letter,true, 500, NEW.created_at,NEW.updated_at);
                END LOOP ;
                RETURN NEW;
            END
            $$ LANGUAGE plpgsql;
        ');
        DB::unprepared('
        CREATE TRIGGER crearAsiento AFTER INSERT ON flights FOR EACH ROW
        EXECUTE PROCEDURE llenarAsientos();
        ');
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('seats_trigger');
    }
}
