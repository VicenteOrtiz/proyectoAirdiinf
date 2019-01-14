@extends('layouts.app')

@section('content')

<div class="container">
	    <div class="row justify-content-center">
	        <div class="col-md-8">
	        	<div class="card-columns">
	        		@foreach ($hotels as $hotel)
						<div class="card">
							<div class="card-body">
								<h5 class="card-title">Hotel: {{$hotel->hotelName}}</h5>
								<p class="card-text">
									<p>Estrellas: <strong>{{$hotel->stars}}</strong></p>
									<p>Dirección: <strong>{{$hotel->address}}, {{$hotel->city->cityName}}, {{$hotel->city->country->countryName}}</strong></p>

									<p>Número de teléfono: <strong>{{$hotel->phoneNumber}}</strong></p>
									

									<form action="/habitacion/seleccionar" method="post"> 
										{{ csrf_field() }}

										<select name="hotel_id" class="form-control">

											<option>{{$hotel->id}}</option>

										</select>

										

										<button type="submit" class="btn btn-primary btn-lg btn-block">Reservar habitación</button>
									</form>
								</p>
							</div>
						</div>
	        		@endforeach
	        	</div>
	        </div>
	    </div>
</div>

@endsection