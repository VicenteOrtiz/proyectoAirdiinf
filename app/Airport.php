<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Airport extends Model
{
    protected $fillable=[
    	'name',
    	'address',
    	'city',
    	'phoneNumber',
    ];

    public function city(){
    	return $this->belongsTo('App\City');
    }

    public function flights(){
    	return $this->hasMany('App\Flight');
    }

    public function arrivals(){
        return $this->hasMany('App\Flight', 'arrival_id');
    }

    public function departures(){
        return $this->hasMany('App\Flight', 'departure_id');
    }

}
