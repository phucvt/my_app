// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap.min
//= require jquery.modal
//= require jquery.min
//= require jquery_ujs
//= require turbolinks
//= require_tree .

var geocoder;
    var map;
    function initialize() {
      geocoder = new google.maps.Geocoder();
      var latlng = new google.maps.LatLng(16.071845, 108.224339);
      var mapOptions = {
        zoom: 15,
        center: latlng
      }
      map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
      codeAddress();
    }

    function codeAddress() {
      var address = document.getElementById('address').value;
      geocoder.geocode( { 'address': address}, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
          map.setCenter(results[0].geometry.location);
          var marker = new google.maps.Marker({
              map: map,
              position: results[0].geometry.location
          });
        } else {
          alert('Geocode was not successful for the following reason: ' + status);
        }
      });
    }

  google.maps.event.addDomListener(window, 'load', initialize);
  // portfolio filter
  $(document).ready(function(){'use strict';
    var $portfolio_selectors = $('.portfolio-filter >li>a');
    var $portfolio = $('.portfolio-items');
    $portfolio.isotope({
      itemSelector : '.portfolio-item',
      layoutMode : 'fitRows'
    });
    
    $portfolio_selectors.on('click', function(){
      $portfolio_selectors.removeClass('active');
      $(this).addClass('active');
      var selector = $(this).attr('data-filter');
      $portfolio.isotope({ filter: selector });
      return false;
    });
  });

