<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePurchasesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('purchases', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('totalPrice');
            $table->date('date');
            $table->timestamps();
            $table->integer('payment_id');
            $table->foreign('payment_id')->references('id')->on('payments');
            $table->integer('reserve_id');
            $table->foreign('reserve_id')->references('id')->on('reserves');

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('purchases');
    }
}
