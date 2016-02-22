// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// $(document).ready(function() {

//   $('.workout-templates').on('click', 'a.fav-add', function(event) {
//     event.preventDefault();

//     var url = $(this).attr('href')
//     var data = { workout_template_id: $(this).attr('id').match(/\d/)[0] };

//     $.ajax({
//       url: url,
//       method: 'POST',
//       data: data
//     }).done(function(response) {
//       var favButtonDiv = '.workout-template-' + data["workout_template_id"] + ' .favorite-button';
//       $(favButtonDiv).empty();
//       $(favButtonDiv).append(response)
//     });

//   });

//   $('.workout-templates').on('click', 'a.fav-remove', function(event) {
//     event.preventDefault();

//     var url = $(this).attr('href')
//     var data = { favorite_id: $(this).attr('id').match(/\d/)[0] };

//     $.ajax({
//       url: url,
//       method: 'DELETE'
//       // data: data
//     }).done(function(response) {
//       // console.log(response);

//       var favButtonDiv = '.workout-template-' + data["workout_template_id"] + ' .favorite-button';
//       $(favButtonDiv).empty();
//       $(favButtonDiv).append(response)
//     });

//   });

// });
