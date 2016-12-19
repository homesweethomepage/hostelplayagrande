<?php
require_once 'api_base.php';
require_once '../model/hostel_model.php';

class HostelApi extends ApiBase {
  private $model;

  function __construct($request){
    parent::__construct($request);
    $this->model = new HostelModel();
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
        if(count($this->args) > 0) return $this->model->borrarNovedad($this->args[0]);
        break;
      case 'POST':
        if(isset($_POST['novedad'])) return $this->model->agregarNovedad($_POST);
        break;
      case 'PUT':
        if(count($this->args) > 0) return $this->model->modificarNovedad($this->args[0],$this->args[1],$this->args[2]);
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
        if(count($this->args) > 0) return $this->model->borrarActividad($this->args[0]);
        break;
      case 'POST':
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
        if(count($this->args) > 0) return $this->model->borrarActivity($this->args[0]);
        break;
      case 'POST':
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
        if(count($this->args) > 0) return $this->model->borrarImgGaleria($this->args[0]);
        break;
      default:
            return 'Verbo no soportado';
        break;
    }
  }


}

?>
