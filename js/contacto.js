$("#boton-comentario").click(function(event) {
    event.preventDefault();
    var form = event.target;
    var nombre = "";
    var mail = "";
    var asunto = "";
    var comentario = "";
    nombre = $("#contacto-nombre").val();
    mail = $("#contacto-email").val();
    asunto = $("#contacto-asunto").val();
    comentario = $("#contacto-comentario").val();
    if(nombre!=""&&mail!=""&&asunto!=""&&comentario!=""){
      var data = {
        "nombre": nombre,
        "email": mail,
        "asunto": asunto,
        "comentario": comentario
      };
      $.ajax({
          type: "POST",
          url: "mail/contacto.php",
          data: data,
          success: function(){
            $("#contacto-error-message").addClass("hidden");
            $("#contacto-info-message").addClass("hidden");
            $("#contacto-success-message").removeClass("hidden");
          },
          error:function () {
            $("#contacto-success-message").addClass("hidden");
            $("#contacto-info-message").addClass("hidden");
            $("#contacto-error-message").removeClass("hidden");
          }
      });
    }
    else {
      $("#contacto-error-message").addClass("hidden");
      $("#contacto-success-message").addClass("hidden");
      $("#contacto-info-message").removeClass("hidden");
    }

});
