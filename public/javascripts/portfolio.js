$(document).ready(function(){
	$('.blocks').sortable({
		items: '.block',
		tolerance: 'pointer',
		stop: function(){
			$("[id$='position']").each(function(i){
				$(this).attr('value', i+1);
				$(this).next('.position').text(i+1); // update visible position indicator
			});
		}
	});
	
	var i = 0;
	
	$('#next-link a,.portfolio-photo').live('click', function(){
		$('#photo_' + (i+1)).show();
		$('#photo_' + i).hide();
		
		// hide next button if no next photo
		if($('#photo_' + (i+2)).length == 0){
			$('#next-link').html('next').addClass('inactive');
		}
		
		if($('#previous-link').hasClass('inactive')){
			$('#previous-link').removeClass('inactive').html('<a href="#">previous</a>');
		}
		
		i++;
	});
	
	$('#previous-link a').live('click', function(){
		$('#photo_' + (i-1)).show();
		$('#photo_' + i).hide();
		
		// hide prev button if no prev photo
		if($('#photo_' + (i-2)).length<1){
			$('#previous-link').html('previous').addClass('inactive');
		}
		
		if($('#next-link').hasClass('inactive')){
			$('#next-link').removeClass('inactive').html('<a href="#">next</a>');
		}
		
		i--;
	});
	
	$('.portfolio-photo-last').click(function(){
		$('#photo_0').show();
		$('#photo_' + i).hide();
		$('#next-link').removeClass('inactive').html('<a href="#">next</a>');
		$('#previous-link').html('previous').addClass('inactive');
		i = 0;
	});
	
	$('.photo-replace-link').click(function(){
		$(this).next('input:file').show();
		$(this).siblings('.remove-check').hide();
		$(this).hide();
		return false;
	});
});