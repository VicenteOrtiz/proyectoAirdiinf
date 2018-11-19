<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Flight extends Model
{
        protected $fillable = [
        'flightNumber',
        'airplaneModel',
		'airplaneCapacity',
		'departureLocation',
		'arrivalLocation',
		'confirmed',
    ];
}
