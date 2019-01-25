<?php

namespace App\Http\Controllers; 

use Validator;
use App\Car;
use Illuminate\Http\Request;
use App\City;
use App\Reserve;
use App\User;
use Auth;

class CarController extends Controller
{
    public function rules(){
        return
        [
            'carModel'=>'required|string',
            'vehicleRegistration'=>'required|string',
            'available'=> 'required|numeric',
            'passengerCapacity'=> 'required|numeric',
            'pricePerHour'=>'required|numeric',
        ];
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $cars = Car::all();
        return $cars; 
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
        $car = new Car();
        $car->carModel = $request->carModel;
        $car->vehicleRegistration = $request->vehicleRegistration;
        $car->available = $request->available==1;
        $car->passengerCapacity = $request->passengerCapacity;
        $car->pricePerHour = $request->pricePerHour;
        $car->save();
        return "Se ha añadido satisfactoriamente el auto";
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Car  $car
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $car = Car::findOrFail($id);

        return $car;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Car  $car
     * @return \Illuminate\Http\Response
     */
    public function edit(Car $car)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Car  $car
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(),$this->rules());
        if($validator->fails()){
            return $validator->messages();
        }
        $car = Car::findOrFail($id);

        $car->carModel = $request->carModel;
        $car->vehicleRegistration = $request->vehicleRegistration;
        $car->available = $request->available==1;
        $car->passengerCapacity = $request->passengerCapacity;
        $car->pricePerHour = $request->pricePerHour;

        $car->save();

        return "Se ha actualizado satisfactoriamente el auto";
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Car  $car
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $car = Car::findOrFail($id);

        $car->delete();

        return "Se ha eliminado satisfactoriamente el auto";
    }

    public function compra(Request $request)
    {

        $user = Auth::user();

        $vacio = $user->reserves->last();

        $car = Car::where('id', $request->carId)->get()->last();

        if($car->available == false){
            return "Este auto ya está ocupado";
        }

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
            $validador = Reserve::all()->last()->inUse;
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

        if($reserva->car_id != null){
            return "la reserva actual ya tiene un auto asignado";
        }

        //$car->available = false;

        $reserva->car_id = $car->id;
        $reserva->reserveBalance = $reserva->reserveBalance + ($car->pricePerHour)*12; //el *12 se debe modificar en funcion al calculo de horas que se utilizara

        $reserva->save();

        return redirect('/cart');
        return "reserva de auto hecha exitosamente";
    }

    public function form()
    {
        $cities = City::all();
        $cars = Car::all()->where('available', 1);

        return view('cars.search', compact('cities','cars'));
    }

    public function search(Request $request)
    {



        //modelo, capacidad, precio
        list($carCity, $carCountry) = explode(',', $request->ciudad_id);

        //return $carCity;
        $carCityId = City::where('cityName', $carCity)->get()->last()->id;
        //return $carCityId;
        $cars = Car::where('city_id', $carCityId)->get();
        $cities = City::all();
        //return $cars;
        return view('cars.search', compact('cars','cities'));

        
    }

    public function purchase(Request $request)
    {

        return null;
    }
}
