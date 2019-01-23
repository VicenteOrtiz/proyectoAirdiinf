@extends('layouts.app')

@section('content')

	<h1>Cars</h1>

	<div class="container" style="background-color: white; margin: 0 8em">
		<table class="table table-striped">
			<thead>
				<th style="font-family: 'Raleway', sans-serif; color: #3f4b89; font-weight: bold;">Modelo auto
				</th>
				<th style="font-family: 'Raleway', sans-serif; color:#3f4b89; font-weight: bold;">Patente</th>
				<th style="font-family: 'Raleway', sans-serif; color:#3f4b89; font-weight: bold;">Disponible</th>
				<th style="font-family: 'Raleway', sans-serif; color:#3f4b89; font-weight: bold;">Capacidad de pasajeros</th>
				<th style="font-family: 'Raleway', sans-serif; color:#3f4b89; font-weight: bold;">Precio por hora</th>
			</thead>
			<tbody>
				@foreach($cars as $car)
					@if(Auth::guest())
						@if($car)
						<tr>
							<td>{{ $car->carModel }}</td>
							<td>{{ $car->vehicleRegistration }}</td>
							<td>{{ $car->avaible }}</td>
							<td>{{ $car->passengerCapacity }}</td>
							<td>{{ $car->pricePerHour }}</td>
							<td><a href="{{url('cars/'.$car->id')}}" class="btn btn-primary">Ver detalles</a></td>
						</tr>
						@endif
					@endif
				@endforeach
			</tbody>
		</table>
	</div>
@endsection