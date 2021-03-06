<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Playa Grande Hostels</title>
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link href="css/font-awesome.min.css" rel="stylesheet">
  <link href="css/style.css" rel="stylesheet">
  <link rel="shortcut icon" href="images/ico/favicon.png">
</head>
<body>
  <!-- HEADER -->
  <header>
    <nav class="navbar navbar-default navbar-fixed-top box-shadow" role="banner">
      <div class="container">

        <!-- COLLAPSED BAR -->
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
        </div><!-- ./COLLAPSED BAR -->

        <div id="logo" class="navbar-brand">
          <a href="#"><img src="images/logo4.png" alt="Logo Hostel Playa Grande" class="img-responsive"/></a>
        </div>

        <div class="btn-reserva">
          <div class="btn-border-top-left">
            <div class="border-circle-left"></div>
            <div class="border-shadow-left"></div>
          </div>
          <div class="btn-border-top-right">
            <div class="border-circle-right"></div>
            <div class="border-shadow-right"></div>
          </div>
          <button>Reserva!</button>
        </div>

        <!-- NAV CONTENT -->
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="anchor-link"><a class="nav-item" href="#hostels">HOSTELS</a></li>
            <li class="anchor-link"><a class="nav-item" href="#services">SERVICIOS</a></li>
            <li class="anchor-link"><a class="nav-item" href="#location">Ubicacion</a></li>
            <li class="anchor-link"><a class="nav-item" href="#activities">Actividades</a></li>
            <li class="anchor-link"><a class="nav-item" href="#tarifas">Tarifas</a></li>
            <li class="anchor-link"><a class="nav-item" href="#news">Novedades</a></li>
            <li class="anchor-link"><a class="nav-item" href="#contacts">Contacto</a></li>
            <li class="flag-container"><a href="#"><img class="flag box-shadow" src="images/ico/es.png" /></a></li>
            <li class="flag-container"><a href="#"><img class="flag box-shadow" src="images/ico/en.png" /></a></li>
          </ul>
        </div><!-- ./NAV CONTENT -->
      </div>
    </nav>
  </header><!-- ./HEADER -->

  <!-- BOX RESERVA -->
  <section class="box-reserva box-shadow none-display">
    <div class="box-img">
      <img class="img-responsive" src="images/logo1.png" alt="Logo Hostel Playa Grande" />
    </div>
    <form action="#">
      <div class="box-check">
        <div class="col-xs-6 check-in">
          <span>check in</span>
          <div class="fecha">
            <p id="fecha-check-in"></p>
          </div>
          <div class="dia">
            <span id="dia-check-in"></span>
            <span id="mes-check-in"></span>
          </div>
          <input type="text" id="input-fecha-check-in">
        </div>
        <div class="col-xs-6 check-out">
          <span>check out</span>
          <div class="fecha">
            <p id="fecha-check-out"></p>
          </div>
          <div id="dia-mes-check-out" class="dia">
            <span id="dia-check-out"></span>
            <span id="mes-check-out"></span>
          </div>
          <input type="text" id="input-fecha-check-out">
        </div>
      </div>

      <div class="box-inputs">
        <div class="input-group">
          <span class="input-group-addon"><i class="fa fa-user"></i></span>
          <input id="first_name" name="first_name" placeholder="Nombre" class="form-control"  type="text">
        </div>
        <div class="input-group">
          <span class="input-group-addon"><i class="fa fa-user"></i></span>
          <input id="last_name" name="last_name" placeholder="Apellido" class="form-control"  type="text">
        </div>
        <div class="input-group">
          <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
          <input id="email" name="email" placeholder="Mail" class="form-control"  type="email">
        </div>
        <div class="input-group pull-left">
          <span class="input-group-addon"><i class="fa fa-male"></i></span>
          <input id="male" name="male" value="0" class="form-control"  type="number">
        </div>
        <div class="input-group pull-right">
          <span class="input-group-addon"><i class="fa fa-female"></i></span>
          <input id="female" name="female" value="0" class="form-control"  type="number">
        </div>
        <div class="input-group">
          <span class="input-group-addon"><i class="fa fa-bed"></i></span>
          <select id="room" name="room" class="form-control selectpicker" >
            <option value="Single c/baño privado">Single c/baño privado</option>
            <option value="Doble 2 camas c/baño privado">Doble 2 camas c/baño privado</option>
            <option value="Doble matrimonial camas c/baño privado">Doble matrimonial camas c/baño privado</option>
            <option value="Triple c/baño privado">Triple c/baño privado</option>
            <option value="Cuadruple c/baño privado">Cuadruple c/baño privado</option>
            <option value="5/6 c/baño privado">5/6 c/baño privado</option>
            <option value="8 c/baño privado">8 c/baño privado</option>
          </select>
        </div>
        <div class="input-group">
          <span class="input-group-addon"><i class="fa fa-home"></i></span>
          <select id="hostel" name="hostel" class="form-control selectpicker" >
            <option value="Todos los hostels">Todos los hostels</option>
            <option value="Playa Grande">Playa Grande</option>
            <option value="Playa Grande Austral">Playa Grande Austral</option>
            <option value="Playa Grande Suites">Playa Grande Suites</option>
          </select>
        </div>
      </div>

      <div class="box-botton">
        <span>Consulta <br> Disponibilidad</span>
        <input id="boton-reserva" type="submit" class="submit-reserva">
      </div>
    </form>
  </section><!-- ./BOX RESERVA -->


  <!-- CAROUSEL -->
  <section id="mainCarousel" class="carousel slide" data-ride="carousel">
    <!-- SLIDES -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="uploaded/imagenes/banner/1.jpg" alt="Aerea de costa de Mar del Plata">
      </div>
      <div class="item">
        <img src="uploaded/imagenes/banner/2.jpg" alt="Aerea de costa de Mar del Plata">
      </div>
      <div class="item">
        <img src="uploaded/imagenes/banner/3.jpg" alt="Aerea de costa de Mar del Plata">
      </div>
    </div><!-- ./SLIDES -->
    <!-- CONTROLES -->
    <a class="left carousel-control" href="#mainCarousel" role="button" data-slide="prev">
      <!-- <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> -->
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#mainCarousel" role="button" data-slide="next">
      <!-- <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> -->
      <span class="sr-only">Next</span>
    </a><!-- ./CONTROLES -->
  </section><!-- ./CAROUSEL -->

  <!-- GALERIA 1 -->
  <div id="hostels">
    <section id="galery" class="section-border-top">
      <div class="container">
        <div class="row box-primario">
          <div class="box-titulo-primario">
            <h1>NUESTROS HOSTELS</h1>
          </div>
        </div>
        <div class="row">
          <div class="col-md-6 box-hostel-desc none-display">
            <div class="box-hostel-titulo descripcion-activa">
              <div class="box-titulo">
                <h3 class="pg-descr">Playa Grande<i class="fa fa-minus" aria-hidden="true"></i></h3>
              </div>
              <div class="box-descripcion">
                <p>Bienvenidos a nuestro primer Hostel en Mar del Plata, nos encontramos localizados a dos cuadras del mar en Playa Grande, una de las playas mas bonitas y exclusivas de la ciudad y a metros del centro comercial y nocturno de la calle Alem.</p>
                <p>Nuestro hostel es un típico chalet estilo marplatense que se encuentra equipado con habitaciones para 4/6 y 8 personas con baños privados en cada habitación, cocina para uso de los huéspedes, Jardín con Parrilla y sala de usos múltiples con TV/DVD, guardería de Tablas de Surf y Windsurf y wifi gratis en todo el hostel.</p>
              </div>
            </div>
            <div class="box-hostel-titulo">
              <div class="box-titulo">
                <h3 class="pg-descr">Austral<i class="fa fa-plus" aria-hidden="true"></i></h3>
              </div>
              <div class="box-descripcion">
                <p>Ubicado a dos cuadras del mar en Playa Grande, en la intersección entre calle Saavedra y la calla comercial Alem. Playa Grande, además de ser uno de los barrios más bonitos y exclusivos de la ciudad, también se ha convertido en el centro comercial y nocturno más concurrido por los jóvenes donde podrás encontrar una gran cantidad bares, restaurantes y cervecerías de excelente nivel.  A dos cuadras del Hostel Playa Grande Suites encontramos la famosa Playa Grande, la más elegida por los surfistas por la calidad de sus olas y sus muy famosos after beach donde podrán disfrutar de las mejores fiestas de día con conocidos djs y personalidades.</p>
                <p>Nuestro hostel cuenta con habitaciones singles, dobles, triples y habitaciones a compartir de 4/6/8 personas. Todas las habitaciones son con baño privado. Contamos con comedor y cocina completamente equipada para uso común de los huéspedes, ademas de wifi gratuito.</p>
                <p>En nuestros hostels se acostumbra hacer noches de comidas caseras para promover la relación entre sus huéspedes, la buena onda y diversión.</p>
              </div>
            </div>
            <div class="box-hostel-titulo">
              <div class="box-titulo">
                <h3 class="pg-descr">Suites<i class="fa fa-plus" aria-hidden="true"></i></h3>
              </div>
              <div class="box-descripcion">
                <p>Bienvenidos a nuestro primer Hostel en Mar del Plata, nos encontramos localizados a dos cuadras del mar en Playa Grande, una de las playas mas bonitas y exclusivas de la ciudad y a metros del centro comercial y nocturno de la calle Alem.</p>
                <p>Nuestro hostel es un típico chalet estilo marplatense que se encuentra equipado con habitaciones para 4/6 y 8 personas con baños privados en cada habitación, cocina para uso de los huéspedes, Jardín con Parrilla y sala de usos múltiples con TV/DVD, guardería de Tablas de Surf y Windsurf y wifi gratis en todo el hostel.</p>
              </div>
            </div>
          </div>
          <div class="col-md-6 box-hostel-img none-display">
            <div class="box-img box-shadow">
              <img id="img-descripcion" class="img-responsive" src="images/descripciones/Playa Grande.jpg" alt="Frente - Hostel Playa Grande">
            </div>
          </div>
        </div>
      </div>
    </section><!-- ./GALERIA 1 -->

    <!-- GALERIA 2 -->
    <section id="galery2" class="section-border-top">

      <div id="galeryModal" class="gmodal">

        <!-- The Close Button -->
        <span class="gclose" onclick="document.getElementById('galeryModal').style.display='none'">&times;</span>

        <!-- Modal Content (The Image) -->
        <img class="modal-content" id="imgModal">

        <!-- Modal Caption (Image Text) -->
        <div id="imgCaption"></div>
      </div>

      <div class="container">
        <div class="row box-primario">
          <div class="box-titulo-primario">
            <h1>Galería</h1>
          </div>
        </div>
        <div class="row">
          <div class="titulo-galery col-md-offset-1 col-md-2 col-sm-3 col-xs-6">
            <h3><a id="js-galeria-todos" href="#" class="active">Todos</a></h3>
          </div>
          <div class="titulo-galery col-md-3 col-sm-3 col-xs-6">
            <h3><a id="js-galeria-hpg" href="#">Playa Grande</a></h3>
          </div>
          <div class="titulo-galery col-md-2 col-sm-3 col-xs-6">
            <h3><a id="js-galeria-hpga" href="#">Austral</a></h3>
          </div>
          <div class="titulo-galery col-md-3 col-sm-3 col-xs-6">
            <h3><a id="js-galeria-hpgs" href="#">Suites</a></h3>
          </div>
        </div>
      </div>
      <div id="galeryAnimation" class="noHeight">
        <div class="container">
          <div class="row galeryCarousel">
            <div class="arrowleft"><a href="#"><i class="fa fa-chevron-circle-left fa-2x" aria-hidden="true"></i></a></div>
            <div class="imgCarousel">
              <ul id="carousel-galeria" class="containerCarousel">

              </ul>
            </div>
            <div class="arrowright"><a href="#"><i class="fa fa-chevron-circle-right fa-2x" aria-hidden="true"></i></a></div>
          </div>
        </div>
      </div>
    </section><!-- ./GALERIA 2 -->
  </div>

  <!-- SERVICIOS -->
  <section id="services" class="section-border-top parallax-servicios">
    <div class="parallax-background">
      <div class="container">
        <div class="row box-primario">
          <div class="box-titulo-primario">
            <h1>Servicios</h1>
          </div>
        </div>
        <div class="row">
          <div class="box-servicios col-xs-12 col-md-8 col-md-offset-3 box-shadow none-display">
            <div class="col-xs-6">
              <div class="servicios servicios-left">
                <i class="fa fa-users fa-3x" aria-hidden="true"></i>
                <!-- <img src="images/iconos/servicios-habitacionesfamiliares.png" alt="Habitaciones Familiares"> -->
                <span>Disponemos de hablitaciones familiares</span>
              </div>
              <div class="servicios servicios-left">
                <i class="fa fa-coffee fa-3x" aria-hidden="true"></i>
                <!-- <img src="images/iconos/servicios-desayuno.png" alt="Desayuno incluido"> -->
                <span>Desayuno incluido con el precio</span>
              </div>
              <div class="servicios servicios-left">
                <i class="fa fa-clock-o fa-3x" aria-hidden="true"></i>
                <!-- <img src="images/iconos/servicios-24horas.png" alt="Abierto 24hs"> -->
                <span>Albergue abierto 24hs</span>
              </div>
            </div>
            <div class="col-xs-6">
              <div class="servicios servicios-right">
                <span>Se admiten viajeros solos</span>
                <i class="fa fa-user fa-3x" aria-hidden="true"></i>
                <!-- <img src="images/iconos/servicios-viajerosolo.png" alt="Viajero Solo"> -->
              </div>
              <div class="servicios servicios-right">
                <span>Guarda equipaje</span>
                <i class="fa fa-lock fa-3x" aria-hidden="true"></i>
                <!-- <img src="images/iconos/servicios-lockers.png" alt="Guardaequipaje"> -->
              </div>
              <div class="servicios servicios-right">
                <span>Jardin</span>
                <i class="fa fa-tree fa-3x" aria-hidden="true"></i>
                <!-- <img src="images/iconos/servicios-jardin.png" alt="Jardin"> -->
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="box-servicios col-xs-12 col-md-8 col-md-offset-1 box-shadow none-display">
            <div class="col-xs-6">
              <div class="servicios servicios-left">
                <i class="fa fa-television fa-3x" aria-hidden="true"></i>
                <!-- <img src="images/iconos/servicios-tv.png" alt="Televisor"> -->
                <span>Sala de TV / DVD</span>
              </div>
              <div class="servicios servicios-left">
                <i class="fa fa-wifi fa-3x" aria-hidden="true"></i>
                <!-- <img src="images/iconos/servicios-wifi.png" alt="Wifi"> -->
                <span>Conexión a internet / wifi</span>
              </div>
              <div class="servicios servicios-left">
                <i class="fa fa-shopping-cart fa-3x" aria-hidden="true"></i>
                <!-- <img src="images/iconos/servicios-tienda.png" alt="Tienda"> -->
                <span>Tienda en el albergue o cerca</span>
              </div>
            </div>
            <div class="col-xs-6">
              <div class="servicios servicios-right">
                <span>Salas comunes</span>
                <i class="fa fa-comment fa-3x" aria-hidden="true"></i>
                <!-- <img src="images/iconos/servicios-salascomunes.png" alt="Salas comunes"> -->
              </div>
              <div class="servicios servicios-right">
                <span>Cocina para huéspedes</span>
                <i class="fa fa-cutlery fa-3x" aria-hidden="true"></i>
                <!-- <img src="images/iconos/servicios-cocina.png" alt="Cocina"> -->
              </div>
              <div class="servicios servicios-right">
                <span>Barbacoa</span>
                <i class="fa fa-fire fa-3x" aria-hidden="true"></i>
                <!-- <img src="images/iconos/servicios-bbq.png" alt="Parrilla"> -->
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="box-servicios col-xs-12 col-md-8 col-md-offset-3 box-shadow none-display">
            <div class="col-xs-6">
              <div class="servicios servicios-left">
                <i class="fa fa-bicycle fa-3x" aria-hidden="true"></i>
                <!-- <img src="images/iconos/servicios-bicicleta.png" alt="Bicicleta"> -->
                <span>Alquiler de bicicletas en el albergue o cerca</span>
              </div>
              <div class="servicios servicios-left">
                <i class="fa fa-bed fa-3x" aria-hidden="true"></i>
                <!-- <img src="images/iconos/servicios-sabanas.png" alt="Cama"> -->
                <span>Sabanas incluídas en el precio</span>
              </div>
              <div class="servicios servicios-left">
                <i class="fa fa-tint fa-3x" aria-hidden="true"></i>
                <!-- <img src="images/iconos/servicios-lavanderia.png" alt="Lavaropas"> -->
                <span>Servicios de lavandería</span>
              </div>
            </div>
            <div class="col-xs-6">
              <div class="servicios servicios-right">
                <span>Deportes</span>
                <i class="fa fa-futbol-o fa-3x" aria-hidden="true"></i>
                <!-- <img src="images/iconos/servicios-deportes.png" alt="Deportes"> -->
              </div>
              <div class="servicios servicios-right">
                <span>Impuestos incluidos en el precio</span>
                <i class="fa fa-percent fa-3x" aria-hidden="true"></i>
                <!-- <img src="images/iconos/servicios-iva.png" alt="Iva incluido"> -->
              </div>
              <div class="servicios servicios-right">
                <span>Cambio de moneda en el albergue o cerca</span>
                <i class="fa fa-exchange fa-3x" aria-hidden="true"></i>
                <!-- <img src="images/iconos/servicios-cambiomoneda.png" alt="Cambio de moneda"> -->
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section><!-- ./SERVICIOS -->

  <!-- UBICACION -->
  <section id="location" class="section-border-top">
    <div class="container">
      <div class="row box-primario">
        <div class="box-titulo-primario">
          <h1>Ubicación</h1>
        </div>
      </div>
      <div class="row">
        <div class="col-md-4 ubicacionLeft none-display">
          <!-- <h3>Ubicación</h3> -->
          <div class="playa-loc">
            <h3>PLAYA GRANDE</h3>
            <span><i class="fa fa-map-marker fa-lg" aria-hidden="true"></i><a href="https://goo.gl/pBIJYd" target="_blank">Quintana 168</a></span>
            <span><i class="fa fa-phone fa-lg" aria-hidden="true"></i>+54 (223) 451-7307</span>
          </div>
          <div class="playa-loc">
            <h3>AUSTRAL</h3>
            <span><i class="fa fa-map-marker fa-lg" aria-hidden="true"></i><a href="https://goo.gl/d5sY0Z" target="_blank">Alem 3602, esquina Saavedra</a></span>
            <span><i class="fa fa-phone fa-lg" aria-hidden="true"></i>+54 (223) 451-2396</span>
          </div>
          <div class="playa-loc">
            <h3>SUITES</h3>
            <span><i class="fa fa-map-marker fa-lg" aria-hidden="true"></i><a href="https://goo.gl/W2JXwa" target="_blank">Primera Junta 201, esquina Alem</a></span>
            <span><i class="fa fa-phone fa-lg" aria-hidden="true"></i>+54 (223) 451-2225</span>
          </div>
        </div>
        <div class="col-md-8 ubicacionRight none-display">
          <div id="map" class="box-shadow"></div>
        </div>
      </div>
    </div>
  </section><!-- ./UBICACION -->

  <!-- ACTIVIDADES -->
  <section id="activities" class="section-border-top">

    <div id="activitiesModal" class="amodal">
      <!-- Body Modal -->
      <div class="bodyModal">
        <div class="headerModal">
          <!-- The Close Button -->
          <span class="aclose" onclick="document.getElementById('activitiesModal').style.display='none'">&times;</span>
          <!-- Titulo -->
          <h3 id="tituloModal"></h3>
        </div>
        <div class="footerModal" id="textoModal">

        </div>
      </div>

      <!-- Modal Content (The Image) -->
      <img class="modal-content" id="imgModal">

      <!-- Modal Caption (Image Text) -->
      <div id="imgCaption"></div>
    </div>

    <div class="container">
      <div class="row box-primario">
        <div class="box-titulo-primario">
          <h1>Actividades</h1>
        </div>
      </div>
      <div class="row">
        {foreach $actividades as $actividad}
        <div class="col-md-4 col-sm-6 custom-padding">
          <div class="box-actividades box-shadow">
            <div class="box-top">
              <img src="uploaded/imagenes/actividades/{$actividad['ruta']}" alt="paracaidismo">
            </div>
            <div class="box-bot">
              <span>{$actividad['activity']}</span>
              <div class="texto">
                {$actividad['cuerpo']}
              </div>
            </div>
          </div>
        </div>
        {/foreach}
      </div>
    </div>
  </section>
  <!-- ./ACTIVIDADES -->

  <!-- TARIFAS -->
  <section id="tarifas" class="section-border-top">
    <div id="carousel-tarifas" class="row carousel slide" data-ride="carousel">
      <!-- INDICATORS -->
      <ol class="carousel-indicators">
        {foreach $tarifas as $i}
          {if $i@index eq 0}
            <li data-target="#carousel-tarifas" data-slide-to="{$i}" class="active"></li>
          {else}
            <li data-target="#carousel-tarifas" data-slide-to="{$i}"></li>
          {/if}
        {/foreach}
      </ol><!-- ./INDICATORS -->
      <!-- SLIDES -->
      <div class="carousel-inner" role="listbox">
        {foreach $tarifas as $tarifa}
        {if $tarifa@index eq 0}
          <div class="item active">
        {else}
          <div class="item">
        {/if}
          <img class="tarifa" src="uploaded/imagenes/tarifas/{$tarifa['ruta']}" alt="{$tarifa['actividad']}">
        </div>
        {/foreach}
      </div><!-- ./SLIDES -->
      <!-- CONTROLES -->
      <a class="carousel-control left" href="#carousel-tarifas" role="button" data-slide="prev">
        <!-- <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> -->
        <i class="fa fa-chevron-left" aria-hidden="true"></i>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control right" href="#carousel-tarifas" role="button" data-slide="next">
        <!-- <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> -->
        <i class="fa fa-chevron-right" aria-hidden="true"></i>
        <span class="sr-only">Next</span>
      </a><!-- ./CONTROLES -->
    </div>
  </section><!-- ./TARIFAS -->

  <!-- NOVEDADES -->
  <section id="news" class="section-border-top">
    <div class="container">
      <div class="row box-primario">
        <div class="box-titulo-primario">
          <h1>Novedades</h1>
        </div>
      </div>
      <article id="article-news">
        <ul class="pager">
          <li class="previous"><a id="nov-prev" class="inactive" href="#"><i class="fa fa-caret-left fa-3x" aria-hidden="true"></i>
