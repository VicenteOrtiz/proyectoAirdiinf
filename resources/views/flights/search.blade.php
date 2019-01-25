@extends('layouts.app')

@section('content')
    <!-- END nav -->
    
    <div class="hero-wrap js-fullheight" style="background-image: url('/images/avion.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
          <div class="col-md-9 ftco-animate text-center" data-scrollax=" properties: { translateY: '70%' }">
            <p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2"><a href="index.html">Principal</a></span> <span>Vuelos</span></p>
            <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Vuelos</h1>
          </div>
        </div>
      </div>
    </div>


    <section class="ftco-section ftco-degree-bg">
      <div class="container">
        <div class="row">
            <div class="col-lg-3 sidebar">
                <div class="sidebar-wrap bg-light ftco-animate">
                    <h3 class="heading mb-4">Find City</h3>
                    <form action="/vuelo/busqueda" method="post">
                        {{ csrf_field() }}
                        <div class="fields">
                     <!--<div class="form-group">
                        <input type="text" class="form-control" placeholder="Destination, City">
                      </div>-->
                      <div class="form-group">
                         <p>Origen</p>
                        <div class="select-wrap one-third">
                        <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                        <!--<label for="Origen" style="color: black">Origen</label>-->
                        <select name="origen_id" id="origen_id" title="Origen" class="form-control selectpicker" placeholder="Origen">
                          @foreach($cities as $city)
                          <option>{{$city->cityName}}, {{$city->country->countryName}}</option>
                          @endforeach
                        </select>
                      </div>
                      </div>
                      <div class="form-group">
                         <p>Destino</p>
                        <div class="select-wrap one-third">
                        <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                        <select name="destino_id" id="destino_id" title="Destino" class="form-control selectpicker" placeholder="Keyword search">
                          @foreach($cities as $city)
                          <option>{{$city->cityName}}, {{$city->country->countryName}}</option>
                          @endforeach
                        </select>
                      </div>
                      </div>
                      <!--<div class="form-group">
                        <input type="text" id="checkin_date" class="form-control" placeholder="Date from">
                      </div>
                      <div class="form-group">
                        <input type="text" id="checkin_date" class="form-control" placeholder="Date to">
                      </div>
                      <div class="form-group">
                        <div class="range-slider">
                            <span>
                                <input type="number" value="25000" min="0" max="120000"/>   -
                                <input type="number" value="50000" min="0" max="120000"/>
                            </span>
                                <input value="1000" min="0" max="120000" step="500" type="range"/>
                                <input value="50000" min="0" max="120000" step="500" type="range"/>
                                </svg>
                        </div>
                      </div>-->
                      <div class="form-group">
                        <input type="submit" value="Search" class="btn btn-primary py-3 px-5">
                      </div>
                    </div>
                </form>
                </div>
                <!--<div class="sidebar-wrap bg-light ftco-animate">
                    <h3 class="heading mb-4">Star Rating</h3>
                    <form method="post" class="star-rating">
                              <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">
                                        <p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i></span></p>
                                    </label>
                              </div>
                              <div class="form-check">
                              <input type="checkbox" class="form-check-input" id="exampleCheck1">
                              <label class="form-check-label" for="exampleCheck1">
                                   <p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-o"></i></span></p>
                              </label>
                              </div>
                              <div class="form-check">
                              <input type="checkbox" class="form-check-input" id="exampleCheck1">
                              <label class="form-check-label" for="exampleCheck1">
                                <p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-o"></i><i class="icon-star-o"></i></span></p>
                             </label>
                              </div>
                              <div class="form-check">
                                <input type="checkbox" class="form-check-input" id="exampleCheck1">
                              <label class="form-check-label" for="exampleCheck1">
                                <p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-o"></i><i class="icon-star-o"></i><i class="icon-star-o"></i></span></p>
                              </label>
                              </div>
                              <div class="form-check">
                              <input type="checkbox" class="form-check-input" id="exampleCheck1">
                              <label class="form-check-label" for="exampleCheck1">
                                <p class="rate"><span><i class="icon-star"></i><i class="icon-star-o"></i><i class="icon-star-o"></i><i class="icon-star-o"></i><i class="icon-star-o"></i></span></p>
                                </label>
                              </div>
                            </form>
                </div>-->
          </div>
          <div class="col-lg-9">
            <div class="row">
                @foreach($flights as $flight)
                <div class="col-md-4 ftco-animate">
                            <div class="destination">
                                <a href="hot-el-single.html" class="img img-2 d-flex justify-content-center align-items-center" style="background-image: url(/images/avion2.jpg);">
                                    <div class="icon d-flex justify-content-center align-items-center">
                                <span class="icon-search2"></span>
                            </div>
                                </a>
                                <div class="text p-3">
                                    <div class="d-flex">
                                        <div class="one">
                                            <h3><a href="hotel-single.html">{{$flight->flightNumber}}</a></h3>
                                            <p class="rate">
                                                <span>{{$flight->airplaneCapacity}} Personas</span>
                                                <i class="icon-star"></i>
                                            </p>
                                        </div>
                                        <div class="two">
                                            <span class="price per-price">{{$flight->departureTime}}<br></span>
                                        </div>
                                    </div>
                                    <i class="icon-map-o"></i><p>Origen: {{$flight->departure->name}}, {{$flight->departure->city->cityName}}</p>
                                    <i class="icon-map-o"></i><p>Destino: {{$flight->arrival->name}}, {{$flight->arrival->city->cityName}}</p>
                                    <hr>
                                <form action="/asiento/seleccionar" method="post"> 
                                  {{ csrf_field() }}
                                  <input name="flight_id" type="hidden" value="{{$flight->id}}">
                                  <button type="submit" class="btn btn-primary">Reservar tu asiento</button>
                                  </form>
                                </div>
                            </div>
                        </div>
                @endforeach
                        
            </div>
            <div class="row mt-5">
                  <div class="col text-center">
                    <div class="block-27">
                      <ul>
                        <li><a href="#">&lt;</a></li>
                        <li class="active"><span>1</span></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li><a href="#">&gt;</a></li>
                      </ul>
                    </div>
                  </div>
                </div>
          </div> <!-- .col-md-8 -->
        </div>
      </div>
    </section> <!-- .section -->

    <footer class="ftco-footer ftco-bg-dark ftco-section">
      <div class="container">
        <div class="row mb-5">
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">dirEngine</h2>
              <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
              <ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4 ml-md-5">
              <h2 class="ftco-heading-2">Information</h2>
              <ul class="list-unstyled">
                <li><a href="#" class="py-2 d-block">About</a></li>
                <li><a href="#" class="py-2 d-block">Service</a></li>
                <li><a href="#" class="py-2 d-block">Terms and Conditions</a></li>
                <li><a href="#" class="py-2 d-block">Become a partner</a></li>
                <li><a href="#" class="py-2 d-block">Best Price Guarantee</a></li>
                <li><a href="#" class="py-2 d-block">Privacy and Policy</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
             <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Customer Support</h2>
              <ul class="list-unstyled">
                <li><a href="#" class="py-2 d-block">FAQ</a></li>
                <li><a href="#" class="py-2 d-block">Payment Option</a></li>
                <li><a href="#" class="py-2 d-block">Booking Tips</a></li>
                <li><a href="#" class="py-2 d-block">How it works</a></li>
                <li><a href="#" class="py-2 d-block">Contact Us</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
                <h2 class="ftco-heading-2">Have a Questions?</h2>
                <div class="block-23 mb-3">
                  <ul>
                    <li><span class="icon icon-map-marker"></span><span class="text">203 Fake St. Mountain View, San Francisco, California, USA</span></li>
                    <li><a href="#"><span class="icon icon-phone"></span><span class="text">+2 392 3929 210</span></a></li>
                    <li><a href="#"><span class="icon icon-envelope"></span><span class="text">info@yourdomain.com</span></a></li>
                  </ul>
                </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12 text-center">

            <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
          </div>
        </div>
      </div>
    </footer>
    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="/js/jquery.min.js"></script>
  <script src="/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="/js/popper.min.js"></script>
  <script src="/js/bootstrap.min.js"></script>
  <script src="/js/jquery.easing.1.3.js"></script>
  <script src="/js/jquery.waypoints.min.js"></script>
  <script src="/js/jquery.stellar.min.js"></script>
  <script src="/js/owl.carousel.min.js"></script>
  <script src="/js/jquery.magnific-popup.min.js"></script>
  <script src="/js/aos.js"></script>
  <script src="/js/jquery.animateNumber.min.js"></script>
  <script src="/js/bootstrap-datepicker.js"></script>
  <script src="/js/jquery.timepicker.min.js"></script>
  <script src="/js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="/js/google-map.js"></script>
  <script src="/js/main.js"></script>
    
@endsection