<?php
include_once 'view/hostel_view.php';
include_once 'model/hostel_model.php';

class DisplayController {

  private $model;
  private $view;

  function __construct() {
    $this->model = new HostelModel();
    $this->view = new HostelView();
  }

  function mostrarHome(){
    $this->view->mostrarHome($this->model->getGaleria(),$this->model->getNovedades(),$this->model->getActivities(),$this->model->getActividades());
  }

}
?>
