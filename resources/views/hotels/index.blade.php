@extends('layouts.app')


@section('content')

	<h1>hotels</h1>

	@foreach ($hotels as $hotel)

		<!-- $project[0]->title -->


		<h2>Hotel name: {{$hotel->hotelName}}</h2>

			<li>stars: {{$hotel->stars}} </li>
			<li>hotelCapacity: {{$hotel->hotelCapacity}} </li>
			<li>phoneNumber: {{$hotel->phoneNumber}} </li>
			<li>adress: {{$hotel->address}} </li>
		

	@endforeach

	<h3> <a href="/hotel/create">Book a hotel NOW</a></h3>
@endsection