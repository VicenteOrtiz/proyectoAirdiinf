<?php

namespace App\Http\Controllers;

use Validator;
use App\Airplaneseat;
use Illuminate\Http\Request;
use App\Reserve;
use App\Flightreserve;
use App\Passenger;
use Auth;

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
        $airplaneseat->passenger_id = $request->passsenger_id;
        $airplaneseat->save();
        return "Se ha agregado correctamente";
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Airplaneseat  $airplaneseat
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    { 
        $airplaneseat = Airplaneseat::findOrFail($id);
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
    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(),$this->rules());
        if($validator->fails()){
            return $validator->messages();
        }
        $airplaneseat = Airplaneseat::findOrFail($id);
        $airplaneseat->seat_type = $request->seat_type; 
        $airplaneseat->row = $request->row;
        $airplaneseat->seat_letter = $request->seat_letter;
        $airplaneseat->available = $request->available == 1;
        $airplaneseat->passenger_id = $request->passsenger_id;
        $airplaneseat->save();
        return "Se ha editado correctamente";

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Airplaneseat  $airplaneseat
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $airplaneseat = Airplaneseat::findOrFail($id);
        $airplaneseat->delete();
        return "Eliminado con exito";
    }

    public function compra(Request $request)
    {

        $user = Auth::user(); //aqui el usuario ya esta logeado

        $validador = Reserve::all()->last()->inUse;
        $seatPurchase = new Flightreserve();
        $flightSeat = Airplaneseat::where('id',$request->seatId)->get()->first();
        $passenger = new Passenger();

        if($flightSeat->available == false){
            return "Este asiento está ocupado";
        }


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

        $passenger->name = $request->passengerName;
        $passenger->surname = $request->passengerSurname;
        $passenger->age = $request->passengerAge;
        $passenger->idNumber = $request->idNumber;
        $passenger->checkIn = false;

        $passenger->save();

        $seatPurchase->airplaneseat_id = $request->seatId;
        $seatPurchase->reserve_id = $reserva->id;

        $flightSeat->passenger_id = $passenger->id;
        $flightSeat->available = "true";

        $reserva->reserveBalance = $reserva->reserveBalance + $flightSeat->priceperseat_id;

        $flightSeat->save();
        $reserva->save();
        $seatPurchase->save();

        return redirect('/cart');
        return "reserva de avion hecha";

    }

    public function select(Request $request)
    {

        $seats = Airplaneseat::where('flight_id', $request->flight_id)->get();

        $user = Auth::user();

        if(is_object($user)){
            return view('flights.seats.index', compact('seats'));
        }else{
            return redirect('/home');
        }

        
        return $seats;
    }

    public function purchase(Request $request)
    {

        list($seatLetter, $row, $seat_id) = explode('-', $request->seat_id);
        $seat = Airplaneseat::find($seat_id);

        return view('flights.seats.purchase', compact('seat'));
    }

    public function confirm(Request $request)
    {

    }
}
