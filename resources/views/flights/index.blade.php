@extends('layouts.app')


@section('content')

	<h1>Flights</h1>

	@foreach ($flights as $flight)

		<!-- $project[0]->title -->


		<h2>Flight number: {{$flight->flightNumber}}</h2>

			<li>airplaneModel: {{$flight->airplaneModel}} </li>
			<li>airplaneCapacity: {{$flight->airplaneCapacity}} </li>
			<li>departureLocation: {{$flight->departure->city->cityName}} </li>
			<li>arrivalLocation: {{$flight->arrival->city->cityName}} </li>
			<li>confirmed: {{$flight->confirmed}}</li>
			<li>flightDate: {{$flight->flightDate}}</li>
			<li>departureTime: {{$flight->departureTime}}</li>
		

	@endforeach 

	<h3> <a href="/flight/create">Book a flight NOW</a></h3>
@endsection