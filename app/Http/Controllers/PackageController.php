<?php

namespace App\Http\Controllers;

use Validator;
use App\Package;
use Illuminate\Http\Request;

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
}
