$(document).ready(function(){

  $("#notifications-click").on('click',function(e){
    e.preventDefault();

    if (window.webkitNotifications) {
    console.log('Your web browser does support notifications!');
    } else {
    console.log('Your web browser does not support notifications!');
    };
    if (window.webkitNotifications.checkPermission() == 0) {
    // Good to go, you can create a notification.
    } else {
    window.webkitNotifications.requestPermission(function(){});
  }

  var myNotification = window.webkitNotifications.createNotification('icon.png', 'Item Saved', 'My Application Name');
  myNotification.show();

    debugger;

  })





})
