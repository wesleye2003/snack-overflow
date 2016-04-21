$(document).ready(function () {
  $('#login-toolbar').on('click', '.login-link', function(e){
    e.preventDefault();
     var login_field = $(this).next();
      login_field.toggleClass('hidden');
  });

  $('#login-toolbar').on('submit', '#login', function(e){
    e.preventDefault();
    var login_data = $(this).serialize();
    var login_field = $(this)
    $.ajax({
    type: 'POST',
    url: '/login',
    data: login_data,
      success: function(data){
        login_field.toggleClass('hidden')
        $('.register').remove();
        $('#login-toolbar').append(data);
      }
    });
  });
});
