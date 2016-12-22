var gal = null;
var lastID;

$("#imgGaleriaToUpload").on("change",
  function(ev)
  {
    gal = ev.target.files;
  }
);

function crearGaleriaHTML(imgGaleria) {
  $.ajax({ url: 'js/templates/galeria.mst',
     success: function(template) {
       var rendered = Mustache.render(template,imgGaleria);
       $('#listaGaleria').append(rendered);
      }
    });
}

function crearGaleria(){
  $.ajax({
    method: 'GET',
    url:'api/galeria',
    datatype: 'JSON',
    success: function(galeria){
      $('#listaGaleria').html('');
      galeria.forEach(function(imgGaleria){
         var html = crearGaleriaHTML(imgGaleria);
        $('#listaGaleria').append(html);
      });
    },
    error: function () {
      alert('Error');
    }
  });
}

function borrarImgGaleria(idImgGaleria,padre){
  loadingOn();
  $.ajax({
    method: 'DELETE',
    url:'api/galeria/' + idImgGaleria,
    datatype: 'JSON',
    success: function(){
      loadingOff();
      padre.css( "opacity", "0.3" );
    },
    error: function () {
      alert('Error al borrar la imagen');
    }
  });
}

function subirImgGaleria(){
  loadingOn();
  if(gal!=null){
    var img = new FormData();
    $.each(gal, function(key, value)
    {
      img.append(key, value);
    });
    $.ajax({
      type: "POST",
      url: "index.php?action=agregar_imagen_galeria&id_hostel=" + lastID,
      data: img,
      cache: false,
      processData: false,
      contentType: false,
      success: function(){
        loadingOff();
      },
      error: function () {
        alert('Error al subir imagenes a la galeria');
      }
    });
  }
  else {
    loadingOff();
    $("#abm-info-message").removeClass("hidden");
  }
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

  crearGaleria();

  $('body').on('click','a.js-borrar-imgGaleria', function(event){
    event.preventDefault();
    borrarImgGaleria(this.getAttribute('idImgGaleria'),($(this).parent().parent().parent()));
  });

  $('#js-refresh-galeria').on('click', function(event){
    event.preventDefault();
    crearGaleria();
  });

  $('#js-button-galeria').on('click', function(event){
    event.preventDefault();
    var data = $("#submitImgGaleria").serializeArray();
    lastID = data[0].value;
    subirImgGaleria();
  });

});
