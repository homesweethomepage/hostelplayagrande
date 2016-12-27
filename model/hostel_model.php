<?php
class HostelModel {

  private $db;
  // private $user = 'u70278300';
  // private $pass = 'p83620100';
  private $user = 'root';
  private $pass = '';

  function __construct() {
      $this->db = new PDO('mysql:host=localhost;dbname=d60257800',$this->user,$this->pass);
      $this->db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  }

  private function subirArchivosAJAX($archivos){
    $destinos = array();
    foreach ($archivos as $archivo) {
      $destino = 'uploaded/imagenes/novedades/'.uniqid().$archivo['name'];
      move_uploaded_file($archivo['tmp_name'], $destino);
      $destinos[]=$destino;
    }
    return $destinos;
  }

  private function subirImgAct($archivos){
    $destinos = array();
    foreach ($archivos as $archivo) {
      $destino = 'uploaded/imagenes/tarifas/'.$archivo['name'];
      move_uploaded_file($archivo['tmp_name'], $destino);
      $destinos[]=$destino;
    }
    return $destinos;
  }

  private function subirImgActy($archivos){
    $destinos = array();
    foreach ($archivos as $archivo) {
      $destino = 'uploaded/imagenes/actividades/'.$archivo['name'];
      move_uploaded_file($archivo['tmp_name'], $destino);
      $destinos[]=$destino;
    }
    return $destinos;
  }

  private function subirImgGal($archivos){
    $destinos = array();
    foreach ($archivos as $archivo) {
      $destino = 'uploaded/imagenes/galeria/'.uniqid().$archivo['name'];
      move_uploaded_file($archivo['tmp_name'], $destino);
      $destinos[]=$destino;
    }
    return $destinos;
  }

  private function modificarSlide($archivos,$slide){
    $destinos = array();
    foreach ($archivos as $archivo) {
      $destino = 'uploaded/imagenes/banner/'.$slide.'.jpg';
      move_uploaded_file($archivo['tmp_name'], $destino);
      $destinos[]=$destino;
    }
    return $destinos;
  }

  function getNovedades(){
    $novedades = array();
    $consulta = $this->db->prepare("SELECT * FROM novedad");
    $consulta->execute();
    while($novedad = $consulta->fetch()){
      $consulta1 = $this->db->prepare("SELECT * FROM imagen where fk_id_novedad=?");
      $consulta1->execute(array($novedad['id']));
      $imagen = $consulta1->fetch();
      $novedad['imagen'] = $imagen['ruta'];
      $novedades[] = $novedad;
    }
    return $novedades;
  }

  function getNovedadById($id){
    $consulta = $this->db->prepare("SELECT * FROM novedad WHERE id=?");
    $consulta->execute(array($id['idnovedad']));
    $novedad = $consulta->fetch();
    $consulta1 = $this->db->prepare("SELECT * FROM imagen where fk_id_novedad=?");
    $consulta1->execute(array($novedad['id']));
    $imagen = $consulta1->fetch();
    $novedad['imagen'] = $imagen['ruta'];
    return $novedad;
  }

  function agregarNovedad($novedad){
    $consulta = $this->db->prepare('INSERT INTO novedad(novedad,fecha,cuerpo) VALUES(?,?,?)');
    $consulta->execute(array($novedad['novedad'],$novedad['fecha'],$novedad['cuerpo']));
  }

  function borrarNovedad($id_novedad){
    $consultaImg = $this->db->prepare('SELECT * FROM imagen WHERE fk_id_novedad=?');
    $consultaImg->execute(array($id_novedad));
    $imagenes = $consultaImg->fetchAll();
    foreach ($imagenes as $imagen) {
      unlink('../'.$imagen['ruta']);
    }
    $consulta = $this->db->prepare('DELETE FROM novedad WHERE id=?');
    $consulta->execute(array($id_novedad));
  }

  function agregarImagenes($id_novedad, $files){
    $rutas = $this->subirArchivosAJAX($files);
    $imagenes = $this->db->prepare('INSERT INTO imagen(ruta,fk_id_novedad) VALUES(?,?)');
    foreach ($rutas as $ruta) {
      $imagenes->execute(array($ruta,$id_novedad));
    }
  }

