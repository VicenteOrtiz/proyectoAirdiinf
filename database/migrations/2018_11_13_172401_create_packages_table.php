<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePackagesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('packages', function (Blueprint $table) {
            $table->increments('id');


           // $table->integer('insurence_id');
            //$table->foreign('insurence_id')->references('id')->on('insurences');
            $table->integer('hotel_id');
            $table->foreign('hotel_id')->references('id')->on('hotels')->onDelete('cascade');
            $table->integer('car_id');
            $table->foreign('car_id')->references('id')->on('cars')->onDelete('cascade');
            $table->integer('flight_id');
            $table->foreign('flight_id')->references('id')->on('flights')->onDelete('cascade');


            $table->integer('precioPaquete');
            $table->date('fechaInicio');
            $table->date('fechaTermino');
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
        Schema::dropIfExists('packages');
    }
}
