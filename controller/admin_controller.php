<?php
include_once 'view/hostel_view.php';
include_once 'model/hostel_model.php';

class AdminController {

  private $model;
  private $view;

  function __construct() {
    $this->model = new HostelModel();
    $this->view = new HostelView();
    $this->checkSession();
  }

  function checkSession(){
    $time = 60000;
    session_start();
    if(isset($_SESSION["email"])){
      if(isset($_SESSION["timeout"]) && time() > $_SESSION["timeout"] + $time){
        session_destroy();
      }
      else{
        $_SESSION["timeout"] = time();
      }
    }
    else{
      header("Location: index.php?action=login");
      die();
    }
  }

  function mostrarAdminHostel(){
    $this->view->mostrarAdminHostel($this->model->getNovedades());
  }

  function mostrarAdminHostelNovedad(){
    $this->view->mostrarAdminHostelNovedad($this->model->getNovedadById($_REQUEST));
  }

  function mostrarAdminHostelBanner(){
    $this->view->mostrarAdminHostelBanner();
  }

  function mostrarAdminHostelActividades(){
    $this->view->mostrarAdminHostelActividades($this->model->getActividades());
  }

  function mostrarAdminHostelActivities(){
    $this->view->mostrarAdminHostelActivities($this->model->getActivities());
  }


  function mostrarAdminHostelGaleria(){
    $this->view->mostrarAdminHostelGaleria($this->model->getGaleria());
  }

  function agregarNovedades(){
    if(isset($_REQUEST['novedad'])){
        $this->model->agregarNovedad($_REQUEST);
      }
    else{
      $this->view->mostrarError('Debe completar todos los campos');
    }
    $this->mostrarAdminHostel();
  }

  function borrarNovedad(){
    if(isset($_REQUEST['id_novedad'])){
      $this->model->borrarNovedad($_REQUEST['id_novedad']);
    }
    else{
      $this->view->mostrarError('La novedad que intenta borrar no existe');
    }
    $this->mostrarAdminHostel();
  }

  function modificarNovedad(){
      if(isset($_REQUEST['idnovedad'])){
        $this->model->modificarNovedad($_REQUEST['idnovedad'],$_REQUEST['novedad'],$_REQUEST['fecha'],$_REQUEST['cuerpo']);
      }
      else{
        $this->view->mostrarError('Error al modificar novedad');
      }
      $this->mostrarAdminHostel();
  }

  function agregarImagenes(){
    if(isset($_REQUEST['id_novedad']) && isset($_FILES)){
      $this->model->agregarImagenes($_REQUEST['id_novedad'], $_FILES);
    }
    else{
      $this->view->mostrarError('Faltaron ingresar datos');
    }
    $this->mostrarAdminHostel();
  }

  function borrarImagen(){
    if(isset($_REQUEST['id_novedad'])){
      $this->model->borrarImagen($_REQUEST['id_novedad']);
    }
    else{
      $this->view->mostrarError('La imagen que intenta borrar no existe');
    }
    $this->mostrarAdminHostel();
  }

  function agregarImagenActividad(){
    if(isset($_FILES)){
      $this->model->agregarImagenActividad($_FILES);
    }
    else{
      $this->view->mostrarError('No se selecciono una imagen valida');
    }
    $this->mostrarAdminHostel();
  }

  function agregarImagenActivities(){
    if(isset($_FILES)){
      $this->model->agregarImagenActivities($_FILES);
    }
    else{
      $this->view->mostrarError('No se selecciono una imagen valida');
    }
    $this->mostrarAdminHostel();
  }

  function agregarImagenGaleria(){
    if(isset($_REQUEST['id_hostel']) && isset($_FILES)){
      $this->model->agregarImagenGaleria($_REQUEST['id_hostel'],$_FILES);
    }
    else{
      $this->view->mostrarError('No se selecciono una imagen valida');
    }
    $this->mostrarAdminHostel();
  }

  function modificarBanner(){
    if(isset($_REQUEST['slide']) && isset($_FILES)){
      $this->model->modificarBanner($_FILES,$_REQUEST['slide']);
    }
    else{
      $this->view->mostrarError('No se selecciono una imagen valida');
    }
  }

}
?>
