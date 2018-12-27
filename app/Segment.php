<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Segment extends Model
{
    protected $fillable = [
    	'destinyCity',
    	'waitingTime',
    ];

    public function flightsegments(){
        return $this->hasMany('App\Flightsegments');
    }
}
