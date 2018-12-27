<?php

namespace App\Http\Controllers;

use Validator;
use App\Airplaneseat;
use Illuminate\Http\Request;

class AirplaneseatController extends Controller
{
    public function rules(){
        return[
            'seat_type'=> 'required|numeric',
            'row'=>'required|numeric',
            'seat_letter'=>'required|string',
            'available'=>'required|numeric',
        ];
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Airplaneseat::all();
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(),$this->rules());
        if($validator->fails()){
            return $validator->messages();
        }
        $airplaneseat = new \App\Airplaneseat;

        

        $airplaneseat->seat_type = $request->seat_type; 
        $airplaneseat->row = $request->row;
        $airplaneseat->seat_letter = $request->seat_letter;
        $airplaneseat->available = $request->available == 1;
        $airplaneseat->save();
        return $airplaneseat;
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Airplaneseat  $airplaneseat
     * @return \Illuminate\Http\Response
     */
    public function show(Airplaneseat $airplaneseat)
    { 
        return $airplaneseat;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Airplaneseat  $airplaneseat
     * @return \Illuminate\Http\Response
     */
    public function edit(Airplaneseat $airplaneseat)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Airplaneseat  $airplaneseat
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Airplaneseat $airplaneseat)
    {
        $validator = Validator::make($request->all(),$this->rules());
        if($validator->fails()){
            return $validator->messages();
        }
        $airplaneseat->seat_type = $request->seat_type; 
        $airplaneseat->row = $request->row;
        $airplaneseat->seat_letter = $request->seat_letter;
        $airplaneseat->available = $request->available == 1;
        $airplaneseat->save();
        return $airplaneseat;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Airplaneseat  $airplaneseat
     * @return \Illuminate\Http\Response
     */
    public function destroy(Airplaneseat $airplaneseat)
    {
        $airplaneseat->delete();
        return "Eliminado con exito";
    }
}
