$(document).ready(function() {
  $('.container').hover('.question-title', function(){
    var $(body) = $(this).find('.qbody');
    $(body).show();
    $(body).hide();
  });
});
