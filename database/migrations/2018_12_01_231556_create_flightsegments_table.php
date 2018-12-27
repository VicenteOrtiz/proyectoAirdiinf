<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateFlightsegmentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('flightsegments', function (Blueprint $table) {
            $table->increments('id');
            $table->timestamps();
            
            $table->integer('flight_id');
            $table->integer('segment_id');

            $table->foreign('flight_id')->references('id')->on('flights');
            $table->foreign('segment_id')->references('id')->on('segments');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('flightsegments');
    }
}
