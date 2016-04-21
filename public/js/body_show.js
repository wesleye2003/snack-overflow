$(document).ready(function() {
  $('.post').on('mouseover', '.question-title', function(){
    var body = $(this).parent().find('.qbody');
    console.log(body)
    body.toggleClass('hidden');
  }).on('mouseout', '.question-title', function(){
    var body = $(this).parent().find('.qbody');
    body.toggleClass('hidden');
  });

  $('.a-comment').on('click', function(event){
    event.preventDefault();
    var form = $(this).next();
    form.toggleClass('hidden');
  });

  $('.answer-comments').on('submit', '.comment-form', function(e){
    e.preventDefault();
    var form = $(this);
    var comment = $(this).serialize();
    var link = $(this).prev().attr('href');
    $.ajax({
      type: 'POST',
      url: link,
      data: comment,
      success: function(response){
        form.toggleClass('hidden');
        $('.answer-comments').prepend(response);
      }
    });
  });

  $('.question-comments').on('submit', '.comment-form', function(e){
    e.preventDefault();
    var form = $(this);
    var comment = $(this).serialize();
    var link = $(this).prev().attr('href');
    $.ajax({
      type: 'POST',
      url: link,
      data: comment,
      success: function(response){
        form.toggleClass('hidden');
        $('.answer-comments').prepend(response);
      }
    });

});
