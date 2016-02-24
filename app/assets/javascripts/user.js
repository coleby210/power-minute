$(document).ready(function(){
  $(".column-7-pie").on('click',function(e){
    e.preventDefault();
    $(".column-7").css('background-color','#252A40');
    $(".column-7").css('color','#F0EADF');
    $(".column-31").css('background-color','white');
    $(".column-31").css('color','black');
    $(".column-all-time").css('background-color','white');
    $(".column-all-time").css('color','black');

    url = window.location.pathname
    $.get(url+"/7/pie", function( data ){
      renderPieChart(data);
    })

  });

  $(".column-31-pie").on('click',function(e){
    e.preventDefault();
    $(".column-31").css('background-color','#252A40');
    $(".column-31").css('color','#F0EADF');
    $(".column-7").css('background-color','white');
    $(".column-7").css('color','black');
    $(".column-all-time").css('background-color','white');
    $(".column-all-time").css('color','black');
    url = window.location.pathname
    $.get(url+"/31/pie", function( data ){
      renderPieChart(data);
    });

  });

  $(".column-all-time-pie").on('click',function(e){
    e.preventDefault();
    $(".column-all-time").css('background-color','#252A40');
    $(".column-all-time").css('color','#F0EADF');
    $(".column-7").css('background-color','white');
    $(".column-7").css('color','black');
    $(".column-31").css('color','black');
    $(".column-31").css('background-color','white');
    url = window.location.pathname
    $.get(url+"/all_time/pie", function( data ){
      renderPieChart(data);
    });
  });

    $(".column-7-bar").on('click',function(e){
    e.preventDefault();
    $(".column-7").css('background-color','#252A40');
    $(".column-7").css('color','#F0EADF');
    $(".column-31").css('background-color','white');
    $(".column-31").css('color','black');
    $(".column-all-time").css('background-color','white');
    $(".column-all-time").css('color','black');

    url = window.location.pathname
    $.get(url+"/7/pie", function( data ){
      renderPieChart(data);
    })

  });

  $(".column-30-bar").on('click',function(e){
    e.preventDefault();
    $(".column-31").css('background-color','#252A40');
    $(".column-31").css('color','#F0EADF');
    $(".column-7").css('background-color','white');
    $(".column-7").css('color','black');
    $(".column-all-time").css('background-color','white');
    $(".column-all-time").css('color','black');
    url = window.location.pathname
    $.get(url+"/31/pie", function( data ){
      renderPieChart(data);
    });

  });

  $(".column-all-time-bar").on('click',function(e){
    e.preventDefault();
    $(".column-all-time").css('background-color','#252A40');
    $(".column-all-time").css('color','#F0EADF');
    $(".column-7").css('background-color','white');
    $(".column-7").css('color','black');
    $(".column-31").css('color','black');
    $(".column-31").css('background-color','white');
    url = window.location.pathname
    $.get(url+"/all_time/pie", function( data ){
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
  };

  renderBarChart = function(data) {
    $("#myLineChart").remove();
    $("#top-workouts-chart").append('<canvas id="myLine" width="400" height="300"></canvas>')
    var ctx1 = document.getElementById("myLineChart").getContext("2d");
    var data1 = {
      labels: [],
      datasets: [
        {
          label: "My First dataset",
          fillColor: "#F32C31",
          strokeColor: "rgba(243,44,49,.8)",
          highlightFill: "rgba(151,187,205,0.75)",
          highlightStroke: "rgba(151,187,205,1)",
          data: 0
        }
      ]
  }

})








