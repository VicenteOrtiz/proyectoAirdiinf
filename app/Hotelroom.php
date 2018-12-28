<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Hotelroom extends Model
{
    protected $fillable = [
    	'number_of_beds',
    	'room_type',
    	'room_number',
    	'room_price_per_day',
    	'floor_number',
    	'available',
    	'hotel_id',
    ];

    public function hotel(){
    	return $this->belongsTo('App\Hotel');
    }
}
