const paddingImg = 15;
const paddingContainer = 0;
const xl = {width: 1200, container: 1170, gril: 3};
const lg = {width: 992, container: 970, gril: 3};
const md = {width: 768, container: 750, gril: 2};
const sm = {width: 576, container: 576, gril: 2};
const xs = {width: 0, container: 0, gril: 1};
var $arrowLeft = $('.arrowleft a');
var $arrowRight = $('.arrowright a');
var imagenesGaleria = [];
var imgWidth;
var enAnimacion = false;

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
  $.ajax({
    method: 'GET',
    url:'api/galeria',
    datatype: 'JSON',
    success: function(galeria){
      imagenesGaleria = galeria;
      $('#carousel-galeria').children().remove();
			imagenesGaleria.forEach(function(gal){
	      var html = frontCrearGaleriaHTML(gal);
	      $('#carousel-galeria').append(html);
			});
			setCarousels();
			setTimeout(setCarousels,2000);
    }
  });
}

function frontCrearGaleria(instr){
  $('#carousel-galeria').children().remove();
  var html = frontCrearGaleriaHTML(imagenesGaleria);
  $('#carousel-galeria').append(html);
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
});

//$(document).ready(function() {
//    //move the last list item before the first item. The purpose of this is if the user clicks previous he will be able to see the last item.
//    $('#carousel_ul li:first').before($('#carousel_ul li:last'));
//
//    //when user clicks the image for sliding right
//    $('#right_scroll img').click(function(){
//
//       //get the width of the items ( i like making the jquery part dynamic, so if you change the width in the css you won't have o change it here too ) '
//       var item_width = $('#carousel_ul li').outerWidth() + 10;
//
//        //calculate the new left indent of the unordered list
//        var left_indent = parseInt($('#carousel_ul').css('left')) - item_width;
//
//        //make the sliding effect using jquery's anumate function '
//        $('#carousel_ul').animate({'left' : left_indent},{queue:false, duration:500},function(){
//
//            //get the first list item and put it after the last list item (that's how the infinite effects is made) '
//            $('#carousel_ul li:last').after($('#carousel_ul li:first'));
//
//            //and get the left indent to the default -210px
//            $('#carousel_ul').css({'left' : '-210px'});
//        });
//    });
//
//    //when user clicks the image for sliding left
//    $('#left_scroll img').click(function(){
//
//        var item_width = $('#carousel_ul li').outerWidth() + 10;
//
//        /* same as for sliding right except that it's current left indent + the item width (for the sliding right it's - item_width) */
//        var left_indent = parseInt($('#carousel_ul').css('left')) + item_width;
//
//        $('#carousel_ul').animate({'left' : left_indent},{queue:false, duration:500},function(){
//
//        /* when sliding to left we are moving the last item before the first item */
//        $('#carousel_ul li:first').before($('#carousel_ul li:last'));
//
//        /* and again, when we make that change we are setting the left indent of our unordered list to the default -210px */
//        $('#carousel_ul').css({'left' : '-210px'});
//        });
//
//    });
//});
