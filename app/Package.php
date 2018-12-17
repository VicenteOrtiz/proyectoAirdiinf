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
}
