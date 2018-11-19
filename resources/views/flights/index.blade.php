@extends('layouts.app')


@section('content')

	<h1>Flights</h1>

	@foreach ($flights as $flight)

		<!-- $project[0]->title -->


		<h2>Flight number: {{$flight->flightNumber}}</h2>

			<li>airplaneModel: {{$flight->airplaneModel}} </li>
			<li>airplaneCapacity: {{$flight->airplaneCapacity}} </li>
			<li>departureLocation: {{$flight->departureLocation}} </li>
			<li>arrivalLocation: {{$flight->arrivalLocation}} </li>
		

	@endforeach

	<h3> <a href="/flight/create">Book a flight NOW</a></h3>
@endsection