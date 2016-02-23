$(document).ready(function(){
  $(".column-7").on('click',function(e){
    e.preventDefault();
    $(".column-7").css('background-color','#252A40');
    $(".column-7").css('color','#F0EADF');
    $(".column-31").css('background-color','white');
    $(".column-31").css('color','black');
    $(".column-all-time").css('background-color','white');
    $(".column-all-time").css('color','black');

    url = window.location.pathname
    $.get(url+"/7", function( data ){
      renderPieChart(data);
    })

  });

  $(".column-31").on('click',function(e){
    e.preventDefault();
    $(".column-31").css('background-color','#252A40');
    $(".column-31").css('color','#F0EADF');
    $(".column-7").css('background-color','white');
    $(".column-7").css('color','black');
    $(".column-all-time").css('background-color','white');
    $(".column-all-time").css('color','black');
    url = window.location.pathname
    $.get(url+"/31", function( data ){
      renderPieChart(data);
    });

  });

  $(".column-all-time").on('click',function(e){
    e.preventDefault();
    $(".column-all-time").css('background-color','#252A40');
    $(".column-all-time").css('color','#F0EADF');
    $(".column-7").css('background-color','white');
    $(".column-7").css('color','black');
    $(".column-31").css('color','black');
    $(".column-31").css('background-color','white');
    url = window.location.pathname
    $.get(url+"/all_time", function( data ){
      renderPieChart(data);
    });
  });

  renderPieChart = function(data) {
    $("#myChart").remove();
    $("#pie-chart-div").append('<canvas id="myChart" width="380" height="400"></canvas>')
    var ctx2 = document.getElementById("myChart").getContext("2d");

    data2 = [
      {
        value: data["Cardio"],
        color: "#F32C31",
        label: "Cardio"
      },
      {
        value: data["Yoga"],
        color: "#F0EADF",
        label: "Yoga"
      },
      {
        value: data["Power"],
        color: "#3F4045",
        label: "Power"
      }
    ]
    var myPieChart = new Chart(ctx2).Pie(data2);
  }

});








