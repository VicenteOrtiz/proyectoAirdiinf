@extends('layouts.app')


@section('content')

	<h1>Cars</h1>

	@foreach ($cars as $car)

		<!-- $project[0]->title -->


		<h2>Car model: {{$car->carModel}}</h2>

			<li>airplaneModel: {{$car->vehicleRegistration}} </li>
			<li>airplaneCapacity: {{$car->available}} </li>
			<li>departureLocation: {{$car->passengerCapacity}} </li>
		

	@endforeach

	<h3> <a href="/car/create">Book a car NOW</a></h3>
@endsection