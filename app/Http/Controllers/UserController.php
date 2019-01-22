<?php

namespace App\Http\Controllers;

use App\User;
use Illuminate\Http\Request;
use Validator;

class UserController extends Controller
{
    //
    public function rules(){
        return
        [
        	'name' => 'required|string', 
	        'email' => 'required|string', 
	        'password' => 'required|string',
	        'surname' => 'required|string',
	        'age' => 'required|numeric',
	        'passportNumber' => 'required|string',
	        'phoneNumber'=> 'required|string',
	        'disability' => 'required|numeric',
        ];
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //'amount',
        //'description',
        return User::all();
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
        $validator = Validator::make($request->all(), $this->rules());
        if($validator->fails()){
            return $validator->messages();
        }
        $user = new \App\User;
        $user->name=$request->get('name');
        $user->email=$request->get('email');
        $user->password=$request->get('password');
        $user->surname=$request->get('surname');
        $user->age=$request->get('age');
        $user->passportNumber=$request->get('passportNumber');
        $user->phoneNumber=$request->get('phoneNumber');
        $user->disability=$request->get('disability');
        $user->save();
        return "Se ha añadido satisfactoriamente el usuraio";
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\User  $user
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $user = User::findOrFail($id);
        return $user;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\User  $user
     * @return \Illuminate\Http\Response
     */
    public function edit(User $user)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\User  $user
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, User $user)
    {
        //
        $validator = Validator::make($request->all(), $this->rules());
        if($validator->fails()){
            return $validator->messages();
        }
        $user->name=$request->get('name');
        $user->email=$request->get('email');
        $user->password=$request->get('password');
        $user->surname=$request->get('surname');
        $user->age=$request->get('age');
        $user->passportNumber=$request->get('passportNumber');
        $user->phoneNumber=$request->get('phoneNumber');
        $user->disability=$request->get('disability');
        $user->save();
        return "Se ha actualizado satisfactoriamente el usuario";
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\User  $user
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $user = User::findOrFail($id);
        $user->delete();
        return "Se ha eliminado satisfactoriamente el usuario";
    }
}
