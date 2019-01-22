@extends('layouts.app')


@section('content')



<div class="col-md-8">
	<h1 style="color: blue">Resumen de reserva</h1>

	<form method="POST" action="/reserve/room">

		@csrf
		
		<p>Nombre Hotel: {{$room->Hotel->hotelName}}</p>
		<p>Estrellas: {{$room->Hotel->stars}}</p>
		<p>Numero de camas: {{$room->number_of_beds}}</p>
		<p>Piso: {{$room->floor_number}}</p>
		<p>Numero de habitacion: {{$room->room_number}}</p>
		<p>Precio por noche: {{$room->room_price_per_day}}</p>

		<div>
			<!-- <label for="roomId" style="color: black">Room id</label> -->
			<input class="form-control" type="text" name="roomId" placeholder="Room id" id="passengerName" value="{{$room->id}}" style="display: none">
		</div>

<!-- 		<div>
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
				<option></option>
			</select>
		</div> -->
		

		<p></p>

		<div>
			<button type="submit" class="btn btn-light">Proceder a pagar</button>
		</div>

	</form>
</div>

@endsection