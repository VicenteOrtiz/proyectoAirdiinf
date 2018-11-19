<?php

namespace App;

use Illuminate\Database\Eloquent\Model; 

class Hotel extends Model
{
    protected $fillable = [

    	'hotelName',
    	'stars',
    	'hotelCapacity',
    	'phoneNumber',
    	'address',

    ];
}
