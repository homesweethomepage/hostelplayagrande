var slide = null;

$("#slideToUpload").on("change",
  function(ev)
  {
    slide = ev.target.files;
  }
);

function loadingOn(){
  $("#loading-image")
      .removeClass("hidden");
}

function loadingOff(){
  $("#loading-image")
      .addClass("hidden");
}

function modificarSlide(numero){
  loadingOn();
  if(slide!=null){
    var sli = new FormData();
    $.each(slide, function(key, value)
    {
      sli.append(key, value);
    });
    $.ajax({
      type: "POST",
      url: "index.php?action=modificar_banner&slide=" + numero,
      data: sli,
      cache: false,
      processData: false,
      contentType: false,
      success: function(){
        loadingOff();
      }
    });
  }
  else {
    loadingOff();
    $("#abm-info-message").removeClass("hidden");
  }
}

$(document).ready(function(){

  $('#js-button-banner').on('click', function(event){
    event.preventDefault();
    var form = $('#submitBanner').serializeArray();
    modificarSlide(form[0].value);
  });

});
