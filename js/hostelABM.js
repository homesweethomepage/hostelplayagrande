var archivos;

$("#imagesToUpload").on("change",
  function(ev)
  {
    archivos = ev.target.files;
  }
);

function crearNovedadHTML(novedad) {
  $.ajax({ url: 'js/templates/novedades.mst',
     success: function(template) {
       var rendered = Mustache.render(template,novedad);
       $('#listaNovedades').append(rendered);
      }
    });
}

function crearNovedades(){
  $.ajax({
    method: 'GET',
    url:'api/novedad',
    datatype: 'JSON',
    success: function(novedades){
      $('#listaNovedades').html('');
      novedades.forEach(function(novedad){
         var html = crearNovedadHTML(novedad);
        $('#listaNovedades').append(html);
      });
    },
    error: function () {
      alert('Error al crear la novedad');
    }
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

function agregarNovedad(novedad){
  loadingOn();
  $.ajax({
    method: 'POST',
    url:'api/novedad',
    datatype: 'JSON',
    data: novedad,
    success: function(){
      getLastId();
      loadingOff();
    },
    error: function () {
      alert('Error al agregar la novedad');
    }
  });
}

function borrarNovedad(idnovedad){
  loadingOn();
  $.ajax({
    method: 'DELETE',
    url:'api/novedad/' + idnovedad,
    datatype: 'JSON',
    success: function(){
      loadingOff();
    },
    error: function () {
      alert('Error al borrar la novedad');
    }
  });
}

function modificarNovedad(idnovedad,novedad,cuerpo){
  loadingOn();
  $.ajax({
    method: 'PUT',
    url:'api/novedad/' + idnovedad + '/' + novedad + '/' + cuerpo,
    datatype: 'JSON',
    success: function(){
      loadingOff();
    },
    error: function () {
      alert('Error al modificar la novedad');
    }
  });
}

function getLastId(){
  var lastId;
  $.ajax({
  method: 'GET',
  url:'api/novedad',
  datatype: 'JSON',
  success: function(novedades){
    lastId = novedades[novedades.length-1]['id'];
    crearImagen(lastId);
  },
  error: function () {
    alert('Error al crear la imagen');
  }
  });
}

function crearImagen(lastId){
  var img = new FormData();
  $.each(archivos, function(key, value)
  {
    img.append(key, value);
  });
  $.ajax({
    type: "POST",
    url: "index.php?action=agregar_imagenes&id_novedad=" + lastId,
    data: img,
    cache: false,
    processData: false,
    contentType: false,
  });
}


$(document).ready(function(){

  crearNovedades();

  $('#js-refresh-novedades').on('click', function(event){
    event.preventDefault();
    crearNovedades();
  });

  $('#js-button-novedad').on('click', function(event){
    event.preventDefault();
    var data = $("#submitNovedad").serialize();
    agregarNovedad(data);
  });

  $('body').on('click','a.js-borrar-novedad', function(event){
    event.preventDefault();
    borrarNovedad(this.getAttribute('idnovedad'));
  });

});
