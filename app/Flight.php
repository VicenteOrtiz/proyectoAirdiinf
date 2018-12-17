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
		'flightDate',
		'departureTime',
    ];

    public function airplaneseats(){
    	return $this->hasMany('App\Airplaneseat');
    }

    public function package(){
        return $this->belongsTo('App\Package');
    }

}
