// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

ready = function() {
  qualityCount = 0;
	

	$("form#new_review").submit(submit_review);

  $('span.quality').click(function() {
    $this = $(this);

	if ($this.hasClass("tag--active")) {
      $this.removeClass("tag--active");
      qualityCount--;
    } else if(qualityCount < 3) {
      $this.addClass("tag--active");
      qualityCount++;
    }
  });

	$('span.quality').hover(function() {
	    $this = $(this);
	  if ((!$this.hasClass("tag--active")) && qualityCount >= 3) {
	    	$this.css("cursor", "not-allowed");
		} else
		{
			$this.css("cursor", "pointer");
		}
  });

}

submit_review = function( event ) {
		var qualitiesArray = [];

		$('span.tag--active').each(function(){
			qualitiesArray.push($(this).text());
		});
		
		$("input#review_qualities").val(qualitiesArray);
		console.log("submit");
	}

$(document).ready(ready);
$(document).on('page:load', ready);