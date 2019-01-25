@extends('layouts.app')

@section('content')

<div class="hero-wrap js-fullheight" style="background-image: url('/images/avion.jpg');">
  <div class="overlay"></div>
  <div class="container">
    <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
      <div class="col-md-9 ftco-animate text-center" data-scrollax=" properties: { translateY: '70%' }">
        <p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2"><a href="index.html">Home</a></span> <span>Flights</span></p>
        <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Flights</h1>
      </div>
    </div>
  </div>
</div>
<div class="row">
	<div class="col-md-9"><h1>Cars</h1></div>
</div>
<div class="container" style="background-color: white; margin: 0 8em">
		<table class="table table-striped">
			<thead>
				<th style="font-family: 'Raleway', sans-serif; color: #3f4b89; font-weight: bold;">Numero vuelo
				</th>
				<th style="font-family: 'Raleway', sans-serif; color:#3f4b89; font-weight: bold;">Modelo avion</th>
				<th style="font-family: 'Raleway', sans-serif; color:#3f4b89; font-weight: bold;">Capacidad vuelo</th>
				<th style="font-family: 'Raleway', sans-serif; color:#3f4b89; font-weight: bold;">Confirmacion vuelo</th>
				<th style="font-family: 'Raleway', sans-serif; color:#3f4b89; font-weight: bold;">Fecha vuelo</th>
				<th style="font-family: 'Raleway', sans-serif; color:#3f4b89; font-weight: bold;">Hora salida</th>
			</thead>
			<tbody>
				@foreach($flights as $flight)
					@if(Auth::guest())
						@if($flight)
						<tr>
							<td>{{ $flight->flightNumber }}</td>
							<td>{{ $flight->airplaneModel}}</td>
							<td>{{ $flight->airplaneCapacity}}</td>
							@if($flight->confirmed == 1)
								<td>Confirmado</td>
							@elseif($flight->confirmed != 1)
								<td>No Confirmado</td>
							@endif
							<td>{{ $flight->flightDate}}</td>
							<td>{{ $flight->departureTime}}</td>
							<td><a href="{{ url('vuelosEditar/'.$flight->id.'/')}}">Ver más</a></td>
							<td><button class="btn" data-value={{$flight}} data-toggle="modal" data-target="#modalForm">Eliminar</button></td>
						</tr>
						@endif
					@endif
					<!-- Modal -->
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
					                        <label for="inputName">{{$flight->flight}}</label>
					                    </div>
					                </form>
					            </div>
					            <!-- Modal Footer -->
					            <div class="modal-footer">
					                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					                <form action="/Admin/vuelos/{{$flight->id}}" method="post">{{method_field('delete')}}<button class="btn" type="submit">Eliminar</button></form>
					            </div>
					        </div>
					    </div>
					</div>
				@endforeach
			</tbody>
		</table>
	</div>

@endsection