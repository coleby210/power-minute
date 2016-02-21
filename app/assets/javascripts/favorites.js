// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {
  $('.workout-templates').on('submit', '#favorite-post', function(event) {
    event.preventDefault();

    var url = $(this).attr('action');
    var method = $(this).attr('method');
    var data = $(this).serialize();
    $.ajax({
      url: url,
      method: method,
      data: data
    }).done(function(response) {
      console.log(response[1]);

      // var selector = "workout-template" +
      // $('')
    });

  });

  $('.workout-templates').on('submit', '#favorite-delete', function(event) {

  });


});
