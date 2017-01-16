/**
 * by yangchd
 * 登录js文件
 */

window.onload = function(){
	
	$('#loginbtn').on('click',function(){
		var logindata = {
				username:$('#username').val(),
				password:$('#password').val()
		}
		$.ajax({
			type:"GET",
			url:getUrl()+"/login/getLogin",
			dataType:"json",
			data:logindata,
			timeout:2000,
			success:function(result){
				if(result.retflag==0){
					alert(result.msg);
				}
				if(result.retflag==1){
					alert(result.msg);
				}
			},
			error:function(msg){
				alert(JSON.stringify(msg));
			}
		});
	})
}