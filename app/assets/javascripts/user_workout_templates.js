$(document).ready(function() {

  $('.create-workout-template-btn').on('click', function(event) {
    event.preventDefault();
    var url = $('.link-create-workout-template').attr('href');


    $.ajax({
      url: url,
      method: 'GET'
    }).done(function(response) {
      console.log(response);
      $('.create-workout-template-btn').hide()
      $('.create-workout-template-form').append(response);
    });
  })

});
