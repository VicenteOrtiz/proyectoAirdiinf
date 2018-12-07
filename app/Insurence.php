<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Insurence extends Model
{
    protected $fillable=[
    	'amount',
    	'description',
    ];

    public function package(){
        return $this->belongsTo('App\Package');
    }


    public function reserve(){
        return $this->hasMany('App\Reserve');
    }
}
