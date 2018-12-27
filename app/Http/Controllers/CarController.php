<?php

namespace App\Http\Controllers; 

use Validator;
use App\Car;
use Illuminate\Http\Request;

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
        $cars = Car::All();

        return view('cars.index', compact('cars')); 
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
}
