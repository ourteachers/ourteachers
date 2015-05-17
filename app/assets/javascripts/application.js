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


  // Create the search box and link it to the UI element.
  var input = /** @type {HTMLInputElement} */(
      document.getElementById('pac-input'));
  // map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

  var searchBox = new google.maps.places.SearchBox(
    /** @type {HTMLInputElement} */(input));


  // [START region_getplaces]
  // Listen for the event fired when the user selects an item from the
  // pick list. Retrieve the matching places for that item.
  google.maps.event.addListener(searchBox, 'places_changed', function() {
    var places = searchBox.getPlaces();

    if (places[0].types.indexOf("school") > -1) {
    	send_data = { 
    		google_reference: places[0].reference, 
    		place_id: places[0].place_id, 
    		name: places[0].name,
    		address: places[0].adr_address};
        
			$.post( "/schools/init", send_data)
			  .done(function( data ) {
          console.log(data);
					window.location.href = "/schools/" + data.id;
			  });



    } else {
    	console.log("not a school");
    }


  });


}

submit_review = function( event ) {
		var qualitiesArray = [];

		$('span.tag--active').each(function(){
			qualitiesArray.push($(this).text());
		});
		
		$("input#review_qualities").val(qualitiesArray);

	}

$(document).ready(ready);
$(document).on('page:load', ready);