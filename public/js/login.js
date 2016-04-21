$(document).ready(function () {
  $('#login-toolbar').on('click', '.login-link', function(e){
    e.preventDefault();
     var whatever = $(this).next()
      whatever.toggleClass('hidden');

  //-----Submit login info-----
  // $.ajax({
  // type: 'POST',
  // url: '/login',
  // data: $('#login').serialize(),
    // })
  });
});