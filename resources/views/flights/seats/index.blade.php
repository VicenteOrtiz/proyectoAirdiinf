@extends('layouts.app')


@section('content')

<form action="/asiento/comprar" method="post"> 
	{{ csrf_field() }}

	<select name="seat_id" class="form-control">

		@foreach($seats as $seat)

		<option>{{$seat->seat_letter}} - {{$seat->row}} - {{$seat->id}}</option> <!-- Aqui el id es auxiliar, pq no se como mandarlo a la siguiente vista aun -->

		@endforeach

	</select>

	

	<button type="submit" class="btn btn-primary btn-lg btn-block">Seleccionar asiento</button>
</form>

@endsection