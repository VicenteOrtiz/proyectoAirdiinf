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
                seat INTEGER:=1;
                price INTEGER:= 500;
                letter CHAR:= \'a\';
                row_number INTEGER:= 0;
                valor INTEGER := NEW.id;
                BEGIN           
                LOOP 
                    EXIT WHEN j = i;
                    j := j + 1;
                    row_number := row_number + 1;
                    IF j > 8 AND j<17 THEN 
                      seat:=2;
                      letter:= \'b\';
                      price:= 1000;
                    ELSEIF j > 16 THEN
                      seat:=3;
                      letter:=\'c\';
                      price:= 1500;
                    END IF;
                    INSERT INTO airplaneseats( flight_id,passenger_id,seat_type,row,seat_letter,available,pricePerSeat_id,created_at,updated_at) VALUES 
                    (valor,null,seat,row_number,letter,true, price, NEW.created_at,NEW.updated_at);
                    IF j = 8 OR j = 16 THEN 
                      row_number:=0;
                    END IF;
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
