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

            $table->integer('hotelroom_id');
            $table->foreign('hotelroom_id')->references('id')->on('hotelrooms')->onDelete('cascade');


            $table->integer('car_id');
            $table->foreign('car_id')->references('id')->on('cars')->onDelete('cascade');

            $table->integer('airplaneseat_id');
            $table->foreign('airplaneseat_id')->references('id')->on('airplaneseats')->onDelete('cascade');


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
