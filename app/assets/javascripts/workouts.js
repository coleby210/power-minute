$(document).ready(function(){
  $("#tag-friends-button").on('click',function(e){
    e.preventDefault();
    $("#friends-tag-list").css("display","initial");
    $(this).hide();

  })

})
