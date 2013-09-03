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
//= require jquery.lazyload
//= require jquery.infinitescroll.js
//= require_tree .

$(function(){
  $("#search_form").on("keyup", function() {
		$(this).submit();	
  });

	$("#movies .viewport").on("mouseenter", function() {
		$(this).children('a').children('img').animate({
			height: '380',
			left: '0', 
			top: '0', 
			width: '300'
		}, 100);
		$(this).children('a').children('span').fadeIn(200);
	}).on("mouseleave", function() {
		$(this).children('a').children('img').animate({
			height: '480',
			left: '-20',
			top: '-20',
			width: '400'
		}, 100);
		$(this).children('a').children('span').fadeOut(200);
	});

  // $("img").lazyload();

});