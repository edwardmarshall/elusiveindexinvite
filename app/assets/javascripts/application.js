// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function() {

if($('body').hasClass('reminder')) {
		var timer = $('.clock');

		var leadingZero = function(n) {
			if (n < 10 && n >= 0)
				return '0' + n;
			else
				return n;
		};

		var minutes = 5;
		var seconds = 00;

		setInterval(function() {

			var m = $('.min', timer),
				s = $('.sec', timer);

			if (seconds == 0) {
				minutes--;
				seconds = 59;
			} else {
				seconds--;
			}

			if (minutes == 0 && seconds == 0) {
				timer.html("0:00");
			}

			m.text(minutes);
			s.text(leadingZero(seconds));

		}, 1000);

	}

});