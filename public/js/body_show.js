$(document).ready(function() {
  $('.post').on('mouseover', '.question-title', function(){
    var body = $(this).parent().find('.qbody');
    console.log(body)
    body.toggleClass('hidden');
  }).on('mouseout', '.question-title', function(){
    var body = $(this).parent().find('.qbody');
    body.toggleClass('hidden');
  });

  // $('#profile_name').mouseover(function(){
  //   // $(this).append( $('<img src="http://i.imgur.com/zvQtwAM.png")>');
  //   $(this).css('color', 'green')
  // });
});
