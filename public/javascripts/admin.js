$(document).ready(function(){
	$('.portfolio-edit-photos').sortable({
		items: '.portfolio-edit-photo',
		tolerance: 'pointer',
		stop: function(){
			$("[id^='position']").each(function(i){
				$(this).attr('value', i+1);
			});
			$("#portfolio_position").submit();
			$(".portfolio-edit-photos").prepend("<p id=\"notice\">Portfolio order updated.</p>");
		}
	});
});