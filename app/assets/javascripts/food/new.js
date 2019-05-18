$(function(){
  $('#food_name').on('change', function () {
    var name = $(this).val();

    $.get('/expiration_dates/' + name, function(data) {
      $('#food_expiration').val(data['expires_on']);
    });
  });
});
