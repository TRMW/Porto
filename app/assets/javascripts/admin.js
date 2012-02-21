$(document).ready(function(){
  // Initialize drag and drop positioning of projects
  $('.admin-body .blocks').sortable({
    items: '.sortable',
    tolerance: 'pointer',
    stop: function(){
      $("[id^='position']").each(function(i){
        $(this).attr('value', i + 1);
      });
      $("#project_position").submit();
      $(".main").before("<div id=\"notice\">Project order updated.</div>");
    }
  });
});