$(document).ready(function() {
  $('.voting').on('submit', 'form.question-up', function(e){
  	e.preventDefault();
  	var $url = $(this).attr('action');
  	var request = $.post($url, function(point_data){
  		$('.q-points').text(point_data);
  	});
  });

  $('.voting').on('submit', 'form.question-down', function(e){
  	e.preventDefault();
  	var $url = $(this).attr('action');
  	var request = $.post($url, function(point_data){
  		$('.q-points').text(point_data);
  	});
  });

  $('.voting').on('submit', 'form.answer-up', function(e){
  	e.preventDefault();
  	var $url = $(this).attr('action');
  	var request = $.post($url, function(point_data){
  		$("span#"+point_data['data_id']).text(point_data['point_value']);
  	});
  });

  $('.voting').on('submit', 'form.answer-down', function(e){
  	e.preventDefault();
  	var $url = $(this).attr('action');
  	var request = $.post($url, function(point_data){
  		$("span#"+point_data['data_id']).text(point_data['point_value'])
  	});
  });
});