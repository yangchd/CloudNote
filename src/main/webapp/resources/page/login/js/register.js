/**
 * by yangchd 2017-02-08
 * 注册js文件
 */

//用来存放注册界面数据。当所有数据都满足的时候才可以注册
var repeatData = {
		username:"",
		email:"",
		mobile:"",
		password:"",
		passwordone:"",
		passwordtwo:""
}


window.onload = function(){
	
	//注册界面跳转登陆界面
	$("#tologinbtn").on('click',function(){
		window.location.href=getUrl()+"/page/login/login.jsp";
	})
	
	//注册按钮
	$("#registerbtn").on('click',function(){
		var flag = true;
		//非空校验
		if(repeatData.username==""){
			$('#username').parent().addClass("form-group has-error");
			var value = $('#username').val();
			if(value==""){
				addRepeat($('#username'),"empty");
			}
			flag=false;
		}
		if(repeatData.email==""){
			$('#email').parent().addClass("form-group has-error");
			var value = $('#email').val();
			if(value==""){
				addRepeat($('#email'),"empty");
			}
			flag=false;
		}
		if(repeatData.mobile==""){
			$('#mobile').parent().addClass("form-group has-error");
			var value = $('#mobile').val();
			if(value==""){
				addRepeat($('#mobile'),"empty");
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
			//所有校验全部通过时，执行注册
			repeatData.password=repeatData.passwordone;
			$.ajax({
				type:"GET",
				url:getUrl()+"/register/insert",
				dataType:"json",
				data:repeatData,
				timeout:2000,
				success:function(result){
					if(result.retflag==0){
						alertmsg(result.msg);
						window.location.href=getUrl()+"/page/login/login.jsp";
					}
					if(result.retflag==1){
						alertmsg(result.msg);
					}
				},
				error:function(msg){
					alertmsg('error');
				}
			});
		}else{
//			alert("请确认填写的信息是否正确！")
		}
	})
	
	$('#username').change(function(){
		var username = $('#username').val();
		var data = {
				username:username,
		}
		$.ajax({
			type:"GET",
			url:getUrl()+"/register/repeat",
			dataType:"json",
			data:data,
			timeout:2000,
			success:function(result){
				if(result.retflag==0){
					addRepeat($('#username'),"true");
					repeatData.username=username;
				}
				if(result.retflag==1){
					addRepeat($('#username'),"false");
					repeatData.username="";
				}
			},
			error:function(msg){
				alertmsg('error');
			}
		});
	})
	
	$('#email').change(function(){
		var email = $('#email').val();
		var data = {
				email:email,
		}
		$.ajax({
			type:"GET",
			url:getUrl()+"/register/repeat",
			dataType:"json",
			data:data,
			timeout:2000,
			success:function(result){
				if(result.retflag==0){
					addRepeat($('#email'),"true");
					repeatData.email=email;
				}
				if(result.retflag==1){
					if(result.msg=="email"){
						addRepeat($('#email'),"email");
					}else{
						addRepeat($('#email'),"false");
					}
					repeatData.email="";
				}
			},
			error:function(msg){
				alertmsg('error');
			}
		});
	})
	
	$('#mobile').change(function(){
		var mobile = $('#mobile').val();
		var data = {
				mobile:mobile,
		}
		$.ajax({
			type:"GET",
			url:getUrl()+"/register/repeat",
			dataType:"json",
			data:data,
			timeout:2000,
			success:function(result){
				if(result.retflag==0){
					addRepeat($('#mobile'),"true");
					repeatData.mobile=mobile;
				}
				if(result.retflag==1){
					if(result.msg=="mobile"){
						addRepeat($('#mobile'),"mobile");
					}else{
						addRepeat($('#mobile'),"false");
					}
					repeatData.mobile="";
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
}