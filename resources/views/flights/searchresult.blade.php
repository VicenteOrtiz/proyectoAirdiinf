@extends('layouts.app')

@section('content')

<div class="container">
	    <div class="row justify-content-center">
	        <div class="col-md-8">
	        	<div class="card-columns">
	        		@foreach ($flights as $flight)
						<div class="card">
							<div class="card-body">
								<h5 class="card-title">Flight number: {{$flight->flightNumber}}</h5>
								<p class="card-text">
									<p>Modelo de Avion: <strong>{{$flight->airplaneModel}}</strong></p>
									<p>Aeropuerto de origen: <strong>{{$flight->departure->name}}, {{$flight->departure->city->cityName}}</strong></p>

									<p>Aeropuerto de destino: <strong>{{$flight->arrival->name}}, {{$flight->arrival->city->cityName}}</strong></p>
									<p>Fecha: <strong>{{$flight->flightDate}}</strong></p>
									<p>Hora: <strong>{{$flight->departureTime}}</strong></p>

									<form action="/asiento/seleccionar" method="post"> 
										{{ csrf_field() }}

										<select name="flight_id" class="form-control">

											<option>{{$flight->id}}</option>

										</select>

										

										<button type="submit" class="btn btn-primary btn-lg btn-block">Comprar pasaje</button>
									</form>
								</p>
							</div>
						</div>
	        		@endforeach
	        	</div>
	        	<h3> <a class="btn btn-light" href="/ayudantias/create">Crea una ayudantia</a></h3>
	        </div>
	    </div>
</div>

@endsection