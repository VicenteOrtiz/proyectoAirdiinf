@extends('layouts.app')

@section('content')

<div class="hero-wrap js-fullheight" style="background-image: url('/images/bg_5.jpg');">
  <div class="overlay"></div>
  	<div class="container">
    	<div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
      		<div class="col-md-9 ftco-animate text-center" data-scrollax=" properties: { translateY: '70%' }">
        		<p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2"><a href="/">Home</a></span> <span>Hotel</span></p>
        			<h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Hotels</h1>
      		</div>
    	</div>
  	</div>
</div>

<div class="container" style="background-color: white; margin: 0 8em">
		<table class="table table-striped">
			<thead>
				<th style="font-family: 'Raleway', sans-serif; color: #3f4b89; font-weight: bold;">Nombre hotel
				</th>
				<th style="font-family: 'Raleway', sans-serif; color:#3f4b89; font-weight: bold;">Estrellas</th>
				<th style="font-family: 'Raleway', sans-serif; color:#3f4b89; font-weight: bold;">Capacidad hotel</th>
				<th style="font-family: 'Raleway', sans-serif; color:#3f4b89; font-weight: bold;">Numero de telefono</th>
				<th style="font-family: 'Raleway', sans-serif; color:#3f4b89; font-weight: bold;">Direccion</th>
			</thead>
			<tbody>
				@foreach($hotels as $hotel)
					@if(Auth::guest())
						<tr>
							<td>{{ $hotel->hotelName }}</td>
							<td>{{ $hotel->stars}}</td>
							<td>{{ $hotel->hotelCapacity}}
							<td>{{ $hotel->phoneNumber}}</td>
							<td>{{ $hotel->address}}</td>
							<td><button type="button" class="btn" data-value={{$hotel}} data-toggle="modal" data-target="#modalForm">Eliminar</button></td>
						</tr>
					@endif
					<div class="modal fade" id="modalForm" role="dialog">
					    <div class="modal-dialog">
					        <div class="modal-content">
					            <!-- Modal Header -->
					            <div class="modal-header">
					                <button type="button" class="close" data-dismiss="modal">
					                    <span aria-hidden="true">×</span>
					                    <span class="sr-only">Close</span>
					                </button>
					                <h4 class="modal-title" id="myModalLabel">¿Esta seguro?</h4>
					            </div>
					            
					            <!-- Modal Body -->
					            <div class="modal-body">
					                <p class="statusMsg"></p>
					                <form role="form">
					                    <div class="form-group">
					                        <label for="inputName">{{$hotel->hotelName}}</label>
					                    </div>
					                </form>
					            </div>
					            <!-- Modal Footer -->
					            <div class="modal-footer">
					                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					                <form action="/Admin/hoteles/{{$hotel->id}}" method="post">{{method_field('delete')}}<button class="btn" type="submit">Eliminar</button></form>
					            </div>
					        </div>
					    </div>
					</div>
				@endforeach
			</tbody>
		</table>
	</div>

@endsection