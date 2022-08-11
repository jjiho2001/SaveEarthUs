$(function(){
	$("#report_list a").click(function(){
		var no = $(this).attr('alt');
		$.ajax({
			url: '/report/hitUpdate',
			data: "no="+no,
			success: function(){
				
			}, error: function(){
				console.log(e.responseText);
			}
		});
	});
});