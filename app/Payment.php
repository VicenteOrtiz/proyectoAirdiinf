<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Payment extends Model
{
    protected $fillable=[
    	'paymentMethod',
    	'bankName',
    ];

    public function purchase(){
        return $this->hasMany('App\Purchase');
    }
    
}
