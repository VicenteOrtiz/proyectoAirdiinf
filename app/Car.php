<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Car extends Model
{
    protected $fillable = [
    	'carModel',
    	'vehicleRegistration',
    	'available',
    	'passengerCapacity',
    	'pricePerHour',
    ];

    public function reserve(){
        return $this->belongsTo('App\Reserve');
    }

    public function package(){
        return $this->belongsTo('App\Package');
    }

    public function city(){
        return $this->belongsTo('App\City');
    }

}
