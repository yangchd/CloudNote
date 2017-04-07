

window.onload = function(){
	$("#homeTitle").load("homeTitle.jsp", function() {
		homeTitle();
    });
	$('#personalbtn').on('click',function(){
		window.location.href=getUrl()+"/page/homepage/notebookPage.jsp";
	})
	$('#teambtn').on('click',function(){
		window.location.href=getUrl()+"/page/homepage/teamPage.jsp";
	})
	$('#querybtn').on('click',function(){
		window.location.href=getUrl()+"/page/homepage/queryPage.jsp";
	})

	
}