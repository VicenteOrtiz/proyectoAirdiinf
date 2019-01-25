@extends('layouts.app')

@section('content')

Paquete:

Destino: {{$paquete->destiny->arrival->city->cityName}}, {{$paquete->destiny->arrival->city->cityName}}
Origen: {{$paquete->home->arrival->city->cityName}}, {{$paquete->home->arrival->city->cityName}}

Auto: {{$paquete->car->carModel}}
Hotel: {{$paquete->hotelroom->hotel->hotelName}} // {{$paquete->hotelroom->hotel->stars}} \\

Precio Total: {{$paquete->precioPaquete}}

<div class="container">
	    <div class="row justify-content-center">
	        <div class="col-md-8">
	        	<div class="card-columns">
						<div class="card">
							<div class="card-body">
								<h5 class="card-title">Paquete</h5>
								<p class="card-text">
									<p>Destino:: <strong>{{$paquete->destiny->arrival->city->cityName}}, {{$paquete->destiny->arrival->city->cityName}}</strong></p>
									<p>origen: <strong>Origen: {{$paquete->home->arrival->city->cityName}}, {{$paquete->home->arrival->city->cityName}}</strong></p>

									<p>Auto <strong>{{$paquete->car->carModel}}</strong></p>
									<p>Hotel: <strong>{{$paquete->hotelroom->hotel->hotelName}} // {{$paquete->hotelroom->hotel->stars}} \\</strong></p>
									<p>Precio Total: <strong>{{$paquete->precioPaquete}}</strong></p>

									<form action="/paquetes/pasajero" method="post"> 
										{{ csrf_field() }}

										<div>
											<!-- <label for="roomId" style="color: black">Room id</label> -->
											<input class="form-control" type="text" name="packageid" placeholder="carId" id="carId" value="{{$paquete->id}}" style="display: none">
										</div>
										
										<button type="submit" class="btn btn-primary btn-lg btn-block">Comprar pasaje</button>
									</form>
								</p>
							</div>
						</div>
	        	</div>
	        	<h3> <a class="btn btn-light" href="/ayudantias/create">Crea una ayudantia</a></h3>
	        </div>
	    </div>
</div>

@endsection