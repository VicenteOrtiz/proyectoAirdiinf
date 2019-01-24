@extends('layouts.app')

@section('content')

<h1>Hotels</h1>

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
							<td><a href="{{ url('Admin/usuarios'.$user->id.'/')}}">Ver más</a></td>
						</tr>
						@endif
					@endif
				@endforeach
			</tbody>
		</table>
	</div>

@endsection