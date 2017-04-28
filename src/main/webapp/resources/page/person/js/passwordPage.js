/**
 * 
 */

//用来存放注册界面数据。当所有数据都满足的时候才可以注册
var repeatData = {
		password:"",
		passwordone:"",
		passwordtwo:""
}

window.onload = function(){
	$("#homeTitle").load("../homepage/homeTitle.jsp", function() {
		homeTitle();
    });
	
	$('#password').change(function(){
		var data = {
				id:getUserID(),
				password:$('#password').val(),
		}
		$.ajax({
			type:"GET",
			url:getUrl()+"/register/repeat",
			dataType:"json",
			data:data,
			timeout:2000,
			success:function(result){
				if(result.retflag==0){
					addRepeat($('#password'),"true");
					repeatData.password=password;
				}
				if(result.retflag==1){
					if(result.msg=="oldpassword"){
						addRepeat($('#password'),"oldpassword");
						repeatData.password="";
					}
				}
			},
			error:function(msg){
				alertmsg('error');
			}
		});
	})
	//密码校验
	$('#passwordone').change(function(){
		var passwordone = $('#passwordone').val();
		var passwordtwo = $('#passwordtwo').val();
		if(passwordtwo==""){
			addRepeat($('#passwordone'),"true");
			repeatData.passwordone=passwordone;
		}else if(passwordtwo!="" && passwordone==passwordtwo){
			addRepeat($('#passwordone'),"true");
			addRepeat($('#passwordtwo'),"true");
			repeatData.passwordone=passwordone;
		}else{
			addRepeat($('#passwordtwo'),"password");
			repeatData.passwordone=passwordone;
			repeatData.passwordtwo="";
		}
	})
	$('#passwordtwo').change(function(){
		var passwordone = $('#passwordone').val();
		var passwordtwo = $('#passwordtwo').val();
		if(passwordone==passwordtwo){
			addRepeat($('#passwordtwo'),"true");
			repeatData.passwordtwo=passwordtwo;
		}else{
			addRepeat($('#passwordtwo'),"password");
			repeatData.passwordtwo="";
		}
	})
	
	$('#passwordbtn').on('click',function(){
		var flag = true;
		if(repeatData.password==""){
			$('#password').parent().addClass("form-group has-error");
			var value = $('#password').val();
			if(value==""){
				addRepeat($('#password'),"empty");
			}
			flag=false;
		}
		if(repeatData.passwordone==""){
			$('#passwordone').parent().addClass("form-group has-error");
			var value = $('#passwordone').val();
			if(value==""){
				addRepeat($('#passwordone'),"empty");
			}
			flag=false;
		}
		if(repeatData.passwordtwo==""){
			$('#passwordtwo').parent().addClass("form-group has-error");
			var value = $('#passwordtwo').val();
			if(value==""){
				addRepeat($('#passwordtwo'),"empty");
			}
			flag=false;
		}
		if(flag){
			var data = {
					id : getUserID(),
					password:$("#passwordone").val(),
			}
			$.ajax({
				type:"GET",
				url:getUrl()+"/person/updatePwd",
				dataType:"json",
				data:data,
				timeout:2000,
				success:function(result){
					if(result.retflag==0){
						window.location.href=getUrl()+"/page/login/login.jsp";
						alertmsg("修改成功,请重新登录！");
					}
					if(result.retflag==1){
						window.location.href=getUrl()+"/page/login/login.jsp";
					}
				},
				error:function(msg){
					alertmsg('error');
				}
			});
		}
		
	})
	$('#gotobtn').on('click',function(){
		window.location.href=getUrl()+"/page/homepage/homePage.jsp";
	})
}