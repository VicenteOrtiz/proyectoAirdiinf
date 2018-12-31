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

Route::resource('city', 'CityController');

Route::get('/example', function () {
    return view('purchase.create');
});

Route::resource('hotelroom', 'HotelroomController');

Route::resource('airport', 'AirportController');

Route::resource('city', 'CityController');

Route::resource('country', 'CountryController');

Route::resource('package', 'PackageController');

Route::resource('payment', 'PaymentController');

Route::resource('purchase', 'PurchaseController');

Route::resource('record', 'RecordController');

Route::resource('airplaneseat','AirplaneseatController');




Route::post('prueba', 'AirplaneseatController@compra');
Route::post('pruebahotel', 'HotelroomController@compra');




Route::resource('role','RoleController');

Route::resource('insurence','InsurenceController');

Route::resource('passenger','PassengerController');

Route::resource('reserve','ReserveController');

Route::resource('segment','SegmentController');

Route::resource('user','UserController');
//los links de abajo, se harán solo con fines del CRUD

Route::post('/flights/search', 'FlightController@searchOD');

// Route::post('/hotels/create', 'HotelController@create');
