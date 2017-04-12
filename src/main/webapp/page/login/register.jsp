<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="mx" tagdir="/WEB-INF/tags"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">


<title>注册</title>
<mx:commonlink/>

<link href="../../resources/page/login/css/register.css" rel="stylesheet">
<script type="text/javascript" src="../../resources/page/login/js/register.js"></script>

</head>
<body>
    <div class="container">
    
    	<div class="title-register">
			<ul class="nav nav-tabs">
				<li role="presentation">
					<h3 class="panel-title login_title">云笔记账号注册</h3>
				</li>
				<li role="presentation" style="float:right">
					<p class="panel-title login_title"><a href="javascript:;" id="tologinbtn">已有账号去登陆</a></p>
				</li>
			</ul>
		</div>
		
      <form class="form-signin" role="form">
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">昵称</label>
							<div class="layui-input-inline" >
								<div>
									<input type="text" class="form-control" id="username" placeholder="输入你喜欢的昵称"  autofocus>
								</div>
							</div>
							<div class="layui-form-mid layui-word-aux" id="addrepeat" style="font-size: 18px;color: green;">
							</div>
						</div>
					</div>
					<div class="layui-form-item" >
						<div class="layui-inline">
							<label class="layui-form-label">邮箱</label>
							<div class="layui-input-inline">
								<div class="">
									<input type="text" class="form-control"  id="email" placeholder="Email">
								</div>
							</div>
							<div class="layui-form-mid layui-word-aux" id="addrepeat" style="font-size: 18px;color: green;">
							</div>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">手机</label>
							<div class="layui-input-inline">
								<div class="">
									<input type="text" class="form-control" id="mobile" placeholder="Mobile" >
								</div>
							</div>
							<div class="layui-form-mid layui-word-aux" id="addrepeat" style="font-size: 18px;color: green;">
							</div>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">密码</label>
							<div class="layui-input-inline">
								<div class="">
									<input type="password" class="form-control"  id="passwordone" placeholder="Password">
								</div>
							</div>
							<div class="layui-form-mid layui-word-aux" id="addrepeat" style="font-size: 18px;color: green;">
							</div>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">确认</label>
							<div class="layui-input-inline">
								<div class="">
									<input type="password" class="form-control" id="passwordtwo" placeholder="Password" >
								</div>
							</div>
							<div class="layui-form-mid layui-word-aux" id="addrepeat" style="font-size: 18px;color: green;">
							</div>
						</div>
					</div>
					
	        		<input type="button" class="btn btn-lg btn-primary btn-block" id="registerbtn" value="注册"/>
	        		
      </form>
    </div> <!-- /container -->

</body>
</html>