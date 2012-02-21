$(document).ready(function(){
  // Initialize drag and drop positioning of project images
  $('.projects-body .blocks').sortable({
    items: '.sortable',
    tolerance: 'pointer',
    stop: function(){
      $('.sortable').each(function(i){
        var position = $(this).find("[id$='position']"),
          title = $(this).find('.title');
        position.attr('value', i + 1);
        title.text(i + 1); // update visible position indicator
      });
    }
  });
  
  // Show file replace input on click
  $('.image-replace-link').click(function(){
    $(this).next('input:file').show();
    $(this).siblings('.remove-check').hide();
    $(this).hide();
    return false;
  });
  
  // Initialize slideshow(s) if there are projects on the page
  $('.project').each(function(){  
    new PortoSlideshow();
  });
  
});