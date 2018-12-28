<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Flight extends Model
{
    protected $fillable = [
        'flightNumber',
        'airplaneModel',
		'airplaneCapacity',
		'departure_id',
		'arrival_id',
		'confirmed',
		'flightDate',
		'departureTime',
    ];

    public function airplaneseats(){
    	return $this->hasMany('App\Airplaneseat');
    }

    // public function package(){
    //     return $this->belongsTo('App\Package');
    // }

    public function flightsegments(){
        return $this->hasMany('App\Flightsegments');
    }

    public function arrival(){
        return $this->belongsTo('App\City', 'arrival_id');
    }

    public function departure(){
        return $this->belongsTo('App\City', 'departure_id');
    }

    // public function flightreserve(){
    //     return $this->hasMany('App\Flightreserve');
    // }
}
