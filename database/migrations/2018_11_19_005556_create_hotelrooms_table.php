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

            $table->integer('hotel_id'); 
            $table->foreign('hotel_id')->references('id')->on('hotels')->onDelete('cascade');

            $table->integer('number_of_beds');
            $table->integer('room_type');
            $table->integer('room_number');
            $table->integer('room_price_per_day');
            $table->integer('floor_number');
            $table->boolean('available');

            

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
