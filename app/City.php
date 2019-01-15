<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class City extends Model
{
    protected $fillable = [
    	'cityName',
    	'country_id',
    ];

    public function country(){
    	return $this->belongsTo('App\Country');
    }

    public function hotels(){
    	return $this->hasMany('App\Hotel');
    }

    public function airports(){
        return $this->hasMany('App\Airport');
    }

    public function cars(){
        return $this->hasMany('App\Car');
    }
}
