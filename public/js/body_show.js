$(document).ready(function() {
  $('.post').on('mouseover', '.question-title', function(){
    var body = $(this).parent().find('.qbody');
    console.log(body)
    body.toggleClass('hidden');
  }).on('mouseout', '.question-title', function(){
    var body = $(this).parent().find('.qbody');
    body.toggleClass('hidden');
  });

});
