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
//= require jquery_ujs
//= require foundation
//= require_tree .

$( "#review-title").on('click touch', function(){update_reviews(this);});
$(function(){ $(document).foundation(); });



function update_reviews(data){
  //alert("hi");
  //console.log("reached update function");
  $.ajax({
    type: "POST",
    url: "../messages/get_data",
    data: {
        message_id: "hello"
          },
    dataType: "json",
    success: function(data){console.log(data);},
    error: function(data){console.log(data);}
  });
}
