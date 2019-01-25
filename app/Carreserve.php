<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Carreserve extends Model
{
    public function reserve(){
    	return $this->belongsTo('App\Reserve');
    }

    public function car(){
    	return $this->belongsTo('App\Car');
    }


}
