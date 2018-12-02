@extends('layouts.app')

@section('content')

<div class="row">
    <div class="col-3">
        <div class="nav bg-light flex-column nav-pills" role="tablist" aria-orientation="vertical">
            <a class="nav-link active" id="vuelo-tab" data-toggle="pill" href="#vuelo" role="tab" aria-controls="vuelo" aria-selected="true">
              <i class="fas fa-plane"></i> Vuelos
            </a>
            <a class="nav-link" id="hotel-tab" data-toggle="pill" href="#hotel" role="tab" aria-controls="hotel" aria-selected="false">
              <i class="fas fa-building"></i> Hoteles
            </a>
            <a class="nav-link" id="auto-tab" data-toggle="pill" href="#auto" role="tab" aria-controls="auto" aria-selected="false">
              <i class="fas fa-car"></i> Automóviles
            </a>
            <a class="nav-link" href="/paquetes">
              <i class="fas fa-cubes"></i> Paquetes
            </a>
        </div>
    </div>
    <div class="col-9">
        <div class="tab-content">
            <div class="tab-pane fade show active" id="vuelo" role="tabpanel" aria-labelledby="vuelo-tab">
                @include('flights.form')
            </div>
            <div class="tab-pane fade" id="hotel" role="tabpanel" aria-labelledby="hotel-tab">
               @include('hotels.form')
            </div>
            <div class="tab-pane fade" id="auto" role="tabpanel" aria-labelledby="auto-tab">
                @include('cars.form')
            </div>
            
        </div>
    </div>
</div>


@endsection