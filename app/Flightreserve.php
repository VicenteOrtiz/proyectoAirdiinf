<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Flightreserve extends Model
{
    protected $fillable = [
        'airplaneseat_id',
        'reserve_id',
    ];

    public function airplaneseat(){
    	return $this->belongsTo('App\Airplaneseat');
    }

    public function reserve(){
    	return $this->belongsTo('App\Reserve');
    }
}
