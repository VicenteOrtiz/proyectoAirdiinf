<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Hotelreserve extends Model
{
    protected $fillable = [
    	'hotelroom_id',
    	'reserve_id',
    ];

    public function hotelroom(){
        return $this->belongsTo('App\Hotelroom');
    }

    public function reserve(){
        return $this->belongsTo('App\Reserve');
    }
}
