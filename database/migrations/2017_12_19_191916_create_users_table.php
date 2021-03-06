<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->increments('id');

            $table->integer('rol_id')->nullable();
            $table->integer('record_id')->nullable();

            $table->string('name');
            $table->string('surname');
            $table->integer('age');
            $table->string('email')->unique();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('passportNumber');
            $table->string('phoneNumber');
            $table->boolean('disability');
            $table->string('password');
            $table->rememberToken();
            $table->timestamps();
            $table->foreign('rol_id')->references('id')->on('roles')->onDelete('cascade');
            $table->foreign('record_id')->references('id')->on('records')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
}
