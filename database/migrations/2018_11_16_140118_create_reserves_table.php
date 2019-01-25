<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateReservesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('reserves', function (Blueprint $table) {
            $table->increments('id');
            $table->date('reserveDate');
            $table->integer('reserveBalance');
            $table->boolean('insurance');

            $table->integer('user_id');
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');

            $table->integer('insurence_id')->nullable();
            $table->foreign('insurence_id')->references('id')->on('insurences')->onDelete('cascade');

            // $table->integer('car_id')->nullable();
            // $table->foreign('car_id')->references('id')->on('cars')->onDelete('cascade');

            $table->boolean('inUse')->nullable(); //auxiliar para saber si es la reserva que se esta creando actualmente 

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
        Schema::dropIfExists('reserves');
    }
}
