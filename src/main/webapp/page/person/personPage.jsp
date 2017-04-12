<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="mx" tagdir="/WEB-INF/tags"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人信息</title>
<mx:commonlink/>
<script type="text/javascript" src="../../resources/page/person/js/personPage.js"></script>

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
						<h3 class="panel-title login_title">个人信息</h3>
					</li>
				</ul>
			</div>
			<form class="form-signin" role="form" style="text-align: center;">
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">昵称</label>
							<div class="layui-input-inline" >
								<div>
									<input type="text" class="form-control" id="username" value="杨昌迪" >
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
									<input type="text" class="form-control"  id="email" value="369271317@qq.com">
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
									<input type="text" class="form-control" id="mobile" value="18813091207" >
								</div>
							</div>
							<div class="layui-form-mid layui-word-aux" id="addrepeat" style="font-size: 18px;color: green;">
							</div>
						</div>
					</div>
					<!-- 
					<div style="padding-left: 30px;padding-right: 30px;">
		        		<input type="button" class="btn btn-lg btn-primary btn-block" id="registerbtn" value="应用"/>
					</div>
					 -->

      		</form>
		</div>
</body>
</html>