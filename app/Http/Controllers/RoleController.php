<?php

namespace App\Http\Controllers;

use Validator;
use App\Role;
use Illuminate\Http\Request;

class RoleController extends Controller
{
    public function rules(){
        return 
        [
            'type' => 'required|numeric',
            'desription' => 'required|string',
        ];
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Role::all();
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
        $role = new \App\Role;
        $role->type = $request->type;
        $role->description = $request->description;
        $role->save();
        return "Se ha añadido satisfactoriamente el rol";
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Role  $role
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $role = Role::findOrFail($id);
        return $role;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Role  $role
     * @return \Illuminate\Http\Response
     */
    public function edit(Role $role)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Role  $role
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Role $role)
    {
        $validator = Validator::make($request->all(),$this->rules());
        if($validator->fails()){
            return $validator->messages();
        }
        $role->type = $request->type;
        $role->description = $request->description;
        $role->save();
        return "Se ha actualizado satisfactoriamente el rol";
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Role  $role
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $role = Role::findOrFail($id);
        $role->delete();
        return "Se ha eliminado satisfactoriamente el rol";
    }
}
