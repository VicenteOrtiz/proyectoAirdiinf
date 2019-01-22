@extends('layouts.app')


@section('content')

<form action="/habitacion/comprar" method="post"> 
	{{ csrf_field() }}

	<select name="room_id" class="form-control">

		@foreach($rooms as $room)

		<option>{{$room->room_number}} - {{$room->number_of_beds}} - {{$room->room_price_per_day}} - {{$room->id}}</option> <!-- Aqui el id es auxiliar, pq no se como mandarlo a la siguiente vista aun -->

		@endforeach

	</select>

	

	<button type="submit" class="btn btn-primary btn-lg btn-block">Seleccionar habitación</button>
</form>

@endsection