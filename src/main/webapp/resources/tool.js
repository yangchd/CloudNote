/**
 * 工具类
 */

//访问地址获取
var url = "http://localhost:8080/cloudnote";
var getUrl = function(){
	return url;
}

/**
 * 提示函数,所有页面中的弹出提示
 * @param message
 */
function alertmsg(message){
	layui.use('layer', function(){
		var layer = layui.layer;
		if(message=="error"){
			layer.msg('发生了点小问题，请重新登录后再试~');
		}else{
			layer.msg(message);
		}
	}); 
}


function returnPageType(){
	var thisURL = document.URL;
	var getval  = thisURL.split("?")[1];
	if(getval!=null&&getval!=""){
		if(getval=="team")return "team";
		if(getval=="lastread")return "lastread";
	}else{
		return "";
	}
}

/**
 * 获取当前登录用户id用
 * @returns {String}
 */
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
			alertmsg('error');
		}
	});
	return userid;
}

/**
 * 获取当前登录用户spaceid用
 * @returns {String}
 */
function getUserSpaceId(){
	var spaceid="";
	$.ajax({
		type:"GET",
		url:getUrl()+"/person/getPersonValue",
		async:false,
		dataType:"json",
		timeout:2000,
		success:function(result){
			if(result.retflag==0){
				spaceid = result.person.spaceid;
			}
			if(result.retflag==1){
				window.location.href=getUrl()+"/page/login/login.jsp";
			}
		},
		error:function(msg){
			alertmsg('error');
		}
	});
	return spaceid;
}

/**
 * 传入上一次查看的组的spaceid
 */
function setteamspaceid(id){
	var data={
			value:id,
			sessionname:"nowteamspaceid"
	}
	$.ajax({
		type:"GET",
		url:getUrl()+"/login/setSession",
		async:false,
		data:data,
		dataType:"json",
		timeout:2000,
		success:function(result){
		},
		error:function(msg){
			alertmsg('error');
		}
	});
}
function getteamspaceid(){
	var nowteamspaceid="";
	var name = "nowteamspaceid";
	var data={
			sessionname:name
	}
	$.ajax({
		type:"GET",
		url:getUrl()+"/login/getSessionByName",
		async:false,
		data:data,
		dataType:"json",
		timeout:2000,
		success:function(result){
			nowteamspaceid = result.sessionvalue;
		},
		error:function(msg){
			alertmsg('error');
		}
	});
	return nowteamspaceid;
}
function getSessionByName(name){
	var lastread="";
	var data={
			sessionname:name
	}
	$.ajax({
		type:"GET",
		url:getUrl()+"/login/getSessionByName",
		async:false,
		data:data,
		dataType:"json",
		timeout:2000,
		success:function(result){
			lastread = result.sessionvalue;
		},
		error:function(msg){
			alertmsg('error');
		}
	});
	return lastread;
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

