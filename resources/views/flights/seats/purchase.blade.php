@extends('layouts.app')


@section('content')



<div class="col-md-8">
	<h1 style="color: blue">Datos del pasajero</h1>

	Hola

	<form method="POST" action="/reserve/seat">

		@csrf
		
		<p>Asiento: {{$seat->row}}, {{$seat->seat_letter}}</p>
		<p>Numero de vuelo: {{$seat->flight->flightNumber}}</p>

		<div>
			<label for="passengerName" style="color: black">Nombre del Pasajero </label>
			<input class="form-control" type="text" name="passengerName" placeholder="Nombre del Pasajero" id="passengerName">
		</div>

		<div>
			<label for="passengerSurname" style="color: black">Apellido del Pasajero </label>
			<input class="form-control" type="text" name="passengerSurname" placeholder="Apellido del Pasajero" id="passengerSurname">
		</div>

		<div>
			<label for="passengerAge" style="color: black">Edad del Pasajero </label>
			<input class="form-control" type="text" name="passengerAge" placeholder="Edad de Pasajero" id="passengerAge">
		</div>

		<div>
			<label for="idNumber" style="color: black">Numero de identificación </label>
			<input class="form-control" type="text" name="idNumber" placeholder="Pasaporte/DNI" id="idNumber">
		</div>

		<div>
			<label for="seatId" style="color: black">id Asiento </label>
			<select name="seatId" class="form-control">
				<option>{{$seat->id}}</option>
			</select>
		</div>
		

		<p></p>

		<div>
			<button type="submit" class="btn btn-light">Proceder a pagar</button>
		</div>

	</form>
</div>

@endsection