</a></li>
          <li class="next"><a id="nov-nxt" class="inactive" href="#"><i class="fa fa-caret-right fa-3x" aria-hidden="true"></i>
</a></li>
        </ul>
        <!-- ACA VA EL TEMPLATE -->
      </article>
    </div>

  </section><!-- ./NOVEDADES -->

  <!-- CONTACTOS -->
  <section id="contacts" class="section-border-top">
    <div class="container">
      <div class="row box-primario">
        <div class="box-titulo-primario">
          <h1>Contacto</h1>
        </div>
      </div>
      <form class="row form-blue" action="#">

        <div class="form-group col-md-4 col-md-offset-2">
          <label class="control-label">Nombre</label>
          <div class="inputGroupContainer">
            <div class="input-group box-shadow">
              <span class="input-group-addon"><i class="fa fa-user" aria-hidden="true"></i></span>
              <input id="contacto-nombre" name="nombre" class="form-control"  type="text">
            </div>
          </div>
        </div>

        <div class="form-group col-md-4">
          <label for="mail" class="control-label">Mail</label>
          <div class="inputGroupContainer">
            <div class="input-group box-shadow">
              <span class="input-group-addon"><i class="fa fa-envelope" aria-hidden="true"></i></span>
              <input id="contacto-email" name="mail" type="email" class="form-control">
            </div>
          </div>
        </div>

        <div class="form-group col-md-8 col-md-offset-2">
          <label for="asunto" class="control-label">Asunto</label>
          <div class="inputGroupContainer">
            <div class="input-group box-shadow">
              <span class="input-group-addon"><i class="fa fa-comment" aria-hidden="true"></i></span>
              <input id="contacto-asunto" type="text" class="form-control">
            </div>
          </div>
        </div>

        <div class="form-group col-md-8 col-md-offset-2">
          <label for="comentario" class="control-label">Comentario</label>
          <div class="inputGroupContainer">
            <div class="input-grupo box-shadow">
            <textarea id="contacto-comentario" name="comentario" cols="30" rows="10" class="form-control"></textarea>
            </div>
          </div>
        </div>

        <div class="form-group col-md-8 col-md-offset-2">
          <div class="alert alert-success hidden" role="alert" id="contacto-success-message">Enviado con éxito! <i class="fa fa-thumbs-o-up" aria-hidden="true"></i> Gracias por contactarse con nosotros, nos comunicaremos a la brevedad.</div>
          <div class="alert alert-danger hidden" role="alert" id="contacto-error-message">Error al enviar la consulta! <i class="fa fa-thumbs-o-down" aria-hidden="true"></i> Intente nuevamente en unos minutos.</div>
          <div class="alert alert-danger hidden" role="alert" id="contacto-info-message">Debe completar todos los campos.</div>
        </div>

        <!-- Button -->
        <div class="form-group col-md-8 col-md-offset-2">
          <label class="control-label"></label>
          <div>
            <button id="boton-comentario" type="submit" class="btn btn-enviar-blue pull-right box-shadow">Enviar <i class="fa fa-paper-plane" aria-hidden="true"></i></button>
          </div>
        </div>

      </form>
    </div>
  </section><!-- ./CONTACTOS -->

  <footer class="section-border-top">
    <div class="container">
      <div class="row">
      	<div class="col-md-6 copyr">
          <a href="https://www.hihostels.com/" target="_blank"><img class="img-responsive" src="images/ico/hostelling.png" alt="Hostelling International Logo"/></a>
          <p><span>Playa Grande Hostels</span> © 2016, Todos los derechos reservados.</p>
        </div>
      	<div class="col-md-6 powered">
          <span>Powered By: <a href="mailto:hshpdesign@gmail.com">Home Sweet Home Page</a></span>
        </div>
      </div>
    </div>
  </footer>


  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDeOlwGrHwbkPbFkXvAdXEN3On7mrWtxTc"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/mustache.js/2.1.3/mustache.js"></script>
  <script src="js/map.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/animate.js"></script>
  <script src="js/reserva.js"></script>
  <script src="js/contacto.js"></script>
  <script src="js/carouselgalery.js"></script>
  <script src="js/novedades.js"></script>
  <script src="js/modal.js"></script>
  <script src="js/tarifa.js"></script>
</body>
</html>
