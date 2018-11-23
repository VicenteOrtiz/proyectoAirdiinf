<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Airplaneseat extends Model
{
    protected $fillable = [
    	'seatType',
    	'row',
    	'seatLetter',
    	'available',
    ];
}
