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
  
  // Disable title inputs for disabled sections of the site
  if ( '.settings' ) {
    var checks = [{
        check: $('#show_blog'),
        input: $('#blog_title')
      },
      {
        check: $('#show_about'),
        input: $('#about_title')
      },
      {
        check: $('#show_contact'),
        input: $('#contact_title')
      }];
    
    $(checks).each(function(){
      var current = this;
      if ( !current.check.attr('checked') ) {
        current.input.prop('disabled', true);
      }
      current.check.on('click', function(){
        if ( current.input.prop('disabled') ) {
          console.log('enable');
          current.input.prop('disabled', false);
        } else {
          console.log('disable');
          current.input.prop('disabled', true);
        }
      });
    });
  }
});