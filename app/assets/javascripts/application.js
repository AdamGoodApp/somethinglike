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
//= require jquery.infinitescroll
//= require bootstrap.min
//= require_tree .




function movieCoverHover() {
	$(".viewport").on("mouseenter", function() {
		$(this).children('a').children('img').animate({
			height: '310',
			left: '0', 
			top: '0', 
			width: '255'
		}, 100);
		$(this).children('a').children('span').fadeIn(200);
	}).on("mouseleave", function() {
		$(this).children('a').children('img').animate({
			height: '230',
			left: '-20',
			top: '-20',
			width: '175'
		}, 100);
		$(this).children('a').children('span').fadeOut(200);
	});
};


$(function (){

	function ajaxCall(title){
		
	}


	$(".modal_button").on('click', function(){

		var title = $(this).attr('data-title');
	 	var cast = $(this).attr('data-cast');


		$('#myModal2').on('shown', function(){
			$(".movie_title").text(title);
		});

		$('#myModal2').modal({
		});

		ajaxCall(title);

	});



	/*****************
	* RANSACK SEARCH *
	*****************/
  $("#search_form").on("keyup", function() {
		$(this).submit();	
  });

	/******************
	* INFINITE SCROLL *
	******************/
	// $("#movies").infinitescroll({
	// 	navSelector: "nav.pagination",
 //    nextSelector: "nav.pagination a[rel=next]",
 //    itemSelector: "#movies div.viewport"
 //  });

	/******************
	* HOVER POSTERS   *
	******************/
	movieCoverHover();

  // $("img").lazyload();

});