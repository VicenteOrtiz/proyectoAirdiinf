<?php

namespace App\Http\Controllers;

use Validator;
use App\Package;
use Illuminate\Http\Request;
use Auth;
use App\Airplaneseat;
use App\Flightreserve;
use App\Hotelreserve;
use App\Carreserve;
use App\Passenger;
use App\Reserve;
use App\Hotelroom;
use App\Car;

class PackageController extends Controller
{
    public function rules(){
        return
        [
            'precioPaquete'=>'required|numeric',
            'fechaInicio' => 'required|string',
            'fechaTermino' => 'required|string',
            'hotelroom_id' => 'exists:hotelrooms,id',
            'car_id' => 'exists:cars,id',
            'flight_id' => 'exists:flights,id',
        ];
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $packages = Package::All();

        return $packages;
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
        $package = new Package();
        $package->hotelroom_id = $request->hotelroom_id;
        $package->car_id = $request->car_id;
        $package->flight_id = $request->flight_id; 

        $package->precioPaquete = $request->precioPaquete;
        $package->fechaInicio = $request->fechaInicio;
        $package->fechaTermino = $request->fechaTermino;

        $package->save();

        return "Se ha creado satisfactoriamente el paquete";
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Package  $package
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $package = Package::findOrFail($id);

        return $package;

    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Package  $package
     * @return \Illuminate\Http\Response
     */
    public function edit(Package $package)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Package  $package
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(),$this->rules());
        if($validator->fails()){
            return $validator->messages();
        }
        $package = Package::findOrFail($id);
        $package->hotel_id = $request->hotelroom_id;
        $package->car_id = $request->car_id;
        $package->flight_id = $request->flight_id;
        $package->precioPaquete = $request->precioPaquete;
        $package->fechaInicio = $request->fechaInicio;
        $package->fechaTermino = $request->fechaTermino;

        $package->save();

        return "Se ha actualizado satisfactoriamente el paquete";
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Package  $package
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $package = Package::findOrFail($id);

        $package->delete();

        return "Se ha eliminado satisfactoriamente el paquete";
    }

    public function search(){
        $packages = Package::all();

        return view('packages.search', compact('packages'));
    }

    public function seat(Request $request){

        $user = Auth::user();

        $paquete = Package::findOrFail($request->packageid);

        $firstSeats = Airplaneseat::where('flight_id', $paquete->destiny->id)->get();
        $secondSeats = Airplaneseat::where('flight_id', $paquete->home->id)->get();

        if(is_object($user)){
            return view('packages.passenger', compact('paquete', 'firstSeats', 'secondSeats'));
        }else{
            return redirect('/home');
        }

    }

    public function compra(Request $request){

        $user = Auth::user(); //aqui el usuario ya esta logeado

        //$validador = $user->reserves->last()->inUse;
        $vacio = $user->reserves->last();

        $seatPurchase = new Flightreserve();
        $roomPurchase = new Hotelreserve();
        $reservaAuto = new Carreserve();

        $paquete = Package::findOrFail($request->packageid);



        $flightSeatida = Airplaneseat::where('id',$request->firstSeat)->get()->first();
        $flightSeatvuelta = Airplaneseat::where('id',$request->secondSeat)->get()->first();

        //room

        $room = Hotelroom::where('id', $paquete->hotelroom->id)->get()->last();

        //room


        //car

        $car = Car::where('id', $paquete->car->id)->get()->last();


        //car



        $passenger = new Passenger();

        if($vacio == null){
            $reserva = new Reserve();
            $reserva->reserveDate = NOW();
            $reserva->reserveBalance = 0;
            $reserva->insurance = false;
            $reserva->user_id = $user->id; //aqui dps va el usuario que este validado;
            //$reserva->insurance_id = 1;
            //$reserva->car_id = 0;
            $reserva->inUse = true;
            $reserva->save();
        }else{
            $validador = $user->reserves->last()->inUse;
            if($validador == false){
                $reserva = new Reserve();
                $reserva->reserveDate = NOW();
                $reserva->reserveBalance = 0;
                $reserva->insurance = false;
                $reserva->user_id = $user->id; //aqui dps va el usuario que este validado;
                //$reserva->insurance_id = 1;
                //$reserva->car_id = 0;
                $reserva->inUse = true;
                $reserva->save();

            }else{
                $reserva = Reserve::all()->last();
            }
        }

        $passenger->name = $request->passengerName;
        $passenger->surname = $request->passengerSurname;
        $passenger->age = $request->passengerAge;
        $passenger->idNumber = $request->idNumber;
        $passenger->checkIn = false;

        $passenger->save();

        $seatPurchase->airplaneseat_id = $request->firstSeat;
        $seatPurchase->reserve_id = $reserva->id;
        $seatPurchase->save();

        $seatPurchasedos = new Flightreserve();
        $seatPurchase->airplaneseat_id = $request->secondSeat;
        $seatPurchase->reserve_id = $reserva->id;
        $seatPurchase->save();

        $flightSeatida->passenger_id = $passenger->id;
        $flightSeatida->available = "true";

        $flightSeatvuelta->passenger_id = $passenger->id;
        $flightSeatvuelta->available = "true";

        $reserva->reserveBalance = $reserva->reserveBalance + $flightSeatida->priceperseat_id;
        $reserva->reserveBalance = $reserva->reserveBalance + $flightSeatvuelta->priceperseat_id;

        $flightSeatida->save();
        $flightSeatvuelta->save();

        $roomPurchase->hotelroom_id = $paquete->hotelroom->id;
        $roomPurchase->reserve_id = $reserva->id;

        $reserva->reserveBalance = $reserva->reserveBalance + $room->room_price_per_day;

        $room->save();
        //return $request->roomId/* $roomPurchase->reserve_id*/;
        $roomPurchase->save();

        $reservaAuto->reserve_id = $reserva->id;
        $reservaAuto->car_id = $car->id;
        $reservaAuto->save();

        //$reserva->car_id = $car->id;
        $reserva->reserveBalance = $reserva->reserveBalance + ($car->pricePerHour)*12; //el *12 se debe modificar en funcion al calculo de horas que se utilizara

        $reserva->save();
        //$seatPurchase->save();

        return redirect('/cart');

    }

    public function resumen(Request $request){
        $paquete = Package::findOrFail($request->packageid);

        return view('packages.resume', compact('paquete'));
    }
}
