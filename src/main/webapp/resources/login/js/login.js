/**
 * by yangchd
 * 登录js文件
 */


window.onload = function(){
	
	
	var trandata = {
			username:$('#username').val(),
			password:$('#password').val()
	}
	
	$('#loginbtn').on('click',function(){
		$.ajax({
			type:"GET",
			url:"",
			dataType:"json",
			data:trandata,
			timeout:2000,
			success:function(result){
				
			},
			error:function(){
				alert("请求错误")
			}
		});
	})
}