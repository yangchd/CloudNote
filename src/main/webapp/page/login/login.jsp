<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>cloudnote</title>

    <link href="../../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../../resources/page/login/css/login.css" rel="stylesheet">
    
    <script type="text/javascript" src="../../resources/jquery.js"></script>
    <script type="text/javascript" src="../../resources/tool.js"></script>
    <script type="text/javascript" src="../../resources/page/login/js/login.js"></script>

  </head>

  <body>

    <div class="container">
      <form class="form-signin" role="form">
			<div class="panel panel-default">
			
				<!-- 这里是登录界面的框框 -->
				<div class="panel-heading">
					<h3 class="panel-title">云笔记系统</h3>
				</div>
				<div class="panel-body">
					<div class="input-group">
						 <span class="input-group-addon" id="basic-addon1">用户：</span>
						 <input type="text" class="form-control" id="username" placeholder="Email or Phone"  autofocus>
					</div>
					<div class="input-group">
						 <span class="input-group-addon" id="basic-addon1">密码：</span>
						 <input type="password" class="form-control" id="password" placeholder="Password" >
					</div>
					
	        		<input type="button" class="btn btn-lg btn-primary btn-block" id="loginbtn" value="Sign in"/>
	        		
	        		<div class="row">
					  <div class="col-xs-4"></div>
					  <div class="col-xs-4">忘记密码</div>
					  <div class="col-xs-4" id='register'>免费注册</div>
					</div>
	        		
				</div>
			</div>
        
      </form>
    </div> <!-- /container -->

  </body>
</html>
