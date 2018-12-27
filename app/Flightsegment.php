<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Flightsegment extends Model
{
    protected $fillable = [
        'flight_id',
        'segment_id',
    ];

    public function segment(){
    	return $this->belongsTo('App\Segment');
    }

    public function flight(){
    	return $this->belongsTo('App\Flight');
    }


}
