<?php

namespace App\Http\Controllers;

use App\Passenger;
use Illuminate\Http\Request;
use Validator;

class PassengerController extends Controller
{
    public function rules(){
        return
        [
            'name' => 'required|string',
            'surname' => 'required|string',
            'age' => 'required|numeric',
            'checkIn' => 'required|numeric',
        ];
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $passengers = Passenger::All();
        return $passengers;
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
        $validator = Validator::make($request->all(), $this->rules());
        if($validator->fails()){
            return $validator->messages();
        }
        $passenger = new \App\Passenger;
        $passenger->name = $request->get('name');
        $passenger->surname = $request->get('surname');
        $passenger->age = $request->get('age');
        $passenger->checkIn = $request->get('checkIn');
        $passenger->save();
        return "Se ha añadido satisfactoriamente el pasajero";
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Passenger  $passenger
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $passenger = Passenger::findOrFail($id);
        return $passenger;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Passenger  $passenger
     * @return \Illuminate\Http\Response
     */
    public function edit(Passenger $passenger)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Passenger  $passenger
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Passenger $passenger)
    {
        $validator = Validator::make($request->all(), $this->rules());
        if($validator->fails()){
            return $validator->messages();
        }
        $passenger->name = $request->get('name');
        $passenger->surname = $request->get('surname');
        $passenger->age = $request->get('age');
        $passenger->checkIn = $request->get('checkIn');
        $passenger->save();
        return "Se ha actualizado satisfactoriamente el pasajero";
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Passenger  $passenger
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $passenger = Passenger::findOrFail($id);
        $passenger->delete();
        return "Se ha eliminado satisfactoriamente el pasajero";
    }
}