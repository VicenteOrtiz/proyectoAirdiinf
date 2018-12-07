<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Package extends Model
{
    //d

    protected $fillable = [
    	'precioPaquete',
    	'fechaInicio',
    	'fechaTermino',

    ]; 

    public function insurence(){
        return $this->hasMany('App\Insurence');
    }
}
