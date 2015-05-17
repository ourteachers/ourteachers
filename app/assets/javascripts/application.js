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

init_review_field = function () {
  $(this).children("span").each(function(){
    var defaultColor = "#dbe6ec";
    var hoverColor = "#FEC300";
    var selectedColor = "#FEC300";

    function setReviewColors(context, color)
    {
      val = $(context).data("review-value");
      spans = $(context).parent().children("span").filter(function(i){
        return $(this).data("review-value") <= val;
      });

      spans.each(function(){
        $(this).css("color", color);
      });
    }

    //mouse enter
    $(this).on('mouseenter', function(){
      val = $(this).data("review-value");
      spans = $(this).parent().children("span").filter(function(i){
        return $(this).data("review-value") <= val;
      });
      spans.each(function(){
        $(this).css("color", hoverColor);
      });

      spans = $(this).parent().children("span").filter(function(i){
        return $(this).data("review-value") > val;
      });
      spans.each(function(){
        $(this).css("color", defaultColor);
      });

    });

    //mouse leave
    $(this).on('mouseleave', function(){
      val = $(this).data("review-value");
      spans = $(this).parent().children("span");

      spans.each(function(){
        if($(this).hasClass("selected")){
          $(this).css("color", selectedColor);
        } else {
          $(this).css("color", defaultColor);
        }
      });
    });

    //on click
    $(this).on('click', function(){
      val = $(this).data("review-value");
      fieldId=$(this).parent().data("review-field");
      $("input#"+fieldId).val(val)
      
      spans = $(this).parent().children("span").filter(function(i){
        return $(this).data("review-value") <= val;
      });

      spans.each(function(){
        $(this).addClass("selected");
        $(this).css("color", selectedColor);
      });

      spans = $(this).parent().children("span").filter(function(i){
        return $(this).data("review-value") > val;
      });

      spans.each(function(){
        $(this).removeClass("selected");
        $(this).css("color", defaultColor);
      });

    });

  });
}

ready = function() {
  qualityCount = 0;
	

  $("div.review-icon-group").each(init_review_field);

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


  var input = /** @type {HTMLInputElement} */(
      document.getElementById('pac-input'));

  var searchBox = new google.maps.places.SearchBox(
    /** @type {HTMLInputElement} */(input));
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

  if($("div#map-canvas").length) {
    var request = {
      placeId: $("div#map-canvas").data('place-id')
    };
    
    mapOptions = {};
    map = new google.maps.Map(document.getElementById('map-canvas'),
                                  mapOptions);
    var service = new google.maps.places.PlacesService(map);

    service.getDetails(request, function(place, status) {

      var mapOptions = {
        zoom: 15,
        minZoom: 15,
        maxZoom: 15,
        center: place.geometry.location,
        disableDefaultUI: true,
        draggable: false,
        scrollwheel: false,
        panControl: false,
        disableDoubleClickZoom: false
        }
      map = new google.maps.Map(document.getElementById('map-canvas'),
                                  mapOptions);
     $("div.profile_photo").remove();
    });
  }


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