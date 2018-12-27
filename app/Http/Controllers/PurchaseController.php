<?php

namespace App\Http\Controllers;

use Validator;
use App\Purchase;
use Illuminate\Http\Request;

class PurchaseController extends Controller
{
    public function rules(){
        return
        [
            'totalPrice' => 'required|numeric',
            'date'=>'required|date',
            'payment_id'=>'exists:payments,id',
            'reserve_id'=>'exists:reserves,id',

        ];
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $purchases = Purchase::All();

        return $purchases;
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
        $purchase = new Purchase();

        $purchase->totalPrice = $request->totalPrice;
        $purchase->date = $request->date;
        $purchase->payment_id = $request->payment_id;
        $purchase->reserve_id = $request->reserve_id;

        $purchase->save();

        return "Se ha creado satisfactoriamente una compra";
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Purchase  $purchase
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $purchase = Purchase::findOrFail($id);

        return $purchase;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Purchase  $purchase
     * @return \Illuminate\Http\Response
     */
    public function edit(Purchase $purchase)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Purchase  $purchase
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(),$this->rules());
        if($validator->fails()){
            return $validator->messages();
        }
        $purchase = Purchase::findOrFail($id);

        $purchase->totalPrice = $request->totalPrice;
        $purchase->date = $request->date;
        $purchase->payment_id = $request->payment_id;
        $purchase->reserve_id = $request->reserve_id;

        $purchase->save();

        return "Se ha actualizado satisfactoriamente una compra";


    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Purchase  $purchase
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $purchase = Purchase::findOrFail($id);

        $purchase->delete();

        return "Se ha eliminado satisfactoriamente una compra";
    }
}
