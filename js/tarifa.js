$(document).ready(function () {
	var a = $('.tarifa').height();
	console.log(a);
	$('.carousel-control').css({'line-height': a + 'px'});
})