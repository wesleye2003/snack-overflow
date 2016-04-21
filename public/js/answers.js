$(document).ready(function() {
	$('a.answer-link').on('click', function(e){
		e.preventDefault();
		var $url = $(this).attr('href');
		var request = $.get($url);
		request.done(function(){
			$('a.answer-link').hide();
			$('.answer-form').toggleClass('hidden');
		});
	});

	$('section').on('submit', '.answer-form', function(e){
		e.preventDefault();
		var $link = $(this).attr('action');
		var $body = $('textarea');
		var linkrequest = $.post($link, $body);
		linkrequest.done(function(data){
			$('.answer_section').prepend(data);
			$('a.answer-link').show();
			$('.answer-form').toggleClass('hidden');
		})
	});
});