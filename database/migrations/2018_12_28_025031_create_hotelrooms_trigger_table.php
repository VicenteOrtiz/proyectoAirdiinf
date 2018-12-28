<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateHotelroomsTriggerTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::statement('
            CREATE OR REPLACE FUNCTION CompleteHotelrooms()
            RETURNS trigger AS
            $$
                DECLARE
                i INTEGER := 25;
                j INTEGER := 0;
                k INTEGER := 0;
                aux INTEGER := 0;
                price INTEGER := 100;
                valor INTEGER := NEW.id;
                BEGIN           
                LOOP 
                    EXIT WHEN j = i;
                    j := j + 1;  
                    k := k + 1; 
                    aux := j%4+1;
                    price := price * aux * k; 
                    INSERT INTO hotelrooms( hotel_id,number_of_beds,room_type,room_number,room_price_per_day,floor_number,available,created_at,updated_at) VALUES (valor,aux,k,j,price,j+1,true, NEW.created_at,NEW.updated_at);
                    IF k = 4 THEN
                        k := 0;
                    END IF;
                    price:=100;
                END LOOP ;
                RETURN NEW;
            END
            $$ LANGUAGE plpgsql;
        ');
        DB::unprepared('
        CREATE TRIGGER createHotelroom AFTER INSERT ON hotels FOR EACH ROW
        EXECUTE PROCEDURE CompleteHotelrooms();
        ');
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('hotelrooms_trigger');
    }
}
