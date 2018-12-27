<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Flightreserve extends Model
{
    protected $fillable = [
        'flight_id',
        'reserve_id',
    ];

    public function flight(){
    	return $this->belongsTo('App\Flight');
    }

    public function reserve(){
    	return $this->belongsTo('App\Reserve');
    }
}
