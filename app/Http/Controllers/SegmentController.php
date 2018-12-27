<?php

namespace App\Http\Controllers;

use Validator;
use App\Segment;
use Illuminate\Http\Request;

class SegmentController extends Controller
{
    public function rules(){
        return
        [
            'destinyCity' => 'required|string',
            'waitingTime' => 'required|string',
        ];
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $segment = Segment::All();
        return $segment;
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
        //
        $validator = Validator::make($request->all(),$this->rules());
        if($validator->fails()){
            return $validator->messages();
        }
        $segment = new \App\Segment;
        $segment->destinyCity = $request->get('destinyCity');
        $segment->waitingTime = $request->get('waitingTime');
        $segment->save();
        return "Se ha añadido satisfactoriamente el tramo";
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Segment  $segment
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $segment = Segment::findOrFail($id);
        return $segment;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Segment  $segment
     * @return \Illuminate\Http\Response
     */
    public function edit(Segment $segment)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Segment  $segment
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Segment $segment)
    {
        $validator = validator::make($request->all(),$this->rules());
        if($validator->fails()){
            return $validator->messages();
        }
        $segment->destinyCity = $request->get('destinyCity');
        $segment->waitingTime = $request->get('waitingTime');
        $segment->save();
        return "Se ha acutalizado satisfactoriamente el tramo";
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Segment  $segment
     * @return \Illuminate\Http\Response
     */
    public function destroy(Segment $segment)
    {
        $segment->delete();
        return "Se ha eliminado satisfactoriamente el tramo";
    }
}
