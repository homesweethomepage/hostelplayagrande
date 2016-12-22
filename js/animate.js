var w;
var $hostelSection = $('#hostels');
var $serviceSection = $('#services');
var $locationSection = $('#location');
var $actividadSection = $('#activities');
var $tarifaSection = $('#tarifas');
var $newsSection = $('#news');
var $contactSection = $('#contacts');
var arrSections = [$hostelSection, $serviceSection, $locationSection, $actividadSection, $tarifaSection, $newsSection, $contactSection];
var $boxReserva = $('.box-reserva');
var $boxService = $('.box-servicios');
var $locationLeft = $('.ubicacionLeft');
var $locationRight = $('.ubicacionRight');
const classAnimateReservaDown = "slideInDown";
const classAnimateReservaUp = "slideOutUp";
const noneDisplay = "none-display";
var clickReserva = false;
var inAnimateReserva = true;
var inAnimateHostel = false;
var inTransition = false;
//var endAnimate = "webkitAnimationEnd mozAnimationEnd oAnimationEnd animationEnd";
const responsiveWidth = 768;
const activeHostel = 'descripcion-activa';
var $btnHostel = $(".box-hostel-titulo");
var $imgHostel = $("#img-descripcion");
const urlImgHostel = {playagrande: 'images/descripciones/Playa Grande.jpg', austral: 'images/descripciones/Austral.jpg', suites: 'images/descripciones/Suites.jpg'}
var animateClose = 'outUp';
var animateOpen = 'inDown';

function AnimateReserva(classAnimate, hasDisplay) {
	inAnimateReserva = true;
	if (hasDisplay) {
		$boxReserva.removeClass(noneDisplay);
		$boxReserva.addClass(classAnimate).one(endAnimate, function(){
			$(this).removeClass(classAnimate);
			inAnimateReserva = false;
		});
	} else {
		$boxReserva.addClass(classAnimate).one(endAnimate, function(){
			$(this).removeClass(classAnimate);
			$(this).addClass(noneDisplay);
			inAnimateReserva = false;
		});
	};
}

function AnimateService(scrollPos) {
	$boxService.each(function (i){
		if (scrollPos >= $(this).position().top - 450) {
			if (i%2 == 0) {
				$(this).addClass('bounceInRight');
			} else {
				$(this).addClass('bounceInLeft');
			};
			$(this).removeClass(noneDisplay);
		};
	});
}

function AnimateLocation(scrollPos) {
	if (scrollPos >= $locationLeft.position().top - 450) {
		$locationLeft.addClass('bounceInLeft');
		$locationLeft.removeClass(noneDisplay);
	};
	if (scrollPos >= $locationRight.position().top - 450) {
		$locationRight.addClass('bounceInRight');
		$locationRight.removeClass(noneDisplay);
	};
}

function ActiveNav(scrollPos) {
	for (var i = 0; i < arrSections.length; i++) {
		var sectionTop = arrSections[i].position().top - 80;
		var sectionBottom = arrSections[i].position().top + arrSections[i].outerHeight(true) - 80;
		var sectionId = arrSections[i].attr('id');
		var li_href = $('a[href="#'+sectionId+'"]').parent();
		if ((sectionTop <= scrollPos) && (scrollPos <= sectionBottom)){
			li_href.addClass('active');
		} else {
			li_href.removeClass('active');
		};
	};
}

function TransitionNav(target) {
	inTransition = true;
	$('html, body').animate({
		scrollTop: target.offset().top
	}, 1500, function (){
		inTransition = false;
	});
}

$(document).ready(function () {
	w = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
	var scrollPos = $(this).scrollTop();
	console.log(scrollPos);

	if (w >= responsiveWidth) {
		var hasDisplay = $boxReserva.hasClass(noneDisplay);
		AnimateReserva(classAnimateReservaDown, hasDisplay);
	} else {
		$boxReserva.removeClass(noneDisplay);
	};

	AnimateService(scrollPos);
	AnimateLocation(scrollPos);

	ActiveNav(scrollPos);
});

