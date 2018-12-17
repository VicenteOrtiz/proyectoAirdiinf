<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Hotelroom extends Model
{
    protected $fillable = [
    	'numberOfBeds',
    	'roomType',
    	'roomNumber',
    	'roomPricePerDay',
    	'floorNumber',
    	'available',
    	'hotel_id',
    ];

    public function hotel(){
    	return $this->belongsTo('App\Hotel');
    }
}
