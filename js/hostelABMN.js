var archivosMod;

$("#imagesToUpload").on("change",
  function(ev)
  {
    archivosMod = ev.target.files;
  }
);

function modificarNovedad(idnovedad,novedad,cuerpo){
  loadingOn();
  $.ajax({
    method: 'PUT',
    url:'api/novedad/' + idnovedad + '/' + novedad + '/' + cuerpo,
    datatype: 'JSON',
    success: function(){
      loadingOff();
      borrarImagen(idnovedad);
      crearImagen(idnovedad);
      setTimeout(function(){window.location.href = 'http://localhost/proyectos/hostel/index.php?action=admin_hostel';},2000);
    },
    error: function () {
      alert('Error al modificar novedad');
    }
  });
}

function borrarImagen(id){
  var img = new FormData();
  $.each(archivosMod, function(key, value)
  {
    img.append(key, value);
  });
  $.ajax({
    type: "POST",
    url: "index.php?action=borrar_imagen&id_novedad=" + id,
    data: img,
    cache: false,
    processData: false,
    contentType: false,
  });
}

function crearImagen(lastId){
  var imgMod = new FormData();
  $.each(archivosMod, function(key, value)
  {
    imgMod.append(key, value);
  });
  $.ajax({
    type: "POST",
    url: "index.php?action=agregar_imagenes&id_novedad=" + lastId,
    data: imgMod,
    cache: false,
    processData: false,
    contentType: false,
  });
}

function loadingOn(){
  $("#loading-image")
      .removeClass("hidden");
}

function loadingOff(){
  $("#loading-image")
      .addClass("hidden");
}


$(document).ready(function(){

  var title = $('#tituloHidden');
  $('#novedad').html(title);

  $('#js-btn-modificar-novedad').on('click', function(event){
    event.preventDefault();
    var mod = $("#modNovedad").serializeArray();
    modificarNovedad(mod[2].value,mod[0].value,mod[1].value);
  });


});
