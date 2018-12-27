<?php

namespace App\Http\Controllers; 

use App\Flight;
use Illuminate\Http\Request;
use Validator;

class FlightController extends Controller
{
    public function rules(){
        return
        [
            'flightNumber' => 'required|string',
            'airplaneModel' => 'required|string',
            'airplaneCapacity' => 'required|numeric',
            'departureLocation' => 'required|string',
            'arrivalLocation' => 'required|string',
            'confirmed' => 'required|numeric',
            'flightDate' => 'required|string',
            'departureTime' => 'required|string',
        ];
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {        
        return Flight::all();

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
        //
        $validator = Validator::make($request->all(), $this->rules());
        if($validator->fails()){
            return $validator->messages();
        }
        $flight = new \App\Flight;
        $flight->flightNumber=$request->get('flightNumber');
        $flight->airplaneModel=$request->get('airplaneModel');
        $flight->airplaneCapacity=$request->get('airplaneCapacity');
        $flight->departureLocation=$request->get('departureLocation');
        $flight->arrivalLocation=$request->get('arrivalLocation');
        $flight->confirmed=$request->get('confirmed') == 1;
        $flight->flightDate=$request->get('flightDate');
        $flight->departureTime=$request->get('departureTime');
        $flight->save();
        return "Se ha agregado correctamente";
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Flight  $flight
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $flight = Flight::findOrFail($id);
        return $flight;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Flight  $flight
     * @return \Illuminate\Http\Response
     */
    public function edit(Flight $flight)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Flight  $flight
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
        $validator = Validator::make($request->all(), $this->rules());
        if($validator->fails()){
            return $validator->messages();
        }
        $flight = Flight::findOrFail($id);
        $flight->flightNumber=$request->get('flightNumber');
        $flight->airplaneModel=$request->get('airplaneModel');
        $flight->airplaneCapacity=$request->get('airplaneCapacity');
        $flight->departureLocation=$request->get('departureLocation');
        $flight->arrivalLocation=$request->get('arrivalLocation');
        $flight->confirmed=$request->get('confirmed') == 1;
        $flight->flightDate=$request->get('flightDate');
        $flight->departureTime=$request->get('departureTime');
        $flight->save();
        return "Se ha editado correctamente";
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Flight  $flight
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $flight = Flight::findOrFail($id);
        $flight->delete();
        return "Se ha borrado correctamente";
    }
}
