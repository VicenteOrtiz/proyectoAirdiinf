<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Passenger extends Model
{
    protected $fillable = [
    	'name',
    	'surname',
    	'age',
    	'checkIn',
    ];
}
