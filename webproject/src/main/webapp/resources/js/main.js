$(document).ready(function(){

	setInterval(() => {
		//$('img[name=banner]').slideToggle(slow, linear);
		$('img[name=banner]').animate({width:'toggle'},350);
	}, 2000);
	

});