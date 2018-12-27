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
        //
        //$flights = Flight::All();
        //return view('flights.index', compact('flights'));
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
        return $flight;
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Flight  $flight
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
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
    public function update(Request $request, Flight $flight)
    {
        //
        $validator = Validator::make($request->all(), $this->rules());
        if($validator->fails()){
            return $validator->messages();
        }
        $flight->flightNumber=$request->get('flightNumber');
        $flight->airplaneModel=$request->get('airplaneModel');
        $flight->airplaneCapacity=$request->get('airplaneCapacity');
        $flight->departureLocation=$request->get('departureLocation');
        $flight->arrivalLocation=$request->get('arrivalLocation');
        $flight->confirmed=$request->get('confirmed') == 1;
        $flight->flightDate=$request->get('flightDate');
        $flight->departureTime=$request->get('departureTime');
        $flight->save();
        return $flight;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Flight  $flight
     * @return \Illuminate\Http\Response
     */
    public function destroy(Flight $flight)
    {
        //
        $flight->delete();
        return response()->json(['success']);
    }

    public function searchOD(Request $request)
    {
        // $flights = Flight::Where([
        //     ['departureLocation','=',$request->origin],
        //     ['arrivalLocation','=',$request->destiny],
        // ])->get();

        // if($request->origin != null){
        //     $flights=Flight::Where('departureLocation', $request->origin)->get();
        // }
        // if($request->destiny != null){
        //     $flights=Flight::Where('departureLocation', $request->origin)->get();
        // }

        // if($request->origin != null && $request->destiny != null && $request->flightDate != null){
        //     $flights = Flight::Where([
        //         ['departureLocation','=',$request->origin],
        //         ['arrivalLocation','=',$request->destiny],
        //         ['flightDate','=',$request->flightDate],
        //     ])->get();
        // }else if($request->origin != null && $request->destiny != null){
        //     $flights = Flight::Where([
        //         ['departureLocation','=',$request->origin],
        //         ['arrivalLocation','=',$request->destiny],
        //     ])->get();
        // }else if($request->origin != null && $request->flightDate != null){
        //     $flights = Flight::Where([
        //         ['departureLocation','=',$request->origin],
        //         ['flightDate','=',$request->flightDate],
        //     ])->get();
        // }else if($request->destiny != null && $request->flightDate != null){
        //     $flights = Flight::Where([
        //         ['arrivalLocation','=',$request->destiny],
        //         ['flightDate','=',$request->flightDate],
        //     ])->get();
        // }else if($request->origin != null){
        //     $flights=Flight::Where('departureLocation', $request->origin)->get();
        // }else if($request->destiny != null){
        //     $flights=Flight::Where('arrivalLocation', $request->destiny)->get();
        // }else if($request->flightDate != null){
        //     $flights=Flight::Where('flightDate', $request->flightDate)->get();
        // }else{
        //     $flights = Flight::all();
        // }

        $origen = $request->origin;
        $destino = $request->destiny;
        $fecha = $request->flightDate;

        $flights = Flight::when($origen, function ($query, $origen) {
            return $query->where('departureLocation', $origen);
        })
        ->when($destino, function($query, $destino){
            return $query->where('arrivalLocation', $destino);
        })
        ->when($fecha, function($query, $fecha){
            return $query->where('flightDate');
        })
        ->get();



        return $flights;
    }
}
