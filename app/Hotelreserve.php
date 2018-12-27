<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Hotelreserve extends Model
{
    protected $fillable = [
    	'hotel_id',
    	'reserve_id',
    ];

    public function reserve(){
    	return $this->belongsTo('App\Reserve');
    }

    public function hotel(){
    	return $this->belongsTo('App\Hotel');
    }
}
