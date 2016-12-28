const paddingImg = 15;
const paddingContainer = 0;
const xl = {width: 1200, container: 1170, gril: 3};
const lg = {width: 992, container: 970, gril: 3};
const md = {width: 768, container: 750, gril: 2};
const sm = {width: 576, container: 576, gril: 2};
const xs = {width: 0, container: 0, gril: 1};
var $arrowLeft = $('.arrowleft a');
var $arrowRight = $('.arrowright a');
var $linkTodos = $('#js-galeria-todos');
var $linkHPG = $('#js-galeria-hpg');
var $linkHPGA = $('#js-galeria-hpga');
var $linkHPGS = $('#js-galeria-hpgs');
var imagenesGaleria = [];
var imagenesHPG = [];
var imagenesHPGA = [];
var imagenesHPGS = [];
var imgWidth;
var enAnimacion = false;
var enTransicion = false;

function calcContainerWidth(width) {
	var widthPadding = paddingContainer * 2;
	var widthArrow = 50 * 2;
	return width - widthPadding - widthArrow;
}

function calcImgWidth(containerWidth, imgShow) {
	var widthPadding = paddingImg * 2;
	return (containerWidth / imgShow) - widthPadding;
}

function getRatio(width) {
	return 3 * width / 4;
}

function setCarousels(){
	var w = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
	var wbody = $('body').width();
	var containerWidth;


	if (w >= xl.width) {
		containerWidth = calcContainerWidth(xl.container);
		imgWidth = calcImgWidth(containerWidth, xl.gril);
		setCarousel(containerWidth, imgWidth);
	} else if (w >= lg.width) {
		containerWidth = calcContainerWidth(lg.container);
		imgWidth = calcImgWidth(containerWidth, lg.gril);
		setCarousel(containerWidth, imgWidth);
	} else if (w >= md.width) {
		containerWidth = calcContainerWidth(md.container);
		imgWidth = calcImgWidth(containerWidth, md.gril);
		setCarousel(containerWidth, imgWidth);
	} else if (w >= sm.width) {
		containerWidth = calcContainerWidth(wbody);
		imgWidth = calcImgWidth(containerWidth, sm.gril);
		setCarousel(containerWidth, imgWidth);
	} else {
		containerWidth = calcContainerWidth(wbody);
		imgWidth = calcImgWidth(containerWidth, xs.gril);
		setCarousel(containerWidth, imgWidth);
	};
}

function setCarousel(container, img) {
	$('.imgCarousel').width(container);
	$('.imgCarousel').height(getRatio(img));
	$('.arrowright').height(getRatio(img));
	$('.arrowleft').height(getRatio(img));
	$('.arrowright a').css({'line-height': getRatio(img) + 'px'});
	$('.arrowleft a').css({'line-height': getRatio(img) + 'px'});
	$('.containerCarousel').css({'left': -img - (paddingImg * 2)});
	$('.containerCarousel li').width(img);
	$('#galeryAnimation').addClass('inDown2').one(endAnimate, function () {
		$(this).addClass('yesHeight');
		$(this).removeClass('noHeight');
		$(this).removeClass('inDown2');
		enTransicion = false;
	});
}

function frontCrearGaleriaHTML(galeria) {
  $.ajax({ url: "js/templates/front-galeria.mst",
     success: function(template) {
       var rendered = Mustache.render(template,galeria);
       $('#carousel-galeria').append(rendered);
      }
    });
}

function inicGaleria(){
	enTransicion = true;
  $.ajax({
    method: 'GET',
    url:'api/galeria',
    datatype: 'JSON',
    success: function(galeria){
      imagenesGaleria = galeria;
      $('#carousel-galeria').children().remove();
			imagenesGaleria.forEach(function(gal){
				if(gal['hostel'] == "Hostel Playa Grande"){
					imagenesHPG.push(gal);
				}
				else if(gal['hostel'] == "Hostel Playa Grande Austral"){
					imagenesHPGA.push(gal);
				}
				else {
					imagenesHPGS.push(gal);
				};
	      var html = frontCrearGaleriaHTML(gal);
	      $('#carousel-galeria').append(html);
			});
			setTimeout(setCarousels,2000);
    }
  });
}

function closeGalery (imagenes) {
	enTransicion = true;
	$('#galeryAnimation').addClass('outUp2').one(endAnimate, function () {
		$(this).addClass('noHeight');
		$(this).removeClass('yesHeight');
		$(this).removeClass('outUp2');
		frontCrearGaleria(imagenes);
	})
}

function frontCrearGaleria(imagenes){
  $('#carousel-galeria').children().remove();
	imagenes.forEach(function(gal){
		var html = frontCrearGaleriaHTML(gal);
	  $('#carousel-galeria').append(html);
	});
	setTimeout(setCarousels,2000);
}

function changeActive(activo){
	$(".titulo-galery").find("a").removeClass("active");
	activo.find("a").addClass("active");
}

$(document).ready(function () {

	inicGaleria();

	$arrowLeft.on('click', function (e) {
		e.preventDefault();
		if (!enAnimacion) {
			enAnimacion = true;
			var left_indent = parseInt($('.containerCarousel').css('left')) + imgWidth + (paddingImg * 2);

			$('.containerCarousel').animate({'left' : left_indent},
											{queue:false, duration:500, complete: function(){
		        									$('.containerCarousel li:first').before($('.containerCarousel li:last'));
		        									$('.containerCarousel').css({'left' : -imgWidth - (paddingImg * 2)});
		        									enAnimacion = false;
	        									}
	        								});
		};
	});

	$arrowRight.on('click', function (e) {
		e.preventDefault();
		if (!enAnimacion) {
			enAnimacion = true;
			var left_indent = parseInt($('.containerCarousel').css('left')) - imgWidth - (paddingImg * 2);

			$('.containerCarousel').animate({'left' : left_indent},
											{queue:false, duration:500, complete: function(){
		        									$('.containerCarousel li:last').after($('.containerCarousel li:first'));
		        									$('.containerCarousel').css({'left' : -imgWidth - (paddingImg * 2)});
		        									enAnimacion = false;
	        									}
	        								});
		};
	});

	$linkTodos.on('click', function(e){
		e.preventDefault();
		if (!enTransicion) {
			closeGalery(imagenesGaleria);
			changeActive($(this));
		};
	});

	$linkHPG.on('click', function(e){
		e.preventDefault();
		if (!enTransicion) {
			closeGalery(imagenesHPG);
			changeActive($(this));
		};
	});

	$linkHPGA.on('click', function(e){
		e.preventDefault();
		if (!enTransicion) {
			closeGalery(imagenesHPGA);
			changeActive($(this));
		};
	});

	$linkHPGS.on('click', function(e){
		e.preventDefault();
		if (!enTransicion) {
			closeGalery(imagenesHPGS);
			changeActive($(this));
		};
	});

});
