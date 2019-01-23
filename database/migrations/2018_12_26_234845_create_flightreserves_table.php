<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateFlightreservesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('flightreserves', function (Blueprint $table) {
            $table->increments('id');
            $table->timestamps();

            //$table->integer('flight_id');
            $table->integer('airplaneseat_id');
            $table->integer('reserve_id');

            $table->foreign('airplaneseat_id')->references('id')->on('airplaneseats')->onDelete('cascade');
            //$table->foreign('flight_id')->references('id')->on('flights')->onDelete('cascade');
            $table->foreign('reserve_id')->references('id')->on('reserves')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('flightreserves');
    }
}
