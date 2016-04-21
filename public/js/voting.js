$(document).ready(function() {
  $('.qpage').on('submit', 'form.question-up', function(e){
  	e.preventDefault();
  	var $url = $(this).attr('action');
  	var request = $.post($url, function(point_data){
      $("span#q"+point_data['data_id']).text(point_data['point_value']);
    });
    request.fail(function(){
      alert("You must be logged in to do that.")
    });
  });

  $('.qpage').on('submit', 'form.question-down', function(e){
  	e.preventDefault();
  	var $url = $(this).attr('action');
  	var request = $.post($url, function(point_data){
      $("span#q"+point_data['data_id']).text(point_data['point_value']);
    });
    request.fail(function(){
      alert("You must be logged in to do that.")
    });
  });

  $('.answer_section').on('submit', 'form.answer-up', function(e){
  	e.preventDefault();
  	var $url = $(this).attr('action');
  	var request = $.post($url, function(point_data){
  		$("span#"+point_data['data_id']).text(point_data['point_value']);
  	});
    request.fail(function(){
      alert("You must be logged in to do that.")
    });
  });

  $('.answer_section').on('submit', 'form.answer-down', function(e){
  	e.preventDefault();
  	var $url = $(this).attr('action');
  	var request = $.post($url, function(point_data){
  		$("span#"+point_data['data_id']).text(point_data['point_value'])
  	});
    request.fail(function(){
      alert("You must be logged in to do that.")
    });
  });
});