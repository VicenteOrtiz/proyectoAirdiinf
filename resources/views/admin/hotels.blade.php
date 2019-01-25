@extends('layouts.app')

@section('content')

<h1>Hotels</h1>

<div class="container" style="background-color: white; margin: 0 8em">
		<table class="table table-striped">
			<thead>
				<th style="font-family: 'Raleway', sans-serif; color: #3f4b89; font-weight: bold;">Nombre hotel
				</th>
				<th style="font-family: 'Raleway', sans-serif; color:#3f4b89; font-weight: bold;">Estrellas</th>
				<th style="font-family: 'Raleway', sans-serif; color:#3f4b89; font-weight: bold;">Capacidad hotel</th>
				<th style="font-family: 'Raleway', sans-serif; color:#3f4b89; font-weight: bold;">Numero de telefono</th>
				<th style="font-family: 'Raleway', sans-serif; color:#3f4b89; font-weight: bold;">Direccion</th>
			</thead>
			<tbody>
				@foreach($hotels as $hotel)
					@if(Auth::guest())
						<tr>
							<td>{{ $hotel->hotelName }}</td>
							<td>{{ $hotel->stars}}</td>
							<td>{{ $hotel->hotelCapacity}}
							<td>{{ $hotel->phoneNumber}}</td>
							<td>{{ $hotel->address}}</td>
							<td><a href="{{ url('/Admin/hoteles/'.$flight->id.'/')}}">Ver más</a></td>
						</tr>
					@endif
				@endforeach
			</tbody>
		</table>
	</div>

@endsection