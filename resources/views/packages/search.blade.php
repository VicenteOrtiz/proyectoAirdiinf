@extends('layouts.app')


@section('content')

<div class="container">
	    <div class="row justify-content-center"> 
	        <div class="col-md-8">
	        	<div class="card-columns">
	        		@foreach ($packages as $package)
						<div class="card">
							<div class="card-body">
								<h5 class="card-title">Destino: {{$package->destiny->arrival->city->cityName}},{{$package->destiny->arrival->city->country->countryName}}</h5>
								<p class="card-text">
									<p>Precio: <strong>{{$package->precioPaquete}}</strong></p>
									
									<form action="/autos/comprar" method="post"> 
										{{ csrf_field() }}

										<div>
											<!-- <label for="roomId" style="color: black">Room id</label> -->
											<input class="form-control" type="text" name="packageid" placeholder="carId" id="carId" value="{{$package->id}}" style="display: none">
										</div>

										<button type="submit" class="btn btn-primary btn-lg btn-block">Seleccionar Paquete</button>
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