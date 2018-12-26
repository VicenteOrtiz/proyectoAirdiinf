<?php

namespace App\Http\Controllers;

use Validator;
use App\Payment;
use Illuminate\Http\Request;

class PaymentController extends Controller
{
    public function rules(){
        return
        [
            'paymentMethod'=>'required|string',
            'bankName' => 'required|string',
        ];
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $payments = Payment::All();

        return $payments;
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
        $payment = new Payment();

        $payment->paymentMethod = $request->paymentMethod;
        $payment->bankName = $request->bankName;

        $payment->save();

        return "Se ha creado satisfactoriamente el método de pago";
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Payment  $payment
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $payment = Payment::findOrFail($id);

        return $payment;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Payment  $payment
     * @return \Illuminate\Http\Response
     */
    public function edit(Payment $payment)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Payment  $payment
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(),$this->rules());
        if($validator->fails()){
            return $validator->messages();
        }
        $payment = Payment::findOrFail($id);

        $payment->paymentMethod = $request->paymentMethod;
        $payment->bankName = $request->bankName;

        $payment->save();

        return "Se ha actualizado satisfactoriamente el método de pago";

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Payment  $payment
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $payment = Payment::findOrFail($id);

        $payment->delete();

        return "Se ha eliminado satisfactoriamente el método de pago";
    }
}
