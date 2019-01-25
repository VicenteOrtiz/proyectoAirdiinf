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

    // public function airport(){
    //     return $this->belongsTo('App\Airport');
    // }

    public function arrival(){
        return $this->belongsTo('App\Airport', 'arrival_id');
    }

    public function departure(){
        return $this->belongsTo('App\Airport', 'departure_id');
    }

    public function destiny(){
        return $this->hasOne('App\Package', 'destiny_id');
    }

    public function home(){
        return $this->hasOne('App\Package', 'home_id');
    }



    // public function flightreserve(){
    //     return $this->hasMany('App\Flightreserve');
    // }
} 