  function borrarImagen($id_novedad){
    $consulta = $this->db->prepare('DELETE FROM imagen WHERE fk_id_novedad=?');
    $consulta->execute(array($id_novedad));
  }

  function modificarNovedad($nov){
    $consulta = $this->db->prepare('UPDATE novedad SET novedad=?, fecha=?, cuerpo=? WHERE id=?');
    $consulta->execute(array($nov['novedad'],$nov['fecha'],$nov['cuerpo'],$nov['idnovedad']));
  }

  function getActividades(){
    $actividades = array();
    $consulta = $this->db->prepare("SELECT * FROM actividad");
    $consulta->execute();
    $actividades = $consulta->fetchAll();
    return $actividades;
  }

  function getActivities(){
    $activities = array();
    $consulta = $this->db->prepare("SELECT * FROM activity");
    $consulta->execute();
    $activities = $consulta->fetchAll();
    return $activities;
  }

  function getGaleria(){
    $galeria = array();
    $consulta = $this->db->prepare("SELECT * FROM galeria");
    $consulta->execute();
    $galeria = $consulta->fetchAll();
    return $galeria;
  }

  function getGaleriaDif($hostel){
    $galeria = array();
    $consulta = $this->db->prepare("SELECT * FROM galeria WHERE hostel=?");
    $consulta->execute(array($hostel));
    $galeria = $consulta->fetchAll();
    return $galeria;
  }

  function agregarActividad($actividad){
    $consulta = $this->db->prepare('INSERT INTO actividad(actividad,ruta) VALUES(?,?)');
    $consulta->execute(array($actividad['actividad'],$actividad['ruta']));
  }

  function borrarActividad($id_actividad){
    $consultaImg = $this->db->prepare('SELECT * FROM actividad WHERE id=?');
    $consultaImg->execute(array($id_actividad));
    $imagen = $consultaImg->fetch();
    unlink('../uploaded/imagenes/tarifas/'.$imagen['ruta']);
    $consulta = $this->db->prepare('DELETE FROM actividad WHERE id=?');
    $consulta->execute(array($id_actividad));
  }

  function agregarActivity($actividad){
    $consulta = $this->db->prepare('INSERT INTO activity(activity,cuerpo,ruta) VALUES(?,?,?)');
    $consulta->execute(array($actividad['activity'],$actividad['cuerpo'],$actividad['ruta']));
  }

  function borrarActivity($id_activity){
    $consultaImg = $this->db->prepare('SELECT * FROM activity WHERE id=?');
    $consultaImg->execute(array($id_activity));
    $imagen = $consultaImg->fetch();
    unlink('../uploaded/imagenes/actividades/'.$imagen['ruta']);
    $consulta = $this->db->prepare('DELETE FROM activity WHERE id=?');
    $consulta->execute(array($id_activity));
  }

  function agregarImagenActividad($archivo){
      $rutas = $this->subirImgAct($archivo);
  }

  function agregarImagenActivities($archivo){
      $rutas = $this->subirImgActy($archivo);
  }

  function borrarImgGaleria($idImgGaleria){
    $consultaImg = $this->db->prepare('SELECT * FROM galeria WHERE id=?');
    $consultaImg->execute(array($idImgGaleria));
    $imagen = $consultaImg->fetch();
    unlink('../'.$imagen['ruta']);
    $consulta = $this->db->prepare('DELETE FROM galeria WHERE id=?');
    $consulta->execute(array($idImgGaleria));
  }

  function agregarImagenGaleria($idhostel,$archivos){
      $rutas = $this->subirImgGal($archivos);
      $imagenes = $this->db->prepare('INSERT INTO galeria(hostel,ruta) VALUES(?,?)');
      foreach ($rutas as $ruta) {
        $imagenes->execute(array($idhostel, $ruta));
      }
  }

  function modificarBanner($archivo,$slide){
    $rutas = $this->modificarSlide($archivo,$slide);
  }

}
?>
