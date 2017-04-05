

window.onload = function(){
	$("#homeTitle").load("homeTitle.jsp", function() {
    });
	$('#personalbtn').on('click',function(){
		window.location.href=getUrl()+"/page/homepage/notebookPage.jsp";
	})

	
}