$(document).ready(function() {
	var placesimg = [
		'../../images/history/1.jpg',
		'../../images/history/2.jpg',
		'../../images/history/3.jpg',
		'../../images/history/4.jpg',
		'../../images/history/5.jpg',
		'../../images/history/6.jpg',
		'../../images/history/7.jpg',
		'../../images/history/8.jpg',
		'../../images/history/9.jpg'
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