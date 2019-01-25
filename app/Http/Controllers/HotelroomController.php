<?php

namespace App\Http\Controllers;

use Validator;
use App\Hotelroom;
use Illuminate\Http\Request;
use App\Reserve;
use App\Hotelreserve;
use Auth;
use App\User;
use Carbon\Carbon;

class HotelroomController extends Controller
{
    public function rules(){
        return
        [
            'number_of_beds'=>'required|numeric',
            'room_type'=>'required|numeric',
            'room_number'=>'required|numeric',
            'room_price_per_day'=>'required|numeric',
            'floor_number'=>'required|numeric',
            'available'=>'required|numeric',
            'hotel_id'=>'exists:hotels,id',
        ];
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $hotels = Hotelroom::All();
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
        $validator = Validator::make($request->all(),$this->rules());
        if($validator->fails()){
            return $validator->messages();
        }
        $hotelroom = new Hotelroom();
        $hotelroom->number_of_beds = $request->number_of_beds;
        $hotelroom->room_type = $request->room_type;
        $hotelroom->room_number = $request->room_number;
        $hotelroom->room_price_per_day = $request->room_price_per_day;
        $hotelroom->floor_number = $request->floor_number;
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
    public function show($id)
    {
        $hotelroom = Hotelroom::findOrFail();
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
        $validator = Validator::make($request->all(),$this->rules());
        if($validator->fails()){
            return $validator->messages();
        }
        $hotelroom = Hotelroom::findOrFail($id);
        $hotelroom->number_of_beds = $request->number_of_beds;
        $hotelroom->room_type = $request->room_type;
        $hotelroom->room_number = $request->room_number;
        $hotelroom->room_price_per_day = $request->room_price_per_day;
        $hotelroom->floor_number = $request->floor_number;
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
    public function destroy($id)
    {
        $hotelroom = Hotelroom::findOrFail($id);

        $hotelroom->delete();

        return "se ha eliminado la habitacion satisfactoriamente";
    }

    public function compra(Request $request)
    {

        $user = Auth::user();
        $vacio = $user->reserves->last();

        $roomPurchase = new Hotelreserve();

        $room = Hotelroom::where('id', $request->roomId)->get()->last();






        if($room->available == false){
            return "Esta habitacion ya está ocupada";
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

        // if($validador == false){
        //     $reserva = new Reserve();
        //     $reserva->reserveDate = NOW();
        //     $reserva->reserveBalance = 0;
        //     $reserva->insurance = false;
        //     $reserva->user_id = 1; //aqui dps va el usuario que este validado;
        //     //$reserva->insurance_id = 1;
        //     //$reserva->car_id = 0;
        //     $reserva->inUse = true;
        //     $reserva->save();
        // }else{
        //     $reserva = Reserve::all()->last();
        // }



        //$room->available = false;

        $roomPurchase->hotelroom_id = $request->roomId;
        $roomPurchase->reserve_id = $reserva->id;

        $reserva->reserveBalance = $reserva->reserveBalance + $room->room_price_per_day;

        $room->save();

        $reserva->save();
        //return $request->roomId/* $roomPurchase->reserve_id*/;
        $roomPurchase->save();

        return redirect('/cart');
        return "reserva de habitacion hecha";
    }

    public function select(Request $request)
    {
        $rooms = Hotelroom::where('hotel_id', $request->hotel_id)->get();

        $user = Auth::user();

        if(is_object($user)){
            return view('hotels.rooms.index', compact('rooms'));
        }else{
            return redirect('/home');
        }

        
        return $seats;
    }

    public function purchase(Request $request)
    {
        list($room_number, $numberofBeds, $roomPrice, $roomId) = explode('-', $request->room_id);


        $room = Hotelroom::find($roomId);

        return view('hotels.rooms.purchase', compact('room'));
    }
}
