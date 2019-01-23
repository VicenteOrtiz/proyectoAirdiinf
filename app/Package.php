<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Package extends Model
{
    protected $fillable = [
    	'precioPaquete',
    	'fechaInicio',
    	'fechaTermino',
        'hotelroom_id',
        'car_id',
        'airplaneseat_id',
    ]; 

    public function insurence(){
        return $this->hasMany('App\Insurence');
    }

    public function hotelroom(){
    	return $this->hasMany('App\Hotelroom');
    }

    public function car(){
    	return $this->hasMany('App\Car');
    }
    
    public function airplaneseat(){
    	return $this->hasMany('App\Airplaneseat');
    }

    public function packagereserve(){
        return $this->hasMany('App\Packagereserve');
    }
}
