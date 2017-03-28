/**
 * by yangchd 2017-02-08
 * 注册js文件
 */


/**
 * 为判断框添加正确或者错误图片，传入参数为节点
 */
function addRepeat($this,flag){
	$this.empty();
	if(flag=="true"){
		$this.append("<span class='glyphicon glyphicon-ok'></span>");
	}
	if(flag=="false"){
		$this.append("<span class='glyphicon glyphicon-remove'></span>");
	}
}

//用来存放4个数据是否都通过，全部通过时，才能注册
var repeatData = {
		email:"",
		mobile:"",
		password:"",
		passwordone:"",
		passwordtwo:""
}


window.onload = function(){
	
	$("#registerbtn").on('click',function(){
		var flag = true;
		if(repeatData.email==""){
			flag=false;
		}
		if(repeatData.mobile==""){
			flag=false;
		}
		if(repeatData.passwordone==""){
			flag=false;
		}
		if(repeatData.passwordtwo==""){
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
						alert(result.msg);
						window.location.href=getUrl()+"/page/login/login.jsp";
					}
					if(result.retflag==1){
						alert(result.msg);
					}
				},
				error:function(msg){
					alert(JSON.stringify(msg));
				}
			});
		}else{
			alert("请确认输出信息是否正确！")
		}
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
					addRepeat($('#email').parent().find('#register-right'),"true");
					repeatData.email=email;
				}
				if(result.retflag==1){
					addRepeat($('#email').parent().find('#register-right'),"false");
					repeatData.email="";
				}
			},
			error:function(msg){
				alert(JSON.stringify(msg));
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
					addRepeat($('#mobile').parent().find('#register-right'),"true");
					repeatData.mobile=mobile;
				}
				if(result.retflag==1){
					addRepeat($('#mobile').parent().find('#register-right'),"false");
					repeatData.mobile="";
				}
			},
			error:function(msg){
				alert(JSON.stringify(msg));
			}
		});
	})
	$('#passwordone').change(function(){
		var passwordone = $('#passwordone').val();
		addRepeat($('#passwordone').parent().find('#register-right'),"true");
		repeatData.passwordone=passwordone;
	})
	$('#passwordtwo').change(function(){
		var passwordone = $('#passwordone').val();
		var passwordtwo = $('#passwordtwo').val();
		if(passwordone==passwordtwo){
			addRepeat($('#passwordtwo').parent().find('#register-right'),"true");
			repeatData.passwordtwo=passwordtwo;
		}else{
			addRepeat($('#passwordtwo').parent().find('#register-right'),"false");
			repeatData.passwordtwo="";
		}
		
	})
}