<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateHotelreservesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('hotelreserves', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('hotelroom_id');
            $table->integer('reserve_id');

            $table->date('firstDay')->nullable();
            $table->date('lastDay')->nullable();

            $table->integer('confirmed')->nullable();

            $table->foreign('reserve_id')->references('id')->on('reserves')->onDelete('cascade');
            $table->foreign('hotelroom_id')->references('id')->on('hotelrooms')->onDelete('cascade');
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
        Schema::dropIfExists('hotelreserves');
    }
}
