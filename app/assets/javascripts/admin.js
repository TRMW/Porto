$(document).ready(function(){
  $('.blocks').sortable({
    items: '.sortable',
    tolerance: 'pointer',
    stop: function(){
      $("[id^='position']").each(function(i){
        $(this).attr('value', i+1);
      });
      $("#portfolio_position").submit();
      $(".blocks").prepend("<p id=\"notice\">Portfolio order updated.</p>");
    }
  });
});