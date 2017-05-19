<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="mx" tagdir="/WEB-INF/tags"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>云笔记系统</title>
    <mx:commonlink/>

    <link href="../../resources/page/login/css/login.css" rel="stylesheet">
    <script type="text/javascript" src="../../resources/page/login/js/login.js"></script>

  </head>

  <body>

    <div class="container">
      <form class="form-signin" role="form">
			<div class="panel panel-default">
			
				<!-- 这里是登录界面的框框 -->
				<div class="panel-heading">
					<h3 class="panel-title" id="login_title">欢迎使用云笔记系统</h3>
				</div>
				<div class="panel-body">
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">账号</label>
							<div class="layui-input-inline">
								<div>
									<input type="text" class="form-control" id="username"  placeholder="Email or Phone"  autofocus>
								</div>
							</div>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">密码</label>
							<div class="layui-input-inline">
								<div>
									<input type="password" class="form-control" id="password" placeholder="Password" >
								</div>
							</div>
						</div>
					</div>
					
	        		<input type="button" class="btn btn-lg btn-primary btn-block" id="loginbtn" value="登陆"/>
	        		
	        		<div class="row">
					  <div class="col-xs-8"></div>
					  <!-- 
					  <div class="col-xs-4">忘记密码</div>
					   -->
					  <div class="col-xs-4" id='register'>
						<a href="javascript:;" id="register" >免费注册</a>
					  </div>
					</div>
	        		
				</div>
			</div>
        
      </form>
    </div> <!-- /container -->

  </body>
</html>
