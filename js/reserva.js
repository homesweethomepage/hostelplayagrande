var checkIn= new Date();
var checkOut = new Date(new Date().getTime() + 24 * 60 * 60 * 1000);
var checkInHTML = checkIn;
var checkOutHTML = checkOut;
//var endAnimate = "webkitAnimationEnd mozAnimationEnd oAnimationEnd animationEnd";


function inicializarFecha(){
  document.getElementById("fecha-check-in").innerHTML = checkInHTML.getDate();
  document.getElementById("fecha-check-out").innerHTML = checkOutHTML.getDate();
  $("#dia-check-in").html(parsearDia(checkInHTML.getDay()));
  $("#dia-check-out").html(parsearDia(checkOutHTML.getDay()));
  $("#mes-check-in").html(parsearMes(checkInHTML.getMonth()));
  $("#mes-check-out").html(parsearMes(checkOutHTML.getMonth()));
}

function parsearDia(num){
  switch (num) {
    case 0:
    return "dom"
    break;
    case 1:
    return "lun"
    break;
    case 2:
    return "mar"
    break;
    case 3:
    return "mie"
    break;
    case 4:
    return "jue"
    break;
    case 5:
    return "vie"
    break;
    case 6:
    return "sab"
    break;
    default:
  }
}

function parsearMes(mes){
  switch (mes) {
    case 0:
    return "ene"
    break;
    case 1:
    return "feb"
    break;
    case 2:
    return "mar"
    break;
    case 3:
    return "abr"
    break;
    case 4:
    return "may"
    break;
    case 5:
    return "jun"
    break;
    case 6:
    return "jul"
    break;
    case 7:
    return "ago"
    break;
    case 8:
    return "sep"
    break;
    case 9:
    return "oct"
    break;
    case 10:
    return "nov"
    break;
    case 11:
    return "dic"
    break;
    default:
  }
}

function formatoCalendario(){
  $("#input-fecha-check-in").datepicker({
    inline: true,
    showOtherMonths: true,
    dayNamesMin: ['Dom', 'Lun', 'Mar', 'Mie', 'Jue', 'Vie', 'Sab']
  });
  $("#input-fecha-check-out").datepicker({
    inline: true,
    showOtherMonths: true,
    dayNamesMin: ['Dom', 'Lun', 'Mar', 'Mie', 'Jue', 'Vie', 'Sab']
  });
}

function parseDateToMail(){
  checkIn = ((checkIn.getMonth()+1) + "/" + checkIn.getDate() + "/" + checkIn.getFullYear());
  checkOut = ((checkOut.getMonth()+1) + "/" + checkOut.getDate() + "/" + checkOut.getFullYear());
}

$("#input-fecha-check-in" ).change(function() {
  checkIn = $("#input-fecha-check-in").datepicker("getDate");
  checkInHTML = checkIn;
  inicializarFecha();
});

$("#input-fecha-check-out" ).change(function() {
  checkOut = $("#input-fecha-check-out").datepicker("getDate");
  checkOutHTML = checkOut;
  inicializarFecha();
});

$("#boton-reserva").click(function(event) {
    event.preventDefault();
    var form = event.target;
    var nombre = "";
    var apellido = "";
    var mail = "";
    var male = "";
    var female = "";
    var hostel = "";
    var room = "";
    var nombre = $("#first_name").val();
    var apellido = $("#last_name").val();
    var mail = $("#email").val();
    var male = $("#male").val();
    var female = $("#female").val();
    var hostel = $("#hostel").val();
    var room = $("#room").val();
    if(nombre!=""&&apellido!=""&&mail!=""&&male!=""&&female!=""&&hostel!=""&&room!=""){
      var data = {
        "first_name": nombre,
        "last_name": apellido,
        "email": mail,
        "male": male,
        "female": female,
        "hostel": hostel,
        "room": room,
        "checkIn": checkIn,
        "checkOut": checkOut
      };
      $.ajax({
          type: "POST",
          url: "reserva.php",
          data: data,
          success: function(){
            botonConsulta('Consulta Enviada <br> Exitosamente!','btnSuccess');
          },
          error:function () {
            botonConsulta('Error en servidor! <br> Consulta no Enviada','btnError');
          }
      });
    }
    else {
      botonConsulta('Completar <br> todos los campos!','btnWarning');
    }
});

function botonConsulta(mensaje,clase){
	var $span = $(".box-botton span");
	$(".box-botton").addClass('flipOutX').one(endAnimate, function(){
		$span.html(mensaje);
		$(".box-botton").addClass(clase);
		$(".box-botton").removeClass('flipOutX');
		$(".box-botton").addClass('flipInX').one(endAnimate, function(){
      $(".box-botton").removeClass('flipInX');
      setTimeout(function () {
        botonConsultaDefault(clase);
      },3000);
		})
	})
};

function botonConsultaDefault(clase){
  var $span = $(".box-botton span");
	$(".box-botton").addClass('flipOutX').one(endAnimate, function(){
		$span.html("Consultar <br> Disponibilidad");
		$(".box-botton").removeClass(clase);
		$(".box-botton").removeClass('flipOutX');
		$(".box-botton").addClass('flipInX').one(endAnimate, function(){
      $(".box-botton").removeClass('flipInX');
    })
	})
}

$(document).ready(function(){
  inicializarFecha();
  formatoCalendario();
  parseDateToMail();
});
