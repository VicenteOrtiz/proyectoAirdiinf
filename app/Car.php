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
}
