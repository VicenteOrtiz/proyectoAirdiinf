<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateFlightsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('flights', function (Blueprint $table) {
            $table->increments('id');
            $table->string('flightNumber');
            $table->string('airplaneModel');
            $table->integer('airplaneCapacity');

            //$table->string('departureLocation');
            $table->integer('departure_id');
            $table->foreign('departure_id')->references('id')->on('airports')->onDelete('cascade');

            //$table->string('arrivalLocation');
            $table->integer('arrival_id');
            $table->foreign('arrival_id')->references('id')->on('airports')->onDelete('cascade');

            $table->date('flightDate');
            $table->string('departureTime');
            $table->boolean('confirmed');

            $table->integer('pricePerSeat');
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
        Schema::dropIfExists('flights');
    }
}
