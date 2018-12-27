<?php

namespace App\Http\Controllers;

use Validator;
use App\Hotel;
use App\Country;
use Illuminate\Http\Request;  

class HotelController extends Controller
{
    public function rules(){
        return
        [
        'hotelName'=> 'required|string',
        'hotelCapacity'=> 'required|numeric',
        'stars'=> 'required|numeric|max: 5',
        'phoneNumber'=> 'required|string',
        'address'=> 'address|string',
        ];
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $countries = Country::All();
        return Hotel::all();

        return view('hotels.index', compact('countries'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request) //Esto despues va en Store, pero se pone aca solo para efectos del crud
    {
        //
        


    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request) //Todo lo que está acá, debe ir en create para efectos CRUD
    {
        $validator = Validator::make($request->all(),$this->rules());
        if($validator->fails()){
            return $validator->messages();
        }
        $hotel = new Hotel();

        $hotel->hotelName = $request ->hotelName;
        $hotel->stars = $request ->stars;
        $hotel->hotelCapacity = $request ->hotelCapacity;
        $hotel->phoneNumber = $request->phoneNumber;
        $hotel->address = $request ->address;

        $hotel->save();

        return "se ha creado correctamente";
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Hotel  $hotel
     * @return \Illuminate\Http\Response
     */

    public function showCities(Hotel $hotel)
    {
        $cities = Country::where("countryName", request("paises_id"))
             ->first()
             ->city; 

        return view('hotels.cities', compact('cities'));
    }

    public function show(Hotel $hotel)
    {
        
        //return Country::with('city.hotels')->get();
        // return Country::where("countryName", request("paises_id"))
        //     ->first()
        //     ->city->flatmap(function($ciudad) {
        //         return $ciudad->hotels;
        //     });
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Hotel  $hotel
     * @return \Illuminate\Http\Response
     */
    public function edit(Hotel $hotel)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Hotel  $hotel
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id) //original en vez de id, es "Hotel $hotel"
    { 
        $validator = Validator::make($request->all(),$this->rules());
        if($validator->fails()){
            return $validator->messages();
        }
        $hotel = Hotel::findOrFail($id);

        $hotel->hotelName = $request ->hotelName;
        $hotel->stars = $request ->stars;
        $hotel->hotelCapacity = $request ->hotelCapacity;
        $hotel->phoneNumber = $request ->phoneNumber;
        $hotel->address = $request ->address;

        $hotel->save();

        return "se ha editado correctamente";

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Hotel  $hotel
     * @return \Illuminate\Http\Response
     */
    public function destroy($id) //este es el delete, $id -> "Hotel $hotel"
    {
        $hotel = Hotel::findOrFail($id);
        $hotel->delete();

        return "eliminacion exitosa";
    }
}
