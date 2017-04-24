/**
 * 工具类
 */

var url = "http://localhost:8080/cloudnote";
//var url = "http://192.168.1.110:8080/cloudnote";

var getUrl = function(){
	return url;
}

/**
 * 为判断框添加正确或者错误的提示，传入输入框节点
 */
function addRepeat($this,flag){
	var node = $this.parent().parent().parent().find('#addrepeat');
	node.empty();
	if(flag=="true"){
		node.append("<span class='glyphicon glyphicon-ok'></span>");
		node.css("color","green");
		//成功后去掉有可能的错误提示样式
		$this.parent().removeClass("form-group has-error");  
	}
	if(flag=="false"){
		node.append("<span class='glyphicon glyphicon-remove'>已被注册</span>");
		node.css("color","red");
	}
	if(flag=="empty"){
		node.append("<span class='glyphicon glyphicon-remove'>值不能为空</span>");
		node.css("color","red");
	}
	if(flag=="password"){
		node.append("<span class='glyphicon glyphicon-remove'>密码不同</span>");
		node.css("color","red");
	}
	if(flag=="email"){
		node.append("<span class='glyphicon glyphicon-remove'>邮箱错误</span>");
		node.css("color","red");
	}
	if(flag=="mobile"){
		node.append("<span class='glyphicon glyphicon-remove'>手机错误</span>");
		node.css("color","red");
	}
	if(flag=="oldpassword"){
		node.append("<span class='glyphicon glyphicon-remove'>旧密码错误</span>");
		node.css("color","red");
	}
}


function getUserID(){
	var userid="";
	$.ajax({
		type:"GET",
		url:getUrl()+"/login/getSession",
		async:false,
		dataType:"json",
		timeout:2000,
		success:function(result){
			if(result.retflag==0){
				userid = result.userid;
			}
			if(result.retflag==1){
				window.location.href=getUrl()+"/page/login/login.jsp";
			}
		},
		error:function(msg){
			alert(JSON.stringify(msg));
		}
	});
	return userid;
}

window.onload = function(){
}






