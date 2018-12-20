<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAirplaneseatsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('airplaneseats', function (Blueprint $table) {
            $table->increments('id');

            $table->integer('flight_id')->nullable();
            $table->foreign('flight_id')->references('id')->on('flights');
            $table->integer('seatType');
            $table->integer('row');
            $table->string('seatLetter')->nullable();
            $table->boolean('available');

            //$table->integer('passenger_id');

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('airplaneseats');
    }
}
