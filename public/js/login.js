$(document).ready(function () {
  $('#login-toolbar').on('click', '.login-link', function(e){
    e.preventDefault();
     var login_field = $(this).next();
      login_field.toggleClass('hidden');
  });

  $('#login-toolbar').on('submit', '#login', function(e){
    e.preventDefault();
    var login_data = $(this).serialize();
  $.ajax({
  type: 'POST',
  url: '/login',
  data: login_data,
    success: function(data)
        {
          if (data === 'Login') {
            $('.user-links').remove()
            $()
          }
          else {
            alert('Invalid Credentials');
          }
       }
   });
 });
});