@extends('layouts.app')

@section('content')

<div class="hero-wrap js-fullheight" style="background-image: url('/images/auto.jpg');">
	<div class="overlay"></div>
		<div class="container">
    		<div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
     			<div class="col-md-9 ftco-animate text-center" data-scrollax=" properties: { translateY: '70%' }">
        			<p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2"><a href="index.html">Home</a></span> <span>Car</span></p>
        			<h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Cars</h1>
      			</div>
    		</div>
  		</div>
</div>

<div class="container" style="background-color: white; margin: 0 6em">
	<div class="title m-b-md" style="text-align: center; font-family: 'Raleway', sans-serif; color: #3f4b89; font-size: 40px; font-weight: bold;">Ingresar auto</div>
	<hr></hr>
	{!! Form::open(['route' => 'cars.store', 'method' => 'POST'])!!}
		<div class="form-group" style="text-align: left; font-family: 'Raleway', sans-serif; color: #3f4b89; ; font-weight: bold;"><b style=" font-family: 'Raleway', sans-serif; color: #3f4b89;" >{!!Form::label('carModel', 'Modelo')!!}</b>
			<p>
				{!! Form::text('carModel', null, ['class' => 'form-control', 'requiered', 'placeholder' => 'Modelo que se le asignara al auto'])!!}
			</div>
</div>

@endsection