<?php /* Smarty version Smarty-3.1.14, created on 2016-12-19 19:23:34
         compiled from ".\templates\admin\novedad.tpl" */ ?>
<?php /*%%SmartyHeaderCode:28260585825a6a46935-32517125%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '455ef60af851054ce43a3d9dacd7c3d856ccdb64' => 
    array (
      0 => '.\\templates\\admin\\novedad.tpl',
      1 => 1481229947,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '28260585825a6a46935-32517125',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'novedad' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.14',
  'unifunc' => 'content_585825a6b573b0_09823875',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_585825a6b573b0_09823875')) {function content_585825a6b573b0_09823875($_smarty_tpl) {?><!DOCTYPE html>
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
                      <a id="js-admin-novedades active" href="http://localhost/proyectos/hostel/index.php?action=admin_hostel"><i class="fa fa-fw fa-file-text-o"></i> Novedades</a>
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

          <h3>Modificar Novedad</h3>

          <form id="modNovedad" action="index.php?action=modificar_novedad" method="POST" enctype="multipart/form-data">
            <div class="form-group">
              <label for="novedad">Titulo</label>
              <input type="text" class="form-control" id="novedad" name="novedad" value="<?php echo $_smarty_tpl->tpl_vars['novedad']->value['novedad'];?>
" required>
            </div>

            <div class="form-group">
              <label for="novedad">Cuerpo</label>
              <textarea class="form-control" rows="6" id="cuerpo" name="cuerpo" required><?php echo $_smarty_tpl->tpl_vars['novedad']->value['cuerpo'];?>
</textarea>
            </div>

            <div class="form-group">
              <label for="imagesToUpload">Imágenes</label>
              <input type="file" name="imagesToUpload[]" id="imagesToUpload" required/>
            </div>
            <input type="text" class="form-control hidden" id="novedadId" name="id" value="<?php echo $_smarty_tpl->tpl_vars['novedad']->value['id'];?>
" required>

            <button id="js-btn-modificar-novedad" type="submit" class="btn btn-default">Modificar Novedad</button>
          </form>

        </div>

        <div class="col-md-6">
          <img class="img-responsive" src="<?php echo $_smarty_tpl->tpl_vars['novedad']->value['imagen'];?>
" />
        </div>

      </div>
    </div><!-- /#page-wrapper -->
    </div><!-- /#wrapper -->

    <img id="loading-image" src="images/loading.gif" class="popup-loading hidden" alt="Loading..."></img>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/mustache.js/2.1.3/mustache.js"></script>
    <script src="js/hostelABMN.js"></script>

  </body>
</html>
<?php }} ?>