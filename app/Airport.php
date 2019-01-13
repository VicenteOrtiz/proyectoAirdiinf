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

    public function airports(){
    	return $this->hasMany('App\Flight');
    }
}
