<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePackagereservesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('packagereserves', function (Blueprint $table) {
            $table->increments('id');
            $table->timestamps();

            $table->integer('reserve_id');
            $table->integer('package_id');

            $table->foreign('reserve_id')->references('id')->on('reserves');
            $table->foreign('package_id')->references('id')->on('packages');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('packagereserves');
    }
}
