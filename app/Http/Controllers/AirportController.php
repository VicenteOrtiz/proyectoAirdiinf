<?php

namespace App\Http\Controllers;

use Validator;
use App\Airport;
use Illuminate\Http\Request;

class AirportController extends Controller
{
    public function rules(){
        return
        [
            'name'=> 'required|string',
            'address'=> 'required|string',
            'city'=> 'required|string',
            'phoneNumber'=> 'required|numeric',
        ];
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $airports = Airport::All();

        return $airports;
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
        $airport = new Airport();
        $airport->name = $request->name;
        $airport->address = $request->address;
        $airport->city = $request->city;
        $airport->phoneNumber = $request->phoneNumber;
        $airport->save();
        return "Se ha creado satisfactoriamente un aeropuerto";

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Airport  $airport
     * @return \Illuminate\Http\Response
     */
    public function show(Airport $airport)
    {
        return $airport;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Airport  $airport
     * @return \Illuminate\Http\Response
     */
    public function edit(Airport $airport)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Airport  $airport
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(),$this->rules());
        if($validator->fails()){
            return $validator->messages();
        }
        $airport = Airport::findOrFail($id);
        $airport->name = $request->name;
        $airport->address = $request->address;
        $airport->city = $request->city;
        $airport->phoneNumber = $request->phoneNumber;

        $airport->save();

        return "Se ha modificado satisfactoriamente el aeropuerto";
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Airport  $airport
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $airport = Airport::findOrFail($id);

        $airport->delete();

        return "Se ha eliminado satisfactoriamente el aeropuerto";
    }
}
