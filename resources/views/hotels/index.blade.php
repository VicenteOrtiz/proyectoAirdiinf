@extends('layouts.app')


@section('content')

	<h1>Hoteles</h1>

	

			

	<form action="test" method="get">
		{{ csrf_field() }}
		
		<div class="form-group form-row align-items-end">
			<div class="col">
				<label for="id_destino">¡Elija un país de su preferencia!</label>
				<div class="form-group">
					<select id="paises_id" name="paises_id" class="form-control selectpicker" title="Destino" data-live-search="true">

						@foreach ($countries as $country)

							<option>{{$country->countryName}}</option>


						@endforeach


					</select>
				</div>
			</div>
		</div>
		<button type="submit" class="btn btn-primary btn-lg btn-block">Busca tu Hotel</button>
	</form>

	
@endsection