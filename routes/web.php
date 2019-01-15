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

Route::resource('role','RoleController');

Route::resource('insurence','InsurenceController');

Route::resource('passenger','PassengerController');

Route::resource('reserve','ReserveController');

Route::resource('segment','SegmentController');

Route::resource('user','UserController');


// Route::resource('/purch', function() {
// 	return view('flights.form');
// });

Route::get('/vuelo', 'FlightController@form');
Route::post('/vuelo/busqueda', 'FlightController@search');

Route::post('/asiento/seleccionar', 'AirplaneseatController@select');
Route::post('/asiento/comprar', 'AirplaneseatController@purchase');

Route::get('/hoteles', 'HotelController@form');
Route::post('/hoteles/busqueda', 'HotelController@search');

Route::post('/habitacion/seleccionar', 'HotelroomController@select');
Route::post('/habitacion/comprar', 'HotelroomController@purchase');

Route::get('/autos', 'CarController@form');
Route::post('/autos/seleccionar', 'CarController@search');
Route::post('/autos/comprar', 'CarController@compra');

Route::get('/ejemplo', function() {
	return view('flights.ejemplo');
});



//los links de abajo, se harán solo con fines del CRUD

Route::post('/flights/search', 'FlightController@searchOD');

// Route::post('/hotels/create', 'HotelController@create');


/* Las siguientes rutas son solo de prueba, se comenta debajo los "input" que necesitan.*/


/* Para reservar un asiento de avión, se necesita:
	- name: Nombre pasajero
	- surname: Apellido pasajero
	- age: Edad pasajero
	- id: id de asiento
*/
Route::post('reserve/seat', 'AirplaneseatController@compra');

/* Para reservar una habitación de hotel, se necesita:
	-id: id de la habitación solamente
*/
Route::post('reserve/room', 'HotelroomController@compra');
