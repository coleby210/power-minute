//Found a repo for jQuery Circle - Edited a ton of the code to make it work with a number in the middle.
var $, methods;

$ = window.jQuery || window.Zepto;

window.requestAnimFrame = (function() {
  return window.requestAnimationFrame || window.webkitRequestAnimationFrame || window.mozRequestAnimationFrame || function(callback) {
    return window.setTimeout(callback, 1000 / 60);
  };
})();

methods = {
  init: function(options) {
    var circle, data, defaults, div, svg;
    this.empty();
    defaults = {
      timeout: 5000,
      onComplete: (function() {}),
      onUpdate: (function() {}),
      clockwise: true
    };
    data = {};
    data.options = $.extend(defaults, options);
    this.data("ct-meta", data);
    circle = document.createElementNS("http://www.w3.org/2000/svg", "circle");
    text = document.createElementNS("http://www.w3.org/2000/svg", "text")
    text.textContent = '60';
    text.setAttributeNS(null, "x", "34.5%")
    text.setAttributeNS(null, "y", "-39.5%")
    text.setAttributeNS(null, "transform", "rotate(90)")
    circle.setAttributeNS(null, "r", "25%");
    circle.setAttributeNS(null, "cx", "50%");
    circle.setAttributeNS(null, "cy", "48%");
    circle.setAttributeNS(null, "stroke-dasharray", (50 * Math.PI) + "%");
    svg = document.createElementNS("http://www.w3.org/2000/svg", "svg");
    svg.appendChild(circle);
    svg.appendChild(text);
    div = $("<div></div>");
    div.attr("id", "ct-circle-container");
    div.append(svg);
    return this.append(div);
  },
  start: function() {
    var circle, data, lastTimestamp, step;
    data = this.data("ct-meta");
    if ((data.timeElapsed == null) || data.timeElapsed === data.options.timeout) {
      lastTimestamp = null;
      data.timeElapsed = 0;
    }
    if (data.reqId != null) {
      window.cancelAnimationFrame(data.reqId);
    }
    circle = $(this).find("circle");
    step = function(timestamp) {
      var direction;
      if (lastTimestamp != null) {
        data.timeElapsed += timestamp - lastTimestamp;
      }
      lastTimestamp = timestamp;
      direction = data.options.clockwise ? -1 : 1;
      circle.css("stroke-dashoffset", (direction * 50 * Math.PI * data.timeElapsed / data.options.timeout) + "%");
      if (data.timeElapsed < data.options.timeout) {
        data.reqId = window.requestAnimationFrame(step);
        return data.options.onUpdate(data.timeElapsed);
      } else {
        data.timeElapsed = data.options.timeout;
        data.options.onUpdate(data.timeElapsed);
        return data.options.onComplete();
      }
    };
    data.reqId = window.requestAnimationFrame(step);
    return this.data("ct-meta", data);
  },
  pause: function() {
    var data;
    data = this.data("ct-meta");
    window.cancelAnimationFrame(data.reqId);
    return this.data("ct-meta", data);
  },

};

$.fn.circletimer = function(methodOrOptions) {
  if (methods[methodOrOptions]) {
    return methods[methodOrOptions].apply(this, Array.prototype.slice.call(arguments, 1));
  } else if (typeof methodOrOptions === "object" || !methodOrOptions) {
    return methods.init.apply(this, arguments);
  } else {
    return $.error("Method " + methodOrOptions + " does not exist in circletimer!");
  }
};

$(document).ready(function(){
  var startPause = false
  var time = 60000
  var i = 0;

  $(".timer").circletimer({
    timeout: time,
    onComplete: (function() {
      $(".timer").hide();
      $("#log-workout").show();
    }),
    onUpdate: (function(elapsed) {
      if(((time / 1000) - Math.round(elapsed) / 1000) >= 10){
        $("text").html(((time / 1000) - Math.round(elapsed) / 1000).toString().split(".")[0]);
      } else {
        $("text").html("0" + ((time / 1000) - Math.round(elapsed) / 1000).toString().split(".")[0]);
      }
      // if (elapsed <= 4945 && elapsed >= 4933){
      //   console.log(Math.floor(elapsed));
      //   i += 10000
      // };
      // var number = console.log());
      // if ((Math.floor(Math.round(elapsed) / 1000))%10===0) {
        // console.log((Math.floor(Math.round(elapsed) / 1000)));
        // console.log(Math.round(elapsed) / 1000);
      var num = ((time / 1000) - Math.round(elapsed) / 1000)
      var counter = 0

      var myArray = ["YOU CAN DO IT!", "COME'ON! ALMOST THERE!", "GREAT JOB, KEEP GOING!", "NO PAIN NO GAIN!", "WORKING OUT IS FUN!", "KEEP SMILING, KEEP WORKING", "GIVE YOUR BEST EFFORT!", "POWER THROUGH THE POWER MINUTE!"]

      function getRandomInt(min, max) {
        return Math.floor(Math.random() * (max - min + 1)) + min;
      }

      if (num === 60) {
        $('#encouragement-text').empty();
        $('#encouragement-text').append(myArray[getRandomInt(0, myArray.length-1)]);
      }
      if(num % 10 === 1 ) {
        $('#encouragement-text').empty();
        if (num === 1) {
          $('#encouragement-text').html("Congratulations");
          alert("Congratulations");
        } else {
          // $('#encouragement-text').html("gello");
          $('#encouragement-text').html(myArray[getRandomInt(0, myArray.length-1)]);
          alert(myArray[getRandomInt(0, myArray.length-1)]);
        }
      };

    })
  });



  $(".timer").on("click", "svg", function() {
    if(startPause == false){
      $(".timer").circletimer("start");
      startPause = true;
      $(".audioDemo")[0].play();
    } else {
      $(".timer").circletimer("pause");
      startPause = false;
      $(".audioDemo")[0].pause();
    }
  });

  $("#load_preview").click(function(){
    $("#workout_image").show();
    $("#load_preview").hide();
  })
});

