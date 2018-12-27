<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Reserve extends Model
{
    protected $fillable = [
    	'reserveDate',
    	'reserveBalance',
    	'insurance',
    ];


    public function insurence(){
        return $this->belongsTo('App\Insurence');
    }

       public function car(){
        return $this->hasMany('App\Car');
    }
    public function flights(){
        return $this->hasOne('App\Flight');
    }

    public function hotelreserve(){
        return $this->hasMany('App\Hotelreserve');
    }

    public function packagereserve(){
        return $this->hasMany('App\Packagereserve');
    }
}
