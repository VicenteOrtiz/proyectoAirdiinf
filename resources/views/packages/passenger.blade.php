@extends('layouts.app')


@section('content')



<div class="col-md-8">
	<h1 style="color: blue">Datos del pasajero y elección de asientos</h1>

	Hola

	<form method="POST" action="/paquetes/comprar">

		@csrf

		Asiento del vuelo de ida
		
		<select name="firstSeat" class="form-control">

			@foreach($firstSeats as $firstSeat)

			<option value="{{$firstSeat->id}}">{{$firstSeat->seat_letter}} - {{$firstSeat->row}}</option> <!-- Aqui el id es auxiliar, pq no se como mandarlo a la siguiente vista aun -->

			@endforeach

		</select>

		Asiento del vuelo de vuelta

		<select name="secondSeat" class="form-control">

			@foreach($secondSeats as $secondSeat)

			<option value="{{$secondSeat->id}}">{{$secondSeat->seat_letter}} - {{$secondSeat->row}}</option> <!-- Aqui el id es auxiliar, pq no se como mandarlo a la siguiente vista aun -->

			@endforeach

		</select>

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
			<!-- <label for="roomId" style="color: black">Room id</label> -->
			<input class="form-control" type="text" name="packageid" placeholder="carId" id="carId" value="{{$paquete->id}}" style="display: none">
		</div>

		<p></p>

		<div>
			<button type="submit" class="btn btn-light">Proceder a pagar</button>
		</div>

	</form>
</div>

@endsection