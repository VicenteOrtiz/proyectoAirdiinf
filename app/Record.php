<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Record extends Model
{
    protected $fillable=[
    	'logDate',
    	'logDescription',
    ];

    public function user(){
        return $this->hasMany('App\User');
    }
}
