$(document).ready(function(){
  $("#landing").on("click", "#sign-up", function(){
    $("#sign-up").hide();
    $("#log-in").hide();
    $("#sign-up-form").show();
  });
  $("#landing").on("click", "#log-in", function(){
    $("#sign-up").hide();
    $("#log-in").hide();
    $("#log-in-form").show();
  });
  $("#landing").on("click", "#back-button", function(){
    $("#sign-up").show();
    $("#log-in").show();
    $("#log-in-form").hide();
    $("#sign-up-form").hide();
  });
});
