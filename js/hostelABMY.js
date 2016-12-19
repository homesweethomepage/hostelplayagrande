var imgActivity;

$("#activityToUpload").on("change",
  function(ev)
  {
    imgActivity = ev.target.files;
  }
);

function crearActivitiesHTML(activity) {
  $.ajax({ url: 'js/templates/activities.mst',
     success: function(template) {
       var rendered = Mustache.render(template,activity);
       $('#listaActivities').append(rendered);
      }
    });
}

function crearActivities(){
  $.ajax({
    method: 'GET',
    url:'api/activity',
    datatype: 'JSON',
    success: function(activities){
      $('#listaActivities').html('');
      activities.forEach(function(activity){
         var html = crearActivitiesHTML(activity);
        $('#listaActivities').append(html);
      });
    },
    error: function () {
      alert('Error al inicializar actividades');
    }
  });
}

function agregarActivity(activity){
  loadingOn();
  var ruta =  $('#activityToUpload')[0].files[0].name;
  activity = activity + '&ruta=' + ruta;
  $.ajax({
    method: 'POST',
    url:'api/activity',
    datatype: 'JSON',
    data: activity,
    success: function(){
      subirImgActivity();
      loadingOff();
    },
    error: function () {
      alert('Error al agregar actividad');
    }
  });
}

function borrarActivity(idactivity){
  loadingOn();
  $.ajax({
    method: 'DELETE',
    url:'api/activity/' + idactivity,
    datatype: 'JSON',
    success: function(){
      loadingOff();
    },
    error: function () {
      alert('Error al borrar actividad');
    }
  });
}

function subirImgActivity(imgaux){
  var imgaux = new FormData();
  $.each(imgActivity, function(key, value)
  {
    imgaux.append(key, value);
  });
  $.ajax({
    type: "POST",
    url: "index.php?action=agregar_imagen_activities",
    data: imgaux,
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

  crearActivities();

  $('body').on('click','a.js-borrar-activity', function(event){
    event.preventDefault();
    borrarActivity(this.getAttribute('idactivity'));
  });

  $('#js-refresh-activities').on('click', function(event){
    event.preventDefault();
    crearActivities();
  });

  $('#js-button-activities').on('click', function(event){
    event.preventDefault();
    var data = $("#submitActivity").serialize();
    agregarActivity(data);
  });

});
