<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Airplaneseat extends Model
{
    protected $fillable = [
    	'seat_type',
    	'row',
    	'seat_letter',
    	'available',
    ];

    public function flights(){
    	return $this->hasOne('App\Flight');
    }

    public function passengers(){
    	return $this->hasOne('App\Passenger');
    }

    public function flightreserve(){
        return $this->hasMany('App\Flightreserve');
    }

    public function package(){
        return $this->belongsTo('App\Package');
    }

}
