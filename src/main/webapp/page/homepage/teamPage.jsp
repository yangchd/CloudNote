<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="mx" tagdir="/WEB-INF/tags"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的小组</title>
<mx:commonlink/>

<link href="../../resources/page/homepage/css/homePage.css" rel="stylesheet">
<link href="../../resources/page/homepage/css/teamPage.css" rel="stylesheet">
<script type="text/javascript" src="../../resources/page/homepage/js/teamPage.js"></script>

</head>
<body>
		<div class="container">
			<nav class="navbar navbar-default" role="navigation">
			  <div id="homeTitle">
		      		<!-- 这里加载homeTitle页面 -->
		      </div>
			</nav>
		</div>
		<div class="container" id="teamPage_navigation">
			<!-- 新增面板，界面待优化 -->
			<div class="panel panel-default" id="addteam_panel" style="display: none;">
				<div class="panel-body">
					<div class="newteam">
						<ul class="nav nav-tabs">
							<li role="presentation">
								<h3 class="panel-title login_title">新建小组</h3>
							</li>
						</ul>
					</div>
					<form class="form-signin" role="form" style="text-align: center;">
					<div class="layui-form-item" >
						<div class="layui-inline">
							<label class="layui-form-label">名称</label>
							<div class="layui-input-inline">
								<div class="">
									<input type="text" class="form-control"  id="teamname" placeholder="Team Name">
								</div>
							</div>
							<div class="layui-form-mid layui-word-aux" id="addrepeat" style="font-size: 18px;color: green;">
							</div>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">组长</label>
							<div class="layui-input-inline">
								<div class="">
									<input type="text" class="form-control" id="groupleader" placeholder="Group Leader" >
								</div>
							</div>
							<div class="layui-form-mid layui-word-aux" id="addrepeat" style="font-size: 18px;color: green;">
							</div>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">组员</label>
							<div class="layui-input-inline">
								<div class="">
									<input type="text" class="form-control" id="members" placeholder="Team Members" >
								</div>
							</div>
							<div class="layui-form-mid layui-word-aux" id="addrepeat" style="font-size: 18px;color: green;">
							</div>
						</div>
					</div>
	        		<div class="layui-form-item">
							<div class="layui-inline">
								<div class="layui-input-inline">
									<input class="btn btn-default" type="button" value="确认添加">
								</div>
							</div>
							<div class="layui-inline">
								<div class="layui-input-inline">
									<input class="btn btn-default" id="canceladdbtn" type="button" value="取消添加">
								</div>
							</div>
					</div>
	        		
      			</form>
				</div><!-- panel-body -->
			</div><!-- 新增面板 -->
			<!-- 修改面板，界面待优化 -->
			<div class="panel panel-default" id="editteam_panel" style="display: none;">
				<div class="panel-body">
					<div class="col-md-6">
						<div class="newteam">
							<ul class="nav nav-tabs">
								<li role="presentation">
									<h3 class="panel-title login_title">修改小组名称</h3>
								</li>
							</ul>
						</div>
						<form class="form-signin" role="form" style="text-align: center;">
							<div class="layui-form-item" >
								<div class="layui-inline">
									<label class="layui-form-label">新名称</label>
									<div class="layui-input-inline">
										<div class="">
											<input type="text" class="form-control"  id="teamname" placeholder="Team Name">
										</div>
									</div>
									<div class="layui-form-mid layui-word-aux" id="addrepeat" style="font-size: 18px;color: green;">
									</div>
								</div>
							</div>
							<div class="layui-form-item">
								<div class="layui-inline">
									<div class="layui-input-inline">
										<input class="btn btn-default" type="button" value="应用">
									</div>
								</div>
							</div>
						</form>
					</div>
					<div class="col-md-6">
						<div class="newteam">
							<ul class="nav nav-tabs">
								<li role="presentation">
									<h3 class="panel-title login_title">修改小组组长</h3>
								</li>
							</ul>
						</div>
						<form class="form-signin" role="form" style="text-align: center;">
							<div class="layui-form-item" >
								<div class="layui-inline">
									<label class="layui-form-label">新组长</label>
									<div class="layui-input-inline">
										<div class="">
											<input type="text" class="form-control"  id="groupleader" placeholder="New Leader">
										</div>
									</div>
									<div class="layui-form-mid layui-word-aux" id="addrepeat" style="font-size: 18px;color: green;">
									</div>
								</div>
							</div>
							<div class="layui-form-item">
								<div class="layui-inline">
									<div class="layui-input-inline">
										<input class="btn btn-default" type="button" value="应用">
									</div>
								</div>
							</div>
						</form>
					</div>
					<div class="col-md-6">
						<div class="newteam">
							<ul class="nav nav-tabs">
								<li role="presentation">
									<h3 class="panel-title login_title">添加小组成员</h3>
								</li>
							</ul>
						</div>
						<form class="form-signin" role="form" style="text-align: center;">
							<div class="layui-form-item" >
								<div class="layui-inline">
									<label class="layui-form-label">成员</label>
									<div class="layui-input-inline">
										<div class="">
											<input type="text" class="form-control"  id="groupleader" placeholder="New Member">
										</div>
									</div>
									<div class="layui-form-mid layui-word-aux" id="addrepeat" style="font-size: 18px;color: green;">
									</div>
								</div>
							</div>
							<div class="layui-form-item">
								<div class="layui-inline">
									<div class="layui-input-inline">
										<input class="btn btn-default" type="button" value="添加">
									</div>
								</div>
							</div>
						</form>
					</div>
					<div class="layui-form-item" style="text-align: center;">
								<div class="layui-inline">
									<div class="layui-input-inline">
										<input class="btn btn-default" type="button" value="确认修改">
									</div>
								</div>
								<div class="layui-inline">
									<div class="layui-input-inline">
										<input class="btn btn-default" id="canceleditbtn" type="button" value="取消修改">
									</div>
								</div>
					</div>
					
				</div>
			</div>
		</div>
		
		<div class="container">
			<div class="panel panel-default">
				<div class="panel-heading">
					<p>我的小组
					<a><span class="glyphicon glyphicon-plus" id="addbtn" style="padding-left: 50px;"></span></a>
					<a><span class="glyphicon glyphicon-cog" style="padding-left: 20px;"></span></a>
					</p>
				</div>
				<div class="panel-body">
				<table class="table table-hover">
					<tr>
						<th>小组名称</th>
						<th>小组组长</th>
						<th>小组成员</th>
						<th>创建时间</th>
						<th>选项</th>
					</tr>
					<tr>
						<td>小组一</td>
						<td>小明</td>
						<td>小明、张三、王五</td>
						<td>2017-04-06</td>
						<td>
							<a class="editbtn"><span>编辑</span><span class="glyphicon glyphicon-pencil"></span></a> 
							<a><span>解散</span><span class="glyphicon glyphicon-remove"></span></a>
							<a class="gotonotePage"><span>查看</span><span class="glyphicon glyphicon-share-alt"></span></a>
						</td>
					</tr>
					<tr>
						<td>小组二</td>
						<td>张三</td>
						<td>小明、张三、王五</td>
						<td>2017-04-06</td>
						<td>
							<a class="editbtn"><span>编辑</span><span class="glyphicon glyphicon-pencil"></span></a> 
							<a><span>解散</span><span class="glyphicon glyphicon-remove"></span></a>
							<a class="gotonotePage"><span>查看</span><span class="glyphicon glyphicon-share-alt"></span></a>
						</td>
					</tr>
				</table>
			</div>
			</div>
		</div>
</body>
</html>