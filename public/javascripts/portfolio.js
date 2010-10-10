$(document).ready(function(){
	$('.portfolio-edit-photos').sortable({
		items: '.portfolio-edit-photo',
		stop: function(){
			$("[id$='position']").each(function(i){
				$(this).attr('value', i+1);
			});
		}
	});
});