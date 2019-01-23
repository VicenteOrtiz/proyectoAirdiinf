<?php

namespace App\Http\Controllers;

use App\Insurence;
use Illuminate\Http\Request;
use Validator;

class InsurenceController extends Controller
{
     public function rules(){
        return
        [
            'amount' => 'required|numeric',
            'description' => 'required|string',
        ];
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Insurence::all();
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
        $insurece = new \App\Insurence;
        $insurece->amount=$request->get('amount');
        $insurece->description=$request->get('description');
        $insurece->save();
        return $insurece;
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Insurence  $insurence
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $insurence = Insurence::findOrFail($id);
        return $insurence;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Insurence  $insurence
     * @return \Illuminate\Http\Response
     */
    public function edit(Insurence $insurence)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Insurence  $insurence
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Insurence $insurence)
    {
        //
        $validator = Validator::make($request->all(), $this->rules());
        if($validator->fails()){
            return $validator->messages();
        }
        $insurece->amount=$request->get('amount');
        $insurece->description=$request->get('description');
        $insurece->save();
        return $insurece;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Insurence  $insurence
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $insurence = Insurence::findOrFail($id);
        $insurence->delete();
        return response()->json(['success']);
    }
}
