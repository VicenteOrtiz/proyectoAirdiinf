<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Country extends Model
{
    protected $fillable = [
    	'countryName',
    ];

    public function city(){
    	return $this->hasMany('App\City');
    }
}
