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
            'carModel' => 'required|string',
            'vehicleRegistration' => 'required|string',
            'available' => 'required|numeric',
            'passengerCapacity' => 'required|numeric',
            'pricePerHour' => 'required|numeric',
        ];
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Car::all();
        //$cars = Car::All();

        //return view('cars.index', compact('cars'));
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
        $car = new \App\Car;
        $car->carModel=$request->get('carModel');
        $car->vehicleRegistration= $request->get('vehicleRegistration');
        $car->available=$request->get('available') == 1;
        $car->passengerCapacity=$request->get('passengerCapacity');
        $car->pricePerHour=$request->get('pricePerHour');
        $car->save();
        return $car;
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Car  $car
     * @return \Illuminate\Http\Response
     */
    public function show(Car $car)
    {
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
    public function update(Request $request, Car $car)
    {
        $validator = Validator::make($request->all(), $this->rules());
        if($validator->fails()){
            return $validator->messages();
        }
        $car->carModel=$request->get('carModel');
        $car->vehicleRegistration= $request->get('vehicleRegistration');
        $car->available=$request->get('available') == 1;
        $car->passengerCapacity=$request->get('passengerCapacity');
        $car->pricePerHour=$request->get('pricePerHour');
        $car->save();
        return $car;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Car  $car
     * @return \Illuminate\Http\Response
     */
    public function destroy(Car $car)
    {
        $car->delete();
        return response()->json([
                'success'
        ]);
        //return json_encode(['outcome'=>'success']);
        //return $car->delete()?'bien':'mal'; 
    }
}
