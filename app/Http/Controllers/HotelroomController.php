<?php

namespace App\Http\Controllers;

use App\Hotelroom;
use Illuminate\Http\Request;

class HotelroomController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $hotels = Country::All();
        return $hotels;

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
        $hotelroom = new Hotelroom();

        $hotelroom->numberOfBeds = $request->numberOfBeds;
        $hotelroom->roomType = $request->roomType;
        $hotelroom->roomNumber = $request->roomNumber;
        $hotelroom->roomPricePerDay = $request->roomPricePerDay;
        $hotelroom->floorNumber = $request->floorNumber;
        $hotelroom->available = $request->available;
        $hotelroom->hotel_id = $request->hotel_id;

        $hotelroom->save();

        return "habitacion añadida correctamente";


    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Hotelroom  $hotelroom
     * @return \Illuminate\Http\Response
     */
    public function show(Hotelroom $hotelroom)
    {
        //
        return $hotelroom;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Hotelroom  $hotelroom
     * @return \Illuminate\Http\Response
     */
    public function edit(Hotelroom $hotelroom)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Hotelroom  $hotelroom
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id) //-> Hotelroom $hotelroom
    {
        $hotelroom = Hotelroom::findOrFail($id);

        $hotelroom->numberOfBeds = $request->numberOfBeds;
        $hotelroom->roomType = $request->roomType;
        $hotelroom->roomNumber = $request->roomNumber;
        $hotelroom->roomPricePerDay = $request->roomPricePerDay;
        $hotelroom->floorNumber = $request->floorNumber;
        $hotelroom->available = $request->available;
        $hotelroom->hotel_id = $request->hotel_id;

        $hotelroom->save();

        return "la habitacion se ha actualizado correctamente";
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Hotelroom  $hotelroom
     * @return \Illuminate\Http\Response
     */
    public function destroy($id) //Hotelroom $hotelroom
    {
        $hotelroom = Hotelroom::findOrFail($id);

        $hotelroom->delete();

        return "se ha eliminado la habitacion satisfactoriamente";
    }
}
