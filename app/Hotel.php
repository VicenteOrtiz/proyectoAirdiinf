<?php

namespace App;

use Illuminate\Database\Eloquent\Model; 

class Hotel extends Model
{
    protected $fillable = [

    	'hotelName',
    	'stars',
    	'hotelCapacity',
    	'phoneNumber',
    	'address',
    ];

    public function package(){
    	return $this->belongsTo('App\Package');
    }

    public function hotelroom(){
        return $this->hasMany('App\Hotelroom');
    }

    public function city(){
        return $this->belongsTo('App\City');
    }

    public function hotelreserve(){
        return $this->hasOne('App\Hotelreserve');
    }

}
