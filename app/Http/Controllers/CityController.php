<?php

namespace App\Http\Controllers;

use Validator;
use App\City;
use Illuminate\Http\Request;

class CityController extends Controller
{
    public function rules(){
        return
        [ 
            'cityName' => 'required|string',
        ];
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
<<<<<<< HEAD
        return City::all();
=======
        $cities = City::All();

        return $cities;
>>>>>>> 8a82be147eeebc1b99e354a54d4df96e4b34fa43
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
<<<<<<< HEAD
        $validator = Validator::make($request->all(),$this->rules());
        if($validator->fails()){
            return $validator->messages();
        }
        $city = new \App\City;
        $city->cityName = $request->get('cityName');
        $city->save();
        return $city;
=======
        $city = new City();

        $city->cityName = $request->cityName;
        $city->country_id = $request->country_id;

        $city->save();

        return "Se ha creado una ciudad satisfactoriamente";
>>>>>>> 8a82be147eeebc1b99e354a54d4df96e4b34fa43
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\City  $city
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
<<<<<<< HEAD
=======
        $city = City::findOrFail($id);

>>>>>>> 8a82be147eeebc1b99e354a54d4df96e4b34fa43
        return $city;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\City  $city
     * @return \Illuminate\Http\Response
     */
    public function edit(City $city)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\City  $city
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
<<<<<<< HEAD
        $validator = Validator::make($request->all(),$this->rules());
        if($validator->fails()){
            return $validator->messages();
        }
        $city->cityName = $request->get('cityName');
        $city->save();
        return $city;
=======
        $city = City::findOrFail($id);

        $city->cityName = $request->cityName;
        $city->country_id = $request->country_id;

        $city->save();

        return "Se ha actualizado satisfactoriamente la ciudad";
>>>>>>> 8a82be147eeebc1b99e354a54d4df96e4b34fa43
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\City  $city
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
<<<<<<< HEAD
        $city->delete();
        return response()->json([
                'success'
        ]);
=======
        $city = City::findOrFail($id);

        $city->delete();

        return "Se ha eliminado satisfactoriamente la ciudad";
>>>>>>> 8a82be147eeebc1b99e354a54d4df96e4b34fa43
    }
}
