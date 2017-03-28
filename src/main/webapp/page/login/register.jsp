<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<link href="../../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="../../resources/page/login/css/login.css" rel="stylesheet">

<script type="text/javascript" src="../../resources/jquery.js"></script>
<script type="text/javascript" src="../../resources/tool.js"></script>
<script type="text/javascript" src="../../resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../../resources/page/login/js/register.js"></script>


<title>注册</title>
</head>
<body>
    <div class="container">
      <form class="form-signin" role="form">
      		<div class="panel panel-default">
			
				<!-- 这里是登录界面的框框 -->
				<div class="panel-heading">
					<h3 class="panel-title">注册</h3>
				</div>
				<div class="panel-body">
					<!-- 
						<span class='glyphicon glyphicon-ok'></span>
						<span class='glyphicon glyphicon-remove'></span>
					 -->
				
					<div class="input-group">
						 <span class="input-group-addon">邮箱:</span>
						 <input type="text" class="form-control" id="email" placeholder="Email"  autofocus>
						 <span class="input-group-addon" id="register-right"></span>
					</div>
					<div class="input-group">
						 <span class="input-group-addon">手机:</span>
						 <input type="text" class="form-control" id="mobile" placeholder="Mobile">
						 <span class="input-group-addon" id="register-right"></span>
					</div>
					<div class="input-group">
						 <span class="input-group-addon">密码:</span>
						 <input type="password" class="form-control" id="passwordone" placeholder="Password" >
						 <span class="input-group-addon" id="register-right"></span>
					</div>
					<div class="input-group">
						 <span class="input-group-addon">确认:</span>
						 <input type="password" class="form-control" id="passwordtwo" placeholder="Password" >
						 <span class="input-group-addon" id="register-right"></span>
					</div>
					
	        		<input type="button" class="btn btn-lg btn-primary btn-block" id="registerbtn" value="注册"/>
	        		
				</div>
			</div>
      	
      </form>
    </div> <!-- /container -->

</body>
</html>