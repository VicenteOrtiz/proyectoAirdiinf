<?php

namespace App\Http\Controllers;

use Validator;
use App\Reserve;
use Illuminate\Http\Request;

class ReserveController extends Controller
{
    public function rules(){
        return
        [
            'reserveDate' => 'required|string',
            'reserveBalance' => 'required|numeric',
            'insurance' => 'required|numeric',
        ];
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $reserve = Reserve::All();
        return $reserve;
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
        $validator = new Validator::make($request->all(),$this->rules());
        if($validator->fails()){
            return $validator->messages();
        }
        $reserve = new \App\Reserve;
        $reserve->reserveDate = $request->get('reserveDate');
        $reserve->reserveBalance = $request->get('reserveBalance');
        $reserve->insurance = $request->get('insurance');
        $reserve->save();
        return $reserve;
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Reserve  $reserve
     * @return \Illuminate\Http\Response
     */
    public function show(Reserve $reserve)
    {
        return $reserve;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Reserve  $reserve
     * @return \Illuminate\Http\Response
     */
    public function edit(Reserve $reserve)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Reserve  $reserve
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Reserve $reserve)
    {
                $validator = new Validator::make($request->all(),$this->rules());
        if($validator->fails()){
            return $validator->messages();
        }
        $reserve->reserveDate = $request->get('reserveDate');
        $reserve->reserveBalance = $request->get('reserveBalance');
        $reserve->insurance = $request->get('insurance');
        $reserve->save();
        return $reserve;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Reserve  $reserve
     * @return \Illuminate\Http\Response
     */
    public function destroy(Reserve $reserve)
    {
        $reserve->delete();
        return response()->(['success']);
    }
}
