<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Lista de novedades</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="css/admin.css" rel="stylesheet">
    <link rel="stylesheet" href="css/loadingPopup.css">
  </head>

  <body>
    <div id="wrapper">

      <!-- Navigation -->
      <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
          <!-- Brand and toggle get grouped for better mobile display -->
          <div class="navbar-header">
              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                  <span class="sr-only">Toggle navigation</span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="index.html">Hostel Playa Grande</a>
          </div>
          <!-- Top Menu Items -->
          <ul class="nav navbar-right top-nav">
              <li>
                  <a href="#"><i class="fa fa-power-off"></i> Log Out </a>
              </li>
          </ul>
          <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
          <div class="collapse navbar-collapse navbar-ex1-collapse">
              <ul class="nav navbar-nav side-nav">
                  <li class="js-admin-nav">
                      <a id="js-admin-novedades" href="http://localhost/proyectos/hostel/index.php?action=admin_hostel"><i class="fa fa-fw fa-file-text-o"></i> Novedades</a>
                  </li>
                  <li class="js-admin-nav">
                      <a id="js-admin-actividades" href="http://localhost/proyectos/hostel/index.php?action=admin_tarifa"><i class="fa fa-fw fa-dollar"></i> Tarifas</a>
                  </li>
                  <li class="js-admin-nav">
                      <a id="js-admin-activities" href="http://localhost/proyectos/hostel/index.php?action=admin_actividades"><i class="fa fa-fw fa-bicycle"></i> Actividades</a>
                  </li>
                  <li class="js-admin-nav">
                      <a id="js-admin-banner" href="http://localhost/proyectos/hostel/index.php?action=admin_banner"><i class="fa fa-fw fa-picture-o"></i> Banner</a>
                  </li>
                  <li class="js-admin-nav active">
                      <a id="js-admin-galeria" href="http://localhost/proyectos/hostel/index.php?action=admin_galeria"><i class="fa fa-fw fa-picture-o"></i> Galeria</a>
                  </li>
              </ul>
          </div>
          <!-- /.navbar-collapse -->
      </nav>


      <div id="page-wrapper">

        <div class="row">
          <div class="col-md-6 well">

            <h3>Agregar Imagenes a la Galeria
              <a href="http://localhost/proyectos/hostel/index.php?action=admin_galeria" class="btn btn-default btn-xs pull-right " aria-label="Refresh">
                <span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>
              </a>
            </h3>

            <form id="submitImgGaleria" method="POST" enctype="multipart/form-data">

              <div class="alert alert-info hidden" role="alert" id="abm-info-message">Seleccionar una imagen.</div>

              <div class="form-group">
                <label for="imgGaleriaToUpload">Imágenes</label>
                <input type="file" name="imgGaleriaToUpload[]" id="imgGaleriaToUpload" required multiple/>
              </div>

              <div class="form-group">
                <label for="hostel">Hostel:</label>
                <label class="radio-inline"><input type="radio" name="hostel" value="Todos los Hostels" checked required>Todos</label>
                <label class="radio-inline"><input type="radio" name="hostel" value="Hostel Playa Grande"required>Playa Grande</label>
                <label class="radio-inline"><input type="radio" name="hostel" value="Hostel Playa Grande Austral" required>Austral</label>
                <label class="radio-inline"><input type="radio" name="hostel" value="Hostel Playa Grande Suites" required>Suites</label>
              </div>

              <button id="js-button-galeria" type="submit" class="btn btn-default">Agregar Imagenes</button>
            </form>

          </div>
        </div>

        <div id="listaGaleria" class="row text-center">
        </div>

      </div><!-- /#page-wrapper -->
    </div><!-- /#wrapper -->

    <img id="loading-image" src="images/loading.gif" class="popup-loading hidden" alt="Loading..."></img>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/mustache.js/2.1.3/mustache.js"></script>
    <script src="js/hostelABMG.js"></script>

  </body>
</html>
