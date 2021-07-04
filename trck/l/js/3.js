$(document).ready(function(){
		$("#yes").on('click', function(e){
			e.preventDefault();
			$("#q1").fadeToggle(750).removeClass("show").addClass("hide");
			setTimeout(function() {
				$("#q2").fadeToggle(750).removeClass("hide").addClass("show");
			}, 250);
			$("#one").removeClass("active");
			$("#two").addClass("active");
		});

		$("#no").on('click', function(e){
			e.preventDefault();
			$("#q1").fadeToggle(750).removeClass("show").addClass("hide");
			setTimeout(function() {
				$("#reject").fadeToggle(750).removeClass("hide").addClass("show");
			}, 250);
		});


		$(".button0").on('click', function(e){
			e.preventDefault();
			$("#q1").fadeToggle(750).removeClass("show").addClass("hide");
			setTimeout(function() {
				$("#q2").fadeToggle(750).removeClass("hide").addClass("show");
			}, 250);
			$("#one").removeClass("active");
			$("#two").addClass("active");
		});
		
		
		$(".button1").on('click', function(e){
			e.preventDefault();
			$("#q2").fadeToggle(750).removeClass("show").addClass("hide");
			setTimeout(function() {
				$("#q3").fadeToggle(750).removeClass("hide").addClass("show");
			}, 800);
			$("#two").removeClass("active");
			$("#three").addClass("active");
		});

		$(".button2").on('click', function(e){
			e.preventDefault();
			$("#q3").fadeToggle(750).removeClass("show").addClass("hide");
			setTimeout(function() {
				$("#preload").fadeToggle(750).removeClass("hide").addClass("show");
			}, 1000);
			setTimeout(function() {
				$("#preload").fadeToggle(750).removeClass("show").addClass("hide");
			}, 5000);
			setTimeout(function() {
				$("#q4").fadeToggle(750).removeClass("hide").addClass("show");
			}, 6000);
			$("#three").removeClass("active");
			setTimeout(function() {
				$("#numbers").fadeToggle(750).removeClass("show").addClass("hide");
			}, 800);
		});
});

// Place any jQuery/helper plugins in here.
var javascript_countdown = function () {
  var time_left = 10; //number of seconds for countdown
  var keep_counting = 1;
  var no_time_left_message = '<span style="color:#fffff00;">ไม่กี่วินาที!</span>';
  function countdown() {
    if(time_left < 2) {
      keep_counting = 0;
    }
    time_left = time_left - 1;
  }
  function add_leading_zero( n ) {
    if(n.toString().length < 2) {
      return '0' + n;
    } else {
      return n;
    }
  }
  function format_output() {
    var hours, minutes, seconds;
    seconds = time_left % 60;
    minutes = Math.floor(time_left / 60) % 60;
    hours = Math.floor(time_left / 3600);
    seconds = add_leading_zero( seconds );
    minutes = add_leading_zero( minutes );
    hours = add_leading_zero( hours );
    return '<span>' + minutes + '</span> <span>นาที และ</span> <span>' + seconds + '</span> <span>วินาที</span>';
  }
  function show_time_left() {
    document.getElementById('timer').innerHTML = format_output();
  }
  function no_time_left() {
    document.getElementById('timer').innerHTML = no_time_left_message;
  }
  return {
    count: function () {
      countdown();
      show_time_left();
    },
    timer: function () {
      javascript_countdown.count();
      if(keep_counting) {
        setTimeout("javascript_countdown.timer();", 1000);
      } else {
        no_time_left();
      }
    },
    init: function (n) {
      time_left = n;
      javascript_countdown.timer();
    }
  };
}();