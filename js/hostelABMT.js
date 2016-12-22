var imagen = null;

$("#actividadToUpload").on("change",
  function(ev)
  {
    imagen = ev.target.files;
  }
);

function crearActividadesHTML(actividad) {
  $.ajax({ url: 'js/templates/tarifas.mst',
     success: function(template) {
       var rendered = Mustache.render(template,actividad);
       $('#listaActividades').append(rendered);
      }
    });
}

function crearActividades(){
  $.ajax({
    method: 'GET',
    url:'api/actividad',
    datatype: 'JSON',
    success: function(actividades){
      $('#listaActividades').html('');
      actividades.forEach(function(actividad){
         var html = crearActividadesHTML(actividad);
        $('#listaActividades').append(html);
      });
    },
    error: function () {
      alert('Error');
    }
  });
}

function agregarActividad(actividad){
  loadingOn();
  if(imagen!=null){
    var ruta =  $('#actividadToUpload')[0].files[0].name;
    actividad = actividad + '&ruta=' + ruta;
    $.ajax({
      method: 'POST',
      url:'api/actividad',
      datatype: 'JSON',
      data: actividad,
      success: function(){
        subirImgActividad();
        loadingOff();
      },
      error: function () {
        alert('Error');
      }
    });
  }
  else {
    loadingOff();
    $("#abm-info-message").removeClass("hidden");
  }
}

function borrarActividad(idactividad,padre){
  loadingOn();
  $.ajax({
    method: 'DELETE',
    url:'api/actividad/' + idactividad,
    datatype: 'JSON',
    success: function(){
      loadingOff();
      padre.css( "opacity", "0.3" );
    },
    error: function () {
      alert('Error');
    }
  });
}

function subirImgActividad(img){
  var img = new FormData();
  $.each(imagen, function(key, value)
  {
    img.append(key, value);
  });
  $.ajax({
    type: "POST",
    url: "index.php?action=agregar_imagen_actividad",
    data: img,
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

  crearActividades();

  $('body').on('click','a.js-borrar-actividad', function(event){
    event.preventDefault();
    borrarActividad(this.getAttribute('idactividad'),$(this).parent().parent().parent());
  });

  $('#js-refresh-actividades').on('click', function(event){
    event.preventDefault();
    crearActividades();
  });

  $('#js-button-actividad').on('click', function(event){
    event.preventDefault();
    var data = $("#submitActividad").serialize();
    agregarActividad(data);
  });

});
