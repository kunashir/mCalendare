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
//= require jquery-ui
//= require_tree .
$(function($) {
  $(document).ready(function(){
    $("#article_published_on").datepicker({dateFormat: 'yy-mm-dd'});
    $("#event_start_date").datepicker({dateFormat: 'yy-mm-dd'});
    $("#end_date").datepicker({dateFormat: 'yy-mm-dd'});
  }
  
  );
  
})(jQuery);

$(function($){
  $(document).ready(function() {
    $("#article_published_on").change(function(){
      alert ("ttts");
      //$("#link_to_xls").html('<a href="transportations/-1/export?datepicker='+$("#datepicker").val() +'" >Сохранить в xls</a>');
    })
  })
})(jQuery);