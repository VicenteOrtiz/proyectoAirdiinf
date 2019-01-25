@extends('layouts.app')

@section('content')

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
					                    	<label for="inputName">Desea eliminar el vuelo:</label>
					                        <label for="inputName">{{$flight->flightNumber}}</label>
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