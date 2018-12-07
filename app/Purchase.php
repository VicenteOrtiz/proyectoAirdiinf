<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Purchase extends Model
{
    protected $fillable =[
    	'totalPrice',
    	'date',
    ];

    public function payment(){
        return $this->belongsTo('App\Payment');
    }
    
     public function reserve(){
        return $this->hasMany('App\Reserve');
    }
}
}
