var ultimaNovedad = 0;
var arrayNovedades = [];

function frontCrearNovedadHTML(novedad,prev,nxt) {
  $.ajax({ url: "js/templates/front-novedades.mst",
     success: function(template) {
       var rendered = Mustache.render(template,novedad);
       $('#article-news').append(rendered);
       if(nxt==0){
        $("#nov-nxt").addClass("inactive");
       }
       else {
         $("#nov-nxt").removeClass("inactive");
       }
       if(prev==0){
        $("#nov-prev").addClass("inactive");
       }
       else {
         $("#nov-prev").removeClass("inactive");
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
      $('#article-news').children(':not(.pager)').remove();
      var html = frontCrearNovedades(0);
      $('#article-news').append(html);
    }
  });
}

function frontCrearNovedades(instr){
  $('#article-news').children(':not(.pager)').remove();
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
  var str = arrayNovedades[index].cuerpo;
  var regex = /(\r\n|\n|\r)/gm;
  str = str.replace(regex, "</p><p>");
  str = "<p>"+str+"</p>";
  arrayNovedades[index].cuerpo = str;
  var html = frontCrearNovedadHTML(arrayNovedades[index],prev,nxt);
  $('#article-news').append(html);
}

$(document).ready(function(){

  inicNovedades();

  $('#nov-prev').on('click', function(event){
    event.preventDefault();
    if(!$(this).hasClass("inactive")){
      frontCrearNovedades(-1);
    }
  });

  $('#nov-nxt').on('click', function(event){
    event.preventDefault();
    if(!$(this).hasClass("inactive")){
      frontCrearNovedades(1);
    }
  });

});
