<!DOCTYPE html>
<html lang="en">
  <head>
    <title>DiinfAirlines</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Alex+Brush" rel="stylesheet">

    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">
    
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">

    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/ionicons.min.css">

    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/style.css">
  </head>
  <body>
  <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container">
      <a class="navbar-brand" href="/">DiinfAirlines.</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="oi oi-menu"></span> Menu
      </button>
      <div class="collapse navbar-collapse" id="ftco-nav">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active"><a href="index.html" class="nav-link">Home</a></li>
          <li class="nav-item"><a href="/vuelo" class="nav-link">Flights</a></li>
          <li class="nav-item"><a href="/autos" class="nav-link">Cars</a></li>
          <li class="nav-item"><a href="/hoteles" class="nav-link">Hotels</a></li>
          <li class="nav-item"><a href="blog.html" class="nav-link">Blog</a></li>
          @guest
          <li class="nav-item">
            <a href="{{ route('login') }}" class="nav-link">{{ __('Login') }}</a>
          </li>
          <li class="nav-item cta">
            <a href="{{ route('register') }}" class="nav-link"><span>{{ __('Register') }}</span></a>
          </li>
          @else
           <li class="nav-item dropdown">
                                <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
                                    {{ Auth::user()->name }} <span class="caret"></span>
                                </a>

                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">

                                    <a class="dropdown-item" href="/vuelo">
                                        {{ __('Buscar Vuelos') }}
                                    </a>

                                    <a class="dropdown-item" href="/hoteles">
                                        {{ __('Buscar Hoteles') }}
                                    </a>

                                    <a class="dropdown-item" href="/autos">
                                        {{ __('Buscar Autos') }}
                                    </a>

                                    <a class="dropdown-item" href="/cart">
                                        {{ __('Carrito de Compras') }}
                                    </a>

                                    <a class="dropdown-item" href="{{ route('logout') }}"
                                       onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();">
                                        {{ __('Logout') }}
                                    </a>

                                    <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                        @csrf
                                    </form>
                                </div>
                            </li>
          @endguest
        </ul>
      </div>
    </div>
  </nav>
   <main>
            @yield('content')
   </main>
</body>
</html>S