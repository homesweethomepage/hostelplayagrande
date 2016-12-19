var ultimaNovedad = 0;
var arrayNovedades = [];

function frontCrearNovedadHTML(novedad,prev,nxt) {
  $.ajax({ url: "js/templates/front-novedades.mst",
     success: function(template) {
       var rendered = Mustache.render(template,novedad);
       $('#news').append(rendered);
       if(nxt==1){
        //  cambiar clase boton
       }
       if(prev==1){
        //  cambiar clase boton
       }
      }
    });
}

function inicNovedades(){
  $.ajax({
    method: 'GET',
    url:'api/novedad',
    datatype: 'JSON',
    success: function(novedades){
      arrayNovedades = novedades;
      console.log(novedades);
      $('#news').html('');
      var html = frontCrearNovedades(0);
      $('#news').append(html);
    }
  });
}

function frontCrearNovedades(instr){
  $('#news').html('');
  var index = ultimaNovedad+instr;
  var prev = 0;
  var nxt = 0;
  if(index<arrayNovedades.length-1){
    nxt = 1;
  }
  if(index>0){
    prev = 1;
  }
  ultimaNovedad = index;
  var html = frontCrearNovedadHTML(arrayNovedades[index],prev,nxt);
  $('#news').append(html);
}

$(document).ready(function(){

  inicNovedades();

  $('#nov-prev').on('click', function(event){
    event.preventDefault();
    frontCrearNovedades(-1);
  });

  $('#nov-nxt').on('click', function(event){
    event.preventDefault();
    frontCrearNovedades(1);
  });

});
