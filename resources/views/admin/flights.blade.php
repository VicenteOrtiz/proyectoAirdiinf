@extends('layouts.app')

@section('content')

<h1>Flights</h1>

<div class="container" style="background-color: white; margin: 0 8em">
		<table class="table table-striped">
			<thead>
				<th style="font-family: 'Raleway', sans-serif; color: #3f4b89; font-weight: bold;">Numero vuelo
				</th>
				<th style="font-family: 'Raleway', sans-serif; color:#3f4b89; font-weight: bold;">Modelo avion</th>
				<th style="font-family: 'Raleway', sans-serif; color:#3f4b89; font-weight: bold;">Capacidad vuelo</th>
				<th style="font-family: 'Raleway', sans-serif; color:#3f4b89; font-weight: bold;">Confirmacion vuelo</th>
				<th style="font-family: 'Raleway', sans-serif; color:#3f4b89; font-weight: bold;">Fecha vuelo</th>
				<th style="font-family: 'Raleway', sans-serif; color:#3f4b89; font-weight: bold;">Hora salida</th>
			</thead>
			<tbody>
				@foreach($flights as $flight)
					@if(Auth::guest())
						@if($flight)
						<tr>
							<td>{{ $flight->flightNumber }}</td>
							<td>{{ $flight->airplaneModel}}</td>
							<td>{{ $flight->airplaneCapacity}}</td>
							@if($flight->confirmed == 1)
								<td>Confirmado</td>
							@elseif($flight->confirmed != 1)
								<td>No Confirmado</td>
							@endif
							<td>{{ $flight->flightDate}}</td>
							<td>{{ $flight->departureTime}}</td>
							<td><a href="{{ url('vuelosEditar/'.$flight->id.'/')}}">Ver más</a></td>
						</tr>
						@endif
					@endif
				@endforeach
			</tbody>
		</table>
	</div>

@endsection