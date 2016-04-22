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
      },
      error: function(){
        alert("Comments cannot be blank and you must be logged in to comment.")
      }
    });
  });

  $('.q-comment').on('click', function(event){
    event.preventDefault();
    var form = $(this).next();
    form.toggleClass('hidden');
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
        $('.question-comments').prepend(response);
      },
      error: function(){
        alert("Comments cannot be blank and you must be logged in to comment.")
      }
    });
  });
});
