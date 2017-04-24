<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="mx" tagdir="/WEB-INF/tags"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码</title>
<mx:commonlink/>
<script type="text/javascript" src="../../resources/page/person/js/passwordPage.js"></script>
</head>
<body>
		<div class="container">
			<nav class="navbar navbar-default" role="navigation">
			  <div id="homeTitle">
		      		<!-- 这里加载homeTitle页面 -->
		      </div>
			</nav>
		</div>
		
		<div class="container">
			<div class="persontitle">
				<ul class="nav nav-tabs">
					<li role="presentation">
						<h3 class="panel-title login_title">修改密码</h3>
					</li>
				</ul>
			</div>
			<form class="form-signin" role="form" style="width: 650px;padding-left: 150px;">
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">旧密码</label>
							<div class="layui-input-inline" >
								<div>
									<input type="password" class="form-control" placeholder="Password" id="password"  autofocus>
								</div>
							</div>
							<div class="layui-form-mid layui-word-aux" id="addrepeat" style="font-size: 18px;color: green;">
							</div>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">新密码</label>
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
      		</form>
      			<form class="form-signin" style="text-align: center;">
					<div class="layui-form-item">
						<div class="layui-inline">
							<div class="layui-input-inline">
								<input class="btn btn-default" type="button" id="passwordbtn" value="确认修改">
							</div>
						</div>
						<div class="layui-inline">
							<div class="layui-input-inline">
								<input class="btn btn-default" type="button" id="gotobtn" value="取消修改">
							</div>
						</div>
					</div>
				</form>
		</div>
</body>
</html>