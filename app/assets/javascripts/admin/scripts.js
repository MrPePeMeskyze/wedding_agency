$(document).ready(function() {
	$('.fancybox').fancybox();
	$('.datetimepicker').datetimepicker({
		format: 'DD/MM/YYYY'
	})
	autosize(document.querySelectorAll('textarea'));
	
	$('.summernote_initial').summernote({
		toolbar: [
			['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
			['fontsize', ['fontsize']],
			['color', ['color']],
			['para', ['ul', 'ol', 'paragraph']],
			['insert', ['picture','link', 'table', 'hr']],
			['misk', ['undo','redo', 'codeview']]
		  ]
	});
	$('.form-group.note-group-select-from-files').remove();
});
  