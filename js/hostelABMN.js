
function modificarNovedad(novedad){
  loadingOn();
  $.ajax({
    method: 'POST',
    url:'api/novedad',
    datatype: 'JSON',
    data: novedad,
    success: function(){
      loadingOff();
      setTimeout(function(){window.location.href = 'http://localhost/proyectos/hostel/index.php?action=admin_hostel';},1000);
    },
    error: function () {
      alert('Error al modificar novedad');
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


$(document).ready(function(){

  var title = $('#tituloHidden');
  $('#novedad').html(title);

  $('#js-btn-modificar-novedad').on('click', function(event){
    event.preventDefault();
    var mod = $("#modNovedad").serialize();
    debugger;
    mod = mod+"&modificar=1";
    debugger;
    modificarNovedad(mod);
  });


});
