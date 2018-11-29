<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Airplaneseat extends Model
{
    protected $fillable = [
    	'seatType',
    	'row',
    	'seatLetter',
    	'available',
    ];

    public function flights(){
    	return $this->hasOne('App\Flight');
    }

    public function passengers(){
    	return $this->hasOne('App\Passenger');
    }

}
