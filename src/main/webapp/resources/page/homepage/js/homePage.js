

window.onload = function(){
	//界面加载
	$("#homeTitle").load("homeTitle.jsp", function() {
		homeTitle();
    });
	
	//三个模块跳转
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