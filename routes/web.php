<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

Route::resource('flight', 'FlightController');

Route::resource('hotel', 'HotelController');

Route::resource('car', 'CarController');

Route::resource('purchase', 'PurchaseController');

Route::get("test", "HotelController@showCities");

Route::get('/example', function () {
    return view('purchase.create');
});

