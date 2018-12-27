<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateHotelroomsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('hotelrooms', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('numberOfBeds');
            $table->integer('roomType');
            $table->integer('roomNumber');
            $table->integer('roomPricePerDay');
            $table->integer('floorNumber');
            $table->boolean('available');

            $table->integer('hotel_id'); 
            $table->foreign('hotel_id')->references('id')->on('hotels')->onDelete('cascade');

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
        Schema::dropIfExists('hotelrooms');
    }
} 
