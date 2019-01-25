@extends('layouts.app')

@section('content')

	<div class="container" style="background-color: white; margin: 0 8em">
		<table class="table table-striped">
			<thead>
				<th style="font-family: 'Raleway', sans-serif; color:#3f4b89; font-weight: bold;">Modelo auto
				</th>
				<th style="font-family: 'Raleway', sans-serif; color:#3f4b89; font-weight: bold;">Patente</th>
				<th style="font-family: 'Raleway', sans-serif; color:#3f4b89; font-weight: bold;">Disponible</th>
				<th style="font-family: 'Raleway', sans-serif; color:#3f4b89; font-weight: bold;">Capacidad</th>
				<th style="font-family: 'Raleway', sans-serif; color:#3f4b89; font-weight: bold;">Precio por hora</th>
			</thead>
			<tbody>
				@foreach($cars as $car)
					@if(Auth::guest())
						@if($car)
						<tr>
							<td>{{ $car->carModel }}</td>
							<td>{{ $car->vehicleRegistration }}</td>
							@if($car->avaible == 1)
								<td>Disponible</td>
							@elseif($car->avaible != 1)
								<td>No disponible</td>
							@endif
							<td>{{ $car->passengerCapacity }} personas</td>
							<td> $ {{ $car->pricePerHour }}</td>
							<td><button class="btn" data-value={{$car}} data-toggle="modal" data-target="#modalForm">Eliminar</button></td>
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
					                        <label for="inputName">{{$car->carModel}}</label>
					                    </div>
					                </form>
					            </div>
					            <!-- Modal Footer -->
					            <div class="modal-footer">
					                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					                <button class="btn" data-value="{{$car}}" data-toggle="modal" data-target="#sucessModal">Eliminar</button>
					            </div>
					        </div>
					    </div>
					</div>
				@endforeach
			</tbody>
		</table>
	</div>

	<div class="modal fade" id="sucessModal" role="dialog">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <!-- Modal Header -->
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal">
	                    <span aria-hidden="true">×</span>
	                    <span class="sr-only">Close</span>
	                </button>
	            </div>
	            
	            <!-- Modal Body -->
	            <div class="modal-body">
	                <p class="statusMsg"></p>
	                <form role="form">
	                    <div class="form-group">
	                        <label for="inputName">Borrado</label>
	                    </div>
	                </form>
	            </div>
	            <!-- Modal Footer -->
	            <div class="modal-footer">
	                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	                <form action="/Admin/autos/{{$car->id}}" method="post">{{method_field('delete')}}<button class="btn" type="submit">Eliminar</button></form>
	            </div>
	        </div>
	    </div>
	</div>

@endsection