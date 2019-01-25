@extends('layouts.app')

@section('content')

<div class="container">
	    <div class="row justify-content-center"> 
	        <div class="col-md-8">
	        	<div class="card-columns">
	        		@foreach ($cars as $car)
						<div class="card">
							<div class="card-body">
								<h5 class="card-title">Auto: {{$car->carModel}}</h5>
								<p class="card-text">
									<p>Pasajeros: <strong>{{$car->passengerCapacity}}</strong></p>
									<p>Precio: <strong>{{$car->pricePerHour}}</strong></p>
									
									<form action="/autos/comprar" method="post"> 
										{{ csrf_field() }}

										<div>
											<!-- <label for="roomId" style="color: black">Room id</label> -->
											<input class="form-control" type="text" name="carId" placeholder="carId" id="carId" value="{{$car->id}}" style="display: none">
										</div>

										<button type="submit" class="btn btn-primary btn-lg btn-block">Seleccionar Auto</button>
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