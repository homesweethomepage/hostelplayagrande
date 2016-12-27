<?php
include_once 'config/config_app.php';
include_once 'controller/admin_controller.php';
include_once 'controller/display_controller.php';
include_once 'controller/login_controller.php';


if(!array_key_exists(ConfigApp::$ACTION, $_REQUEST) ||
$_REQUEST[ConfigApp::$ACTION] == ConfigApp::$ACTION_DEFAULT)
{
  $displayController = new DisplayController();
  $displayController->mostrarHome();
}
else {

  switch ($_REQUEST[ConfigApp::$ACTION]) {
    case ConfigApp::$ACTION_LOCATION:
      $displayController = new DisplayController();
      $displayController->mostrarLocacion();
      break;
    case ConfigApp::$ACTION_NEWS:
      $displayController = new DisplayController();
      $displayController->mostrarNoticias();
      break;
    case ConfigApp::$ACTION_GALLERY:
      $displayController = new DisplayController();
      $displayController->mostrarGaleria();
      break;
    case ConfigApp::$ACTION_CONTACT:
      $displayController = new DisplayController();
      $displayController->mostrarContacto();
      break;
    case ConfigApp::$ACTION_RESERVATIONS:
      $adminController = new AdminController();
      $adminController->mostrarReservations();
      break;
    case ConfigApp::$ACTION_ADMIN_HOSTEL:
      $adminController = new AdminController();
      $adminController->mostrarAdminHostel();
      break;
    case ConfigApp::$ACTION_AGREGAR_IMAGENES:
      $adminController = new AdminController();
      $adminController->agregarImagenes();
      break;
    case ConfigApp::$ACTION_ADMIN_NOVEDAD:
      $adminController = new AdminController();
      $adminController->mostrarAdminHostelNovedad();
      break;
    case ConfigApp::$ACTION_BORRAR_IMAGEN:
      $adminController = new AdminController();
      $adminController->borrarImagen();
      break;
    case ConfigApp::$ACTION_MODIFICAR_NOVEDAD:
      $adminController = new AdminController();
      $adminController->modificarNovedad();
      break;
    case ConfigApp::$ACTION_ADMIN_TARIFA:
      $adminController = new AdminController();
      $adminController->mostrarAdminHostelActividades();
      break;
    case ConfigApp::$ACTION_AGREGAR_IMAGEN_ACTIVIDAD:
      $adminController = new AdminController();
      $adminController->agregarImagenActividad();
      break;
    case ConfigApp::$ACTION_ADMIN_ACTIVIDADES:
      $adminController = new AdminController();
      $adminController->mostrarAdminHostelActivities();
      break;
    case ConfigApp::$ACTION_AGREGAR_IMAGEN_ACTIVITIES:
      $adminController = new AdminController();
      $adminController->agregarImagenActivities();
      break;
    case ConfigApp::$ACTION_AGREGAR_IMAGEN_GALERIA:
      $adminController = new AdminController();
      $adminController->agregarImagenGaleria();
      break;
    case ConfigApp::$ACTION_ADMIN_GALERIA:
      $adminController = new AdminController();
      $adminController->mostrarAdminHostelGaleria();
      break;
    case ConfigApp::$ACTION_ADMIN_BANNER:
      $adminController = new AdminController();
      $adminController->mostrarAdminHostelBanner();
      break;
    case ConfigApp::$ACTION_MODIFICAR_BANNER:
      $adminController = new AdminController();
      $adminController->modificarBanner();
      break;
    case ConfigApp::$ACTION_RESERVA:
      $displayController = new DisplayController();
      $displayController->mostrarReserva();
      break;
    case ConfigApp::$ACTION_LOGIN:
      $loginController = new LoginController();
      $loginController->login();
      break;
    case ConfigApp::$ACTION_LOGOUT:
      $loginController = new LoginController();
      $loginController->logout();
      break;
    default:
      echo 'Pagina no encontrada';
      break;
  }

}

?>
