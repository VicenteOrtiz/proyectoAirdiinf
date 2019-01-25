@extends('layouts.app')

@section('content')

<dir class="row">
	<div class="col-md-12 tituloAdminAutos">
		<h1>Users</h1>
	</div>
	<div class=""></div>
</dir>

<div class="container" style="background-color: white; margin: 0 8em">
		<table class="table table-striped">
			<thead>
				<th style="font-family: 'Raleway', sans-serif; color: #3f4b89; font-weight: bold;">Nombre
				</th>
				<th style="font-family: 'Raleway', sans-serif; color:#3f4b89; font-weight: bold;">Apellido</th>
				<th style="font-family: 'Raleway', sans-serif; color:#3f4b89; font-weight: bold;">Email</th>
				<th style="font-family: 'Raleway', sans-serif; color:#3f4b89; font-weight: bold;">Edad</th>
				<th style="font-family: 'Raleway', sans-serif; color:#3f4b89; font-weight: bold;">Pasaporte</th>
				<th style="font-family: 'Raleway', sans-serif; color:#3f4b89; font-weight: bold;">Numero de telefono</th>
				<th style="font-family: 'Raleway', sans-serif; color:#3f4b89; font-weight: bold;">Discapacidad</th>
			</thead>
			<tbody>
				@foreach($users as $user)
					@if(Auth::guest())
						@if($user)
						<tr>
							<td>{{ $user->name }}</td>
							<td>{{ $user->surname}}</td>
							<td>{{ $user->email}}
							<td>{{ $user->age}}</td>
							<td>{{ $user->passportNumber}}</td>
							<td>{{ $user->phoneNumber}}</td>
							@if($user->disability == 1)
								<td>Sí</td>
							@elseif($user->disability != 1)
								<td>No</td>
							@endif
							<td><button class="btn" data-value="{{$user}}" data-toggle="modal" data-target="#edit">Editar</button></td>
							<td><button class="btn" data-value="{{$user}}" data-toggle="modal" data-target="#modalForm">Eliminar</button></td>
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
					                        <label for="inputName">{{$user->name}} {{$user->surname}}</label>
					                    </div>
					                </form>
					            </div>
					            <!-- Modal Footer -->
					            <div class="modal-footer">
					                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					                <form action="/Admin/usuarios/{{$user->id}}" method="post">{{method_field('delete')}}<button class="btn" type="submit">Eliminar</button></form>
					            </div>
					        </div>
					    </div>
					</div>

					<div class="modal fade" id="edit" role="dialog">
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
					                        <label for="inputName">{{$user->name}}</label>
					                        <input type="text" class="form-control" id="inputName" placeholder="Ingrese el nombre"/>
					                    </div>
					                    <div class="form-group">
					                        <label for="inputName">{{$user->surname}}</label>
					                        <input type="text" class="form-control" id="inputName" placeholder="Ingrese el apellido"/>
					                    </div>
					                    <div class="form-group">
					                        <label for="inputName">{{$user->email}}</label>
					                        <input type="text" class="form-control" id="inputName" placeholder="Ingrese el correo"/>
					                    </div>
					                    <div class="form-group">
					                        <label for="inputName">{{$user->age}}</label>
					                        <input type="text" class="form-control" id="inputName" placeholder="Ingrese la edad"/>
					                    </div>
					                    <div class="form-group">
					                        <label for="inputName">{{$user->passportNumber}}</label>
					                        <input type="text" class="form-control" id="inputName" placeholder="Ingrese el numero de pasaporte"/>
					                    </div>
					                    <div class="form-group">
					                        <label for="inputName">{{$user->passportNumber}}</label>
					                        <input type="text" class="form-control" id="inputName" placeholder="Ingrese el numero de pasaporte"/>
					                    </div>
					                    <div class="form-group">
					                        <label for="inputName">{{$user->phoneNumber}}</label>
					                        <input type="text" class="form-control" id="inputName" placeholder="Ingrese el numero de telefono"/>
					                    </div>
					                </form>
					            </div>
					            <!-- Modal Footer -->
					            <div class="modal-footer">
					                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					                <form action="/Admin/usuarios/{{$user->id}}" method="post">{{method_field('delete')}}<button class="btn" type="submit">Editar</button></form>
					            </div>
					        </div>
					    </div>
					</div>
				@endforeach
			</tbody>
		</table>
	</div>

<!-- Modal -->
<div class="modal fade" id="edit" role="dialog">
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
                        <label for="inputName">{{$user->name}} {{$user->surname}}</label>
                    </div>
                </form>
            </div>
            <!-- Modal Footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <form action="/Admin/usuarios/{{$user->id}}" method="post">{{method_field('delete')}}<button class="btn" type="submit">Eliminar</button></form>
            </div>
        </div>
    </div>
</div>


@endsection