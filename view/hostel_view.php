<?php

include_once 'libs/Smarty.class.php';

class HostelView {
  private $smarty;
  private $errores;

  function __construct(){
    $this->smarty = new Smarty();
    $this->errores = array();
  }

  function mostrarHome($galeria,$novedades,$actividades,$tarifas){
    $this->smarty->assign('galeria', $galeria);
    $this->smarty->assign('novedades', $novedades);
    $this->smarty->assign('actividades', $actividades);
    $this->smarty->assign('tarifas', $tarifas);
    $this->smarty->display('index.tpl');
  }

  function mostrarContacto(){
    $this->smarty->display('contact.tpl');
  }

  function mostrarAdminHostel($novedades){
    $this->smarty->assign('errores', $this->errores);
    $this->smarty->assign('novedades', $novedades);
    $this->smarty->display('adminHostel.tpl');
  }

  function mostrarAdminHostelNovedad($novedad){
    $this->smarty->assign('novedad', $novedad);
    $this->smarty->display('admin/novedad.tpl');
  }

  function mostrarAdminHostelTarifa(){
    $this->smarty->display('admin/tarifas.tpl');
  }

  function mostrarAdminHostelActividades($actividades){
    $this->smarty->assign('actividades', $actividades);
    $this->smarty->display('admin/tarifas.tpl');
  }

  function mostrarAdminHostelActivities($activities){
    $this->smarty->assign('activities', $activities);
    $this->smarty->display('admin/activities.tpl');
  }

  function mostrarAdminHostelGaleria($galeria){
    $this->smarty->assign('galeria', $galeria);
    $this->smarty->display('admin/galeria.tpl');
  }

  function mostrarAdminHostelBanner(){
    $this->smarty->display('admin/banner.tpl');
  }

  function mostrarError($error){
    array_push($this->errores, $error);
  }

}
?>
