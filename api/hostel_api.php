<?php
require_once 'api_base.php';
require_once '../model/hostel_model.php';

class HostelApi extends ApiBase {
  private $model;

  function __construct($request){
    parent::__construct($request);
    $this->model = new HostelModel();
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

  function novedad(){
    switch ($this->method) {
      case 'GET':
        if(count($this->args) > 0){
          return $this->model->getNovedadById($this->args[0]);
        }
        else {
          return $this->model->getNovedades();
        }
        break;
      case 'DELETE':
        $this->checkSession();
        if(count($this->args) > 0) return $this->model->borrarNovedad($this->args[0]);
        break;
      case 'POST':
        $this->checkSession();
        if(isset($_POST['modificar'])){
          return $this->model->modificarNovedad($_POST);
        }else {
          if(isset($_POST['novedad']))
          return $this->model->agregarNovedad($_POST);
        }
        break;
      default:
            return 'Verbo no soportado';
        break;
    }
  }

  function actividad(){
    switch ($this->method) {
      case 'GET':
        return $this->model->getActividades();
        break;
      case 'DELETE':
        $this->checkSession();
        if(count($this->args) > 0) return $this->model->borrarActividad($this->args[0]);
        break;
      case 'POST':
        $this->checkSession();
        if(isset($_POST['actividad'])) return $this->model->agregarActividad($_POST);
        break;
      default:
            return 'Verbo no soportado';
        break;
    }
  }

  function activity(){
    switch ($this->method) {
      case 'GET':
        return $this->model->getActivities();
        break;
      case 'DELETE':
        $this->checkSession();
        if(count($this->args) > 0) return $this->model->borrarActivity($this->args[0]);
        break;
      case 'POST':
        $this->checkSession();
        if(isset($_POST['activity'])) return $this->model->agregarActivity($_POST);
        break;
      default:
            return 'Verbo no soportado';
        break;
    }
  }

  function galeria(){
    switch ($this->method) {
        case 'GET':
        if(count($this->args) > 0){
          return $this->model->getGaleriaDif($this->args[0]);
        }
        else {
          return $this->model->getGaleria();
        }
        break;
      case 'DELETE':
        $this->checkSession();
        if(count($this->args) > 0) return $this->model->borrarImgGaleria($this->args[0]);
        break;
      default:
            return 'Verbo no soportado';
        break;
    }
  }


}

?>
