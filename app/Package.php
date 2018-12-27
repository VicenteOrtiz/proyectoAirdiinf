<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Package extends Model
{
    //d

    protected $fillable = [
    	'precioPaquete',
    	'fechaInicio',
    	'fechaTermino',
        'hotel_id',
        'car_id',
        'flight_id',
    ]; 

    public function insurence(){
        return $this->hasMany('App\Insurence');
    }

    public function hotel(){
    	return $this->hasMany('App\Hotel');
    }

    public function car(){
    	return $this->hasMany('App\Car');
    }
    
    public function flight(){
    	return $this->hasMany('App\Flight');
    }

    public function packagereserve(){
        return $this->hasMany('App\Packagereserve');
    }
}
