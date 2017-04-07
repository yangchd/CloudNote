/**
 * 
 */

window.onload = function(){
	$("#homeTitle").load("homeTitle.jsp", function() {
		homeTitle();
    });
	
	$('#addbtn').on('click',function(){
		$('#addteam_panel').css("display","block");
	})
	$('#canceladdbtn').on('click',function(){
		//在关闭这个页面之前，最好做重置，等待重置按钮在后续优化
		$('#addteam_panel').css("display","none");
	})
	
	$('.editbtn').on('click',function(){
		$('#editteam_panel').css("display","block");
	})
	$('#canceleditbtn').on('click',function(){
		//在关闭这个页面之前，最好做重置，等待重置按钮在后续优化
		$('#editteam_panel').css("display","none");
	})
	
	$('.gotonotePage').on('click',function(){
		window.location.href=getUrl()+"/page/homepage/notebookPage.jsp";
	})
	
}