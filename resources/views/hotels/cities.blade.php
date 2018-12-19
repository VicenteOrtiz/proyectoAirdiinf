@extends('layouts.app')


@section('content')

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
        	<div class="card-columns">
        		@foreach ($cities as $city)
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">{{$city->cityName}}</h5>
						</div>
					</div>

                    <button href="" class="btn btn-primary btn-lg btn-block">Buscar Hoteles</button>
        		@endforeach

        	</div>
        	<!-- <h3> <a class="btn btn-light" href="/ayudantias/create">Crea una ayudantia</a></h3> -->
        </div>
    </div>
</div>

@endsection