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
                  <a href="index.php?action=logout"><i class="fa fa-power-off"></i> Log Out </a>
              </li>
          </ul>
          <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
          <div class="collapse navbar-collapse navbar-ex1-collapse">
              <ul class="nav navbar-nav side-nav">
                  <li class="js-admin-nav active">
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
                  <li class="js-admin-nav">
                      <a id="js-admin-galeria" href="http://localhost/proyectos/hostel/index.php?action=admin_galeria"><i class="fa fa-fw fa-picture-o"></i> Galeria</a>
                  </li>
              </ul>
          </div>
          <!-- /.navbar-collapse -->
      </nav>


      <div id="page-wrapper">

        <div class="row">
        <div class="col-md-6 well">

          <h3>Agregar Novedad
            <button id="js-refresh-novedades" type="button" class="btn btn-default btn-xs pull-right " aria-label="Refresh">
              <span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>
            </button>
          </h3>

          <form id="submitNovedad" action="index.php?action=agregar_novedad" method="POST" enctype="multipart/form-data">
            <div class="form-group">
              <label for="novedad">Titulo</label>
              <input type="text" class="form-control" id="novedad" name="novedad" placeholder="Titulo" required>
            </div>

            <div class="form-group">
              <label for="novedad">Cuerpo</label>
              <textarea class="form-control" rows="6"  id="cuerpo" name="cuerpo" placeholder="Cuerpo" required></textarea>
            </div>

            <div class="form-group">
              <label for="imagesToUpload">Imágenes</label>
              <input type="file" name="imagesToUpload[]" id="imagesToUpload" required/>
            </div>

            <button id="js-button-novedad" type="submit" class="btn btn-default">Agregar Novedad</button>
          </form>

        </div>

        <div class="col-md-6">
          <ul id="listaNovedades" class="list-group">
          </ul>
        </div>
      </div>
    </div><!-- /#page-wrapper -->
    </div><!-- /#wrapper -->

    <img id="loading-image" src="images/loading.gif" class="popup-loading hidden" alt="Loading..."></img>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/mustache.js/2.1.3/mustache.js"></script>
    <script src="js/hostelABM.js"></script>

  </body>
</html>
