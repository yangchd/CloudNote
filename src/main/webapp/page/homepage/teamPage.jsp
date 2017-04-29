<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="mx" tagdir="/WEB-INF/tags"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的小组</title>
<mx:commonlink/>

<link href="../../resources/page/homepage/css/teamPage.css" rel="stylesheet">
<script type="text/javascript" src="../../resources/page/homepage/js/teamPage.js"></script>

</head>
<body>
		<div class="container">
			<nav class="navbar navbar-default" role="navigation" style="height:50px;">
			  <div id="homeTitle">
		      		<!-- 这里加载homeTitle页面 -->
		      </div>
			</nav>
		</div>
		<div class="container" id="teamPage_navigation">
			<!-- 新增面板，界面待优化 -->
			<div class="panel panel-default" id="addteam_panel" style="display: none;">
				<div class="panel-body">
				<div class="col-md-7">
					<div class="col-md-8">
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
										<input type="text" class="form-control"  id="teamnamecreate" placeholder="Team Name">
									</div>
								</div>
								<div class="layui-form-mid layui-word-aux" id="addrepeat" style="font-size: 18px;color: green;">
								</div>
							</div>
						</div>
						</form>
					</div>
					<div class="col-md-4">
						<div class="tablehead search-member">小组成员</div>
						<table class="table table-hover addtable" id="addtableid">
							<tbody id="addmemlist">
								<!-- 
								<tr>
									<th>已选择组员</th>
									<th>选项</th>
								</tr>
								<tr>
									<td>
										<p style="display: none;" id='adduserid'>111</p> 名字
									</td>
									<td><a href="javascript:;" class="deletemembtn"> <span
											class="glyphicon glyphicon-remove"> </span>
									</a></td>
								</tr>
								 -->
							</tbody>
						</table>
					</div>
				</div>
				<div class="col-md-5">
						<p class="search-member">在这里选择要添加的小组成员</p>
						<div class="input-group search-input">
							<input type="text" class="form-control" id="searchmsg" placeholder="Search for..."> 
							<span class="input-group-btn">
								<button class="btn btn-default" id="searchmembtn" type="button">搜索</button>
							</span>
						</div>
						<div class="search-table">
						<table class="table table-hover">
							<tbody id="memberlist">
							<!-- 
								<tr>
									<th>名字</th>
									<th>电话</th>
									<th>邮箱</th>
									<th>选项</th>
								</tr>
								<tr>
									<td id='userid'><p style="display: none;">asdas</p> 名字</td>
									<td>电话</td>
									<td>邮箱</td>
									<td><a href="javascript:;" id="addmembersbtn"> <span
											class="glyphicon glyphicon-plus"> </span>
									</a></td>
								</tr>
							 -->
							</tbody>
						</table>
					</div>
					</div>
					<div class="col-md-12" style="text-align: center;margin-top: 20px;">
		        		<div class="layui-form-item">
								<div class="layui-inline">
									<div class="layui-input-inline">
										<input class="btn btn-default" id="createteambtn" type="button" value="创建小组">
									</div>
								</div>
								<div class="layui-inline">
									<div class="layui-input-inline">
										<input class="btn btn-default" id="canceladdbtn" type="button" value="取消创建">
									</div>
								</div>
						</div>
					</div>
      			
				</div><!-- panel-body -->
			</div><!-- 新增面板 -->
			<!-- 修改面板，界面待优化 -->
			<div class="panel panel-default" id="editteam_panel" style="display: none;">
				<div class="panel-body">
				<div>
					<p style="display:none" id="editteamid"></p>
				</div>
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
									<label class="layui-form-label">组名</label>
									<div class="layui-input-inline">
										<div class="">
											<input type="text" class="form-control"  id="teamnameedit" placeholder="Team Name">
										</div>
									</div>
									<div class="layui-form-mid layui-word-aux rightbtn" id="addrepeat" style="font-size: 18px;color: green;">
										<input class="btn btn-default minbtn" id="editteamnamebtn" type="button" value="应用">
									</div>
								</div>
							</div>
							<!-- 
								<div class="layui-form-item">
									<div class="layui-inline">
										<div class="layui-input-inline">
											<input class="btn btn-default minbtn" type="button" value="保存">
										</div>
									</div>
								</div>
							 -->
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
									<label class="layui-form-label">组长</label>
									<div class="layui-input-inline">
									
									<select class="form-control" style="width: inherit;" id="editteamleader">
									</select>
									</div>
									<div class="layui-form-mid layui-word-aux rightbtn" id="addrepeat" style="font-size: 18px;color: green;">
										<input class="btn btn-default minbtn" id="editteamleaderbtn" type="button" value="应用">
									</div>
								</div>
							</div>
						</form>
					</div>
					<div class="col-md-12">
						<div class="col-md-2" >
						</div>
						<div class="col-md-4" >
							<div class="tablehead search-member" >小组成员
								<input class="btn btn-default minbtn" style="margin-left: 100px;" id="editmembtn" type="button" value="应用">
							</div>
							<table class="table table-hover addtable" id="edittableid">
								<tbody id="editmemlist">
								</tbody>
							</table>
						</div>
						<div class="col-md-5">
								<p class="search-member">在这里选择要添加的小组成员</p>
								<div class="input-group search-input">
									<input type="text" class="form-control" id="editsearchmsg" placeholder="Search for..."> 
									<span class="input-group-btn">
										<button class="btn btn-default" id="editsearchmembtn" type="button">搜索</button>
									</span>
								</div>
								<div class="search-table">
								<table class="table table-hover">
									<tbody id="editmemberlist">
									</tbody>
								</table>
								</div>
						</div>
						<div class="col-md-1" >
						</div>
					</div>
					<div class="layui-form-item" style="text-align: center;">
						<!-- 
								<div class="layui-inline">
									<div class="layui-input-inline">
										<input class="btn btn-default" type="button" value="确认修改">
									</div>
								</div>
						 -->
								<div class="layui-inline">
									<div class="layui-input-inline">
										<input class="btn btn-default" id="canceleditbtn" type="button" value="完成修改关闭修改界面">
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
						<a  id="addbtn" style="padding-left: 50px;">
						<span>创建小组</span><span style="padding-left: 5px;" class="glyphicon glyphicon-plus"></span>
						</a>
					</p>
				</div>
				<div class="panel-body">
				<table class="table table-hover" >
					<tbody id="myteamtable">
					</tbody>
					<!-- 
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
					 -->
				</table>
			</div>
			</div>
		</div>
</body>
</html>