$(document).on('scroll', function () {
	w = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
	var scrollPos = $(this).scrollTop();

	if (w >= responsiveWidth && !inAnimateReserva) {
		var $mC = $('#mainCarousel');
		var bottomC = $mC.position().top + $mC.offset().top + $mC.outerHeight(true);

		if (scrollPos >= bottomC - 250) {
			var hasDisplay = $boxReserva.hasClass(noneDisplay);
			if (!hasDisplay && !clickReserva) {
				AnimateReserva(classAnimateReservaUp, hasDisplay);
			};
		};
	};

	AnimateService(scrollPos);
	AnimateLocation(scrollPos);

	ActiveNav(scrollPos);
});

$('.btn-reserva').on('click', function () {
	w = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;

	if (w >= responsiveWidth){
		if (!inAnimateReserva) {
			var hasDisplay = $boxReserva.hasClass(noneDisplay);
			clickReserva = true;
			if (hasDisplay) {
				AnimateReserva(classAnimateReservaDown, hasDisplay);
			} else {
				AnimateReserva(classAnimateReservaUp, hasDisplay);
			};
		}
	} else {
		if (!inTransition) {
			TransitionNav($boxReserva);
		};
	};
})

$(".anchor-link a").on("click", function (e){
	e.preventDefault();
	if (!inTransition) {
		var target = $(this.hash);
		TransitionNav(target);
	};
})

$("#logo a").on("click", function (e){
	e.preventDefault();
	if (!inTransition) {
		var target = $('html, body');
		TransitionNav(target);
	};
})

$btnHostel.on('click', function (){

	if (!inAnimateHostel) {
		var $boxDescription = $(this).children('.box-descripcion');
		var $hostelIcon = $(this).children('.box-titulo').children('h3').children('i');
		var $hostelLetter = $(this).children('.box-titulo').children('h3').html()[0];
		var $thisHostel = $(this);
		if(!$(this).hasClass(activeHostel)){
			inAnimateHostel = true;
			var $boxDescriptionActive = $('.box-hostel-titulo.descripcion-activa').children('.box-descripcion');
			var $hostelIconActive = $('.box-hostel-titulo.descripcion-activa').children('.box-titulo').children('h3').children('i');
			var $thisHostelActive = $('.box-hostel-titulo.descripcion-activa');
			$boxDescriptionActive.addClass(animateClose).one(endAnimate, function () {
				$thisHostelActive.removeClass(activeHostel);
				$hostelIconActive.removeClass("fa-minus").addClass("fa-plus");
				$(this).removeClass(animateClose);
				$boxDescription.addClass(animateOpen).one(endAnimate, function () {
					$thisHostel.addClass(activeHostel);
					$hostelIcon.removeClass("fa-plus").addClass("fa-minus");
					$(this).removeClass(animateOpen);
					inAnimateHostel = false;
				});
			});
			if($hostelLetter == "P"){
				$imgHostel.addClass('fadeOut').one(endAnimate, function () {
					$(this).attr("src", urlImgHostel.playagrande);
					$(this).removeClass('fadeOut');
					$(this).addClass('fadeIn').one(endAnimate, function () {
						$(this).removeClass('fadeIn');
					})
				})
			} else if($hostelLetter == "A") {
				$imgHostel.addClass('fadeOut').one(endAnimate, function () {
					$(this).attr("src", urlImgHostel.austral);
					$(this).removeClass('fadeOut');
					$(this).addClass('fadeIn').one(endAnimate, function () {
						$(this).removeClass('fadeIn');
					})
				})
			} else {
				$imgHostel.addClass('fadeOut').one(endAnimate, function () {
					$(this).attr("src", urlImgHostel.suites);
					$(this).removeClass('fadeOut');
					$(this).addClass('fadeIn').one(endAnimate, function () {
						$(this).removeClass('fadeIn');
					})
				})
			}
		}
	};
});
