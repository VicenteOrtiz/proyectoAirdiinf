@extends('layouts.app')

@section('content') 
    <!-- END nav -->
    <div class="hero-wrap js-fullheight" style="background-image: url('/images/playa.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-start" data-scrollax-parent="true">
          <div class="col-md-9 ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
            <h1 class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><strong>Descubre<br></strong>Lugares del mundo</h1>
            <p data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><strong>Encuentra los mejores autos, hoteles y vuelos.</strong></p>
            <p>Recorre nuestras secciones.</p>
            <p class="browse d-md-flex">
              <span class="d-flex justify-content-md-center align-items-md-center"><a href="/"><i class="flaticon-meeting-point"></i>Restaurant</a></span>
              <span class="d-flex justify-content-md-center align-items-md-center"><a href="/hoteles"><i class="flaticon-hotel"></i>Hotel</a></span> 
              <span class="d-flex justify-content-md-center align-items-md-center"><a href="/vuelos"><i class="flaticon-support"></i>Vuelos</a></span> 
            </p>
          </div>
        </div>
      </div>
    </div>

    <section class="ftco-section services-section bg-light">
      <div class="container">
        <div class="row d-flex">
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block text-center">
              <div class="d-flex justify-content-center"><div class="icon"><span class="flaticon-guarantee"></span></div></div>
              <div class="media-body p-2 mt-2">
                <h3 class="heading mb-3">Los Mejores Precios</h3>
                <p>La pagina con los precios mas economicos.</p>
              </div>
            </div>      
          </div>
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block text-center">
              <div class="d-flex justify-content-center"><div class="icon"><span class="flaticon-like"></span></div></div>
              <div class="media-body p-2 mt-2">
                <h3 class="heading mb-3">Las personas nos aman</h3>
                <p>Dando posibilidades a cualquier cliente.</p>
              </div>
            </div>    
          </div>
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block text-center">
              <div class="d-flex justify-content-center"><div class="icon"><span class="flaticon-detective"></span></div></div>
              <div class="media-body p-2 mt-2">
                <h3 class="heading mb-3">Mejor Agente de Viaje</h3>
                <p>Recomendando los mejores lugares del mundo.</p>
              </div>
            </div>      
          </div>
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block text-center">
              <div class="d-flex justify-content-center"><div class="icon"><span class="flaticon-support"></span></div></div>
              <div class="media-body p-2 mt-2">
                <h3 class="heading mb-3">Nuestro Apoyo</h3>
                <p>Permitiendo a todas las personas a conocer el mundo.</p>
              </div>
            </div>      
          </div>
        </div>
      </div>
    </section>
    
    <section class="ftco-section ftco-destination">
      <div class="container">
        <div class="row justify-content-start mb-5 pb-3">
          <div class="col-md-7 heading-section ftco-animate">
            <span class="subheading">Featured</span>
            <h2 class="mb-4"><strong>Featured</strong> Destination</h2>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <div class="destination-slider owl-carousel ftco-animate">
              <div class="item">
                <div class="destination">
                  <a href="#" class="img d-flex justify-content-center align-items-center" style="background-image: url(/images/destination-1.jpg);">
                    <div class="icon d-flex justify-content-center align-items-center">
                      <span class="icon-search2"></span>
                    </div>
                  </a>
                  <div class="text p-3">
                    <h3><a href="#">Paris, Italy</a></h3>
                    <span class="listing">15 Listing</span>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="destination">
                  <a href="#" class="img d-flex justify-content-center align-items-center" style="background-image: url(/images/destination-2.jpg);">
                    <div class="icon d-flex justify-content-center align-items-center">
                      <span class="icon-search2"></span>
                    </div>
                  </a>
                  <div class="text p-3">
                    <h3><a href="#">San Francisco, USA</a></h3>
                    <span class="listing">20 Listing</span>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="destination">
                  <a href="#" class="img d-flex justify-content-center align-items-center" style="background-image: url(/images/destination-3.jpg);">
                    <div class="icon d-flex justify-content-center align-items-center">
                      <span class="icon-search2"></span>
                    </div>
                  </a>
                  <div class="text p-3">
                    <h3><a href="#">Lodon, UK</a></h3>
                    <span class="listing">10 Listing</span>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="destination">
                  <a href="#" class="img d-flex justify-content-center align-items-center" style="background-image: url(/images/destination-4.jpg);">
                    <div class="icon d-flex justify-content-center align-items-center">
                      <span class="icon-search2"></span>
                    </div>
                  </a>
                  <div class="text p-3">
                    <h3><a href="#">Lion, Singapore</a></h3>
                    <span class="listing">3 Listing</span>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="destination">
                  <a href="#" class="img d-flex justify-content-center align-items-center" style="background-image: url(/images/destination-5.jpg);">
                    <div class="icon d-flex justify-content-center align-items-center">
                      <span class="icon-search2"></span>
                    </div>
                  </a>
                  <div class="text p-3">
                    <h3><a href="#">Australia</a></h3>
                    <span class="listing">3 Listing</span>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="destination">
                  <a href="#" class="img d-flex justify-content-center align-items-center" style="background-image: url(/images/destination-6.jpg);">
                    <div class="icon d-flex justify-content-center align-items-center">
                      <span class="icon-search2"></span>
                    </div>
                  </a>
                  <div class="text p-3">
                    <h3><a href="#">Paris, Italy</a></h3>
                    <span class="listing">3 Listing</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section ftco-counter img" id="section-counter" style="background-image: url(/images/bg_1.jpg);">
      <div class="container">
        <div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 text-center heading-section heading-section-white ftco-animate">
            <h2 class="mb-4">Some fun facts</h2>
            <span class="subheading">More than 100,000 websites hosted</span>
          </div>
        </div>
        <div class="row justify-content-center">
          <div class="col-md-10">
            <div class="row">
              <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
                <div class="block-18 text-center">
                  <div class="text">
                    <strong class="number" data-number="100000">0</strong>
                    <span>Happy Customers</span>
                  </div>
                </div>
              </div>
              <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
                <div class="block-18 text-center">
                  <div class="text">
                    <strong class="number" data-number="40000">0</strong>
                    <span>Destination Places</span>
                  </div>
                </div>
              </div>
              <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
                <div class="block-18 text-center">
                  <div class="text">
                    <strong class="number" data-number="87000">0</strong>
                    <span>Hotels</span>
                  </div>
                </div>
              </div>
              <div class="col-md-3 d-flex justify-content-center counter-wrap ftco-animate">
                <div class="block-18 text-center">
                  <div class="text">
                    <strong class="number" data-number="56400">0</strong>
                    <span>Restaurant</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section testimony-section bg-light">
      <div class="container">
        <div class="row justify-content-start">
          <div class="col-md-5 heading-section ftco-animate">
            <span class="subheading">Mejor pagina de viajes</span>
            <h2 class="mb-4 pb-3"><strong>¿Por que</strong> escogernos?</h2>
            <p>Te ofrecemos una gran variedad de viajes, hoteles y autos, que te permiten conocer el resto del mundo y a un precio muy economico.</p>
          </div>
          <div class="col-md-1"></div>
          <div class="col-md-6 heading-section ftco-animate">
            <span class="subheading">Testimonios</span>
            <h2 class="mb-4 pb-3"><strong>Nuestro</strong> Clientes dicen</h2>
            <div class="row ftco-animate">
              <div class="col-md-12">
                <div class="carousel-testimony owl-carousel">
                  <div class="item">
                    <div class="testimony-wrap d-flex">
                      <div class="user-img mb-5" style="background-image: url(/images/person_1.jpg)">
                        <span class="quote d-flex align-items-center justify-content-center">
                          <i class="icon-quote-left"></i>
                        </span>
                      </div>
                      <div class="text ml-md-4">
                        <p class="mb-5">La mejor pagina que he escogido para realizar mis viajes.</p>
                        <p class="name">Dennis Green</p>
                        <span class="position">Cliente de Italia</span>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="testimony-wrap d-flex">
                      <div class="user-img mb-5" style="background-image: url(/images/person_2.jpg)">
                        <span class="quote d-flex align-items-center justify-content-center">
                          <i class="icon-quote-left"></i>
                        </span>
                      </div>
                      <div class="text ml-md-4">
                        <p class="mb-5">Los precios mas economicos que podras encontrar.</p>
                        <p class="name">Felipe Gonzalez</p>
                        <span class="position">Cliente de Londres</span>
                      </div>
                    </div>
                  </div>
                  <div class="item">
                    <div class="testimony-wrap d-flex">
                      <div class="user-img mb-5" style="background-image: url(/images/person_3.jpg)">
                        <span class="quote d-flex align-items-center justify-content-center">
                          <i class="icon-quote-left"></i>
                        </span>
                      </div>
                      <div class="text ml-md-4">
                        <p class="mb-5">Creo que nunca podre volver a usar otra pagina que no sea esta.</p>
                        <p class="name">Roberto Bello</p>
                        <span class="position">Cliente de Chile</span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section-parallax">
      <div class="parallax-img d-flex align-items-center">
        <div class="container">
          <div class="row d-flex justify-content-center">
            <div class="col-md-7 text-center heading-section heading-section-white ftco-animate">
              <h2>Bienvenido a DiinfAirlines</h2>
              <p>Disfrute de los distintos servicios que le ofrecemos.</p>
            </div>
          </div>
        </div>
      </div>
    </section>

    <footer class="ftco-footer ftco-bg-dark ftco-section">
      <div class="container">
        <div class="row mb-5">
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">DiinfAirlines</h2>
              <p>La mejor compañia para tus viajes.</p>
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
                <li><a href="#" class="py-2 d-block">Sobre Nosotros</a></li>
                <li><a href="#" class="py-2 d-block">Servicio</a></li>
                <li><a href="#" class="py-2 d-block">Terminos y condiciones</a></li>
                <li><a href="#" class="py-2 d-block">Vuelvete un socio</a></li>
                <li><a href="#" class="py-2 d-block">Privacidad y politica</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
             <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Customer Support</h2>
              <ul class="list-unstyled">
                <li><a href="#" class="py-2 d-block">FAQ</a></li>
                <li><a href="#" class="py-2 d-block">Opciones de pago</a></li>
                <li><a href="#" class="py-2 d-block">Tips para viajar</a></li>
                <li><a href="#" class="py-2 d-block">Como funciona</a></li>
                <li><a href="#" class="py-2 d-block">Llamanos</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">¿Tienes preguntas??</h2>
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