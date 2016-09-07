$(document).ready(function() {
	$('.fancybox').fancybox();
	$('.datetimepicker').datetimepicker({
		format: 'DD/MM/YYYY'
	})
	autosize(document.querySelectorAll('textarea'));
});
  