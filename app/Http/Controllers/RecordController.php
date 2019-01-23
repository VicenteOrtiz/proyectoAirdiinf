<?php

namespace App\Http\Controllers;

use Validator;
use App\Record;
use Illuminate\Http\Request;

class RecordController extends Controller
{
    public function rules(){
        return[
            'logDate'=>'required|date',
            'logDescription'=>'required|string',
        ];
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $records = Record::All();

        return $records;
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
        $record = new Record();

        $record->logDate = $request->logDate;
        $record->logDescription = $request->logDescription;

        $record->save();

        return "Se ha creado satisfactoriamente un historial";
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Record  $record
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $record = Record::findOrFail($id);

        return $record;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Record  $record
     * @return \Illuminate\Http\Response
     */
    public function edit(Record $record)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Record  $record
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(),$this->rules());
        if($validator->fails()){
            return $validator->messages();
        }
        $record = Record::findOrFail($id);

        $record->logDate = $request->logDate;
        $record->logDescription = $request->logDescription;

        $record->save();

        return "Se ha actualizado satisfactoriamente un historial";


    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Record  $record
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $record = Record::findOrFail($id);

        $record->delete();

        return "Se ha eliminado satisfactoriamente un historial";
    }
}
