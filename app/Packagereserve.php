<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Packagereserve extends Model
{
    protected $fillable = [
    	'reserve_id',
    	'package_id',
    ]; 

    public function reserve(){
        return $this->belongsTo('App\Reserve');
    }

    public function package(){
        return $this->belongsTo('App\Package');
    }
}
