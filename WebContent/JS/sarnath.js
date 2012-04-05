$(document).ready(function() {
	var placesimg = [
		'../../images/history/benaras.jpg',
		'../../images/history/malviyaji.jpeg',
		'../../images/history/ramnagar.gif',
		'../../images/history/sarnath.jpg'
	];

	var $cont = $('#sponsor-space img:first');
	var currIndex = -1;
	var numImages = placesimg.length;
	setTimeout(
	function changeImg() {
		currIndex = (currIndex+1) % numImages;
		$cont.fadeOut('fast', function() {
			$cont.attr('src', placesimg[currIndex])
			     .fadeIn('fast');
		});
		setTimeout(changeImg, 3000);
	}, 1500 );
});