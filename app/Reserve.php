<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Reserve extends Model
{
    protected $fillable = [
    	'reserveDate',
    	'reserveBalance',
    	'insurance',
    ];


    public function insurence(){
        return $this->belongsTo('App\Insurence');
    }
}
