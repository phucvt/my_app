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
//= require google-map.js
///= require jquery.js
$(function() {
  $("#posts th a, #posts .pagination a").live("click", function() {
    $.getScript(this.href)
    return false;
  });
  $("#posts_search").submit(function() {
    $.get(this.action, $(this).serialize(), null, "script");
    return false;
  });
});
// $(function() {
//   $("#posts_search input").keyup(function() {
//     $.get($("#posts_search").attr("action"), $("#posts_search").serialize(), null, "script");
//     return false;
//   });
// });
