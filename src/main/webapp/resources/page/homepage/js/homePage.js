

function lastreadfunc(){
	var userid = getUserID();
	var data = {
			userid:userid
	}
	$.ajax({
		type:"GET",
		url:getUrl()+"/query/getlastread",
		dataType:"json",
		data:data,
		timeout:2000,
		success:function(result){
			if(result.retflag==0){
				$('#lastreadid').text(result.list[0].notebookid);
				$('#lastreadname').text(result.list[0].notebookname);
				$('#lastreadbody').css("display","block");
			}
			if(result.retflag==1){
				$('#lastreadbody').css("display","none");
			}
		},
		error:function(msg){
			alertmsg('error');
		}
	});
}


window.onload = function(){
	//界面加载
	$("#homeTitle").load("homeTitle.jsp", function() {
		homeTitle();
    });
	
	lastreadfunc();
	
	
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
	$('#lastbtn').on('click',function(){
		window.location.href=getUrl()+"/page/homepage/notebookPage.jsp";
	})
	
	$('#lastreadbtn').on('click',function(){
		window.location.href=getUrl()+"/page/homepage/notebookPage.jsp?lastread";
	})
	
}