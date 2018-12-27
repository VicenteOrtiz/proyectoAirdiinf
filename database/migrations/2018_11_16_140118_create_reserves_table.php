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
            $table->timestamps();

            $table->integer('insurence_id');
            $table->foreign('insurence_id')->references('id')->on('insurences')->onDelete('cascade');

            $table->integer('car_id');
            $table->foreign('car_id')->references('id')->on('cars')->onDelete('cascade');

            // $table->dropForeign('answers_user_id_foreign');
            // $table->foreign('user_id')
            // ->references('id')->on('users')
            // ->onDelete('cascade');

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
