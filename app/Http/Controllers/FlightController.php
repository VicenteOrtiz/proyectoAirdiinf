<?php

namespace App\Http\Controllers; 

use App\Flight;
use App\City;
use App\Airport;
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
        $flights = Flight::all();
        return view('flights.index', compact("flights"));
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

    public function form(){
        $cities = City::All();
        $flights = Flight::All();

        return view('flights.search', compact('cities','flights'));
    }

    public function search(Request $request){


        //return "hola";
       // return $request->departureDate;
        list($departureCity, $departureCountry) = explode(',', $request->origen_id);
        list($arrivalCity, $arrivalCountry) = explode(',', $request->destino_id);

        $departureCityId = City::where('cityName', $departureCity)->get()->last()->id;
        //$departureCityId = City::where('cityName', $departureCity)->get()->last()->id;
        $arrivalCityId = City::where('cityName', $arrivalCity)->get()->last()->id;

        $departureAirports = Airport::where('city_id', $departureCityId)->get();
        $arrivalAirports = Airport::where('city_id', $arrivalCityId)->get();

        $departureAirportsId = $departureAirports->map(function($c) {return $c->id;});
        $arrivalAirportsId = $arrivalAirports->map(function($c) {return $c->id;});

        //return $request->fecha_id;
        $flights = Flight::whereIn('departure_id', $departureAirportsId)->whereIn('arrival_id', $arrivalAirportsId)->where('flightDate', $request->departureDate)->get();
        $cities = City::All();
        // $departure = $request->get('origen_id');
        // $arrival = $request->get('destino_id');

        // $flight = Flight::where('departure_id',$departure)->where('arrival_id', $arrival)->get();

        //return "hola";

        return view('flights.search', compact('flights','cities'));
        //return $flights;

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
