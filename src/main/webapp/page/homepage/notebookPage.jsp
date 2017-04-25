<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="mx" tagdir="/WEB-INF/tags"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>笔记本</title>
<mx:commonlink/>
<link href="../../resources/page/homepage/css/notebookPage.css" rel="stylesheet">
<script type="text/javascript" src="../../resources/page/homepage/js/noteboosPage.js"></script>

</head>
<body>

	<div id="notebookPage_top">
		<div class="container">
		<nav class="navbar navbar-default" role="navigation">
		  <div id="homeTitle">
	      		<!-- 这里加载homeTitle页面 -->
	      </div>
		</nav>
		</div>
	</div>
	
	<div class="container" id="notebookPage_navigation">
		<!-- 新增面板，界面待优化 -->
		<div class="panel panel-default" id="addbtn_panel" style="display: none;">
			<div class="panel-body">
			<div class="col-md-3">
					<h2>请选择新增文件路径</h2>
					<div class="treecss">
					  <ul class="addtree"></ul>
					</div>
			</div>
			<div class="col-md-6">
				<form class="form-inline">
						<div class="layui-form-item">
							<div class="layui-inline">
								<label class="layui-form-label">类别</label>
								<div class="layui-input-inline">
									<select class="form-control" style="width: inherit;" id="addtype">
									  <option value="1">笔记本</option>
									  <option value="2">目录</option>
									</select>
								</div>
							</div>
						</div>
						<div class="layui-form-item">
							<div class="layui-inline">
								<label class="layui-form-label">路径</label>
								<div class="layui-input-inline">
									<input type="text" id="addtreeid" class="form-control" readonly="readonly" style="display: none;">
									<input type="text" id="addtreename" class="form-control" readonly="readonly">
								</div>
							</div>
						</div>
						<div class="layui-form-item">
							<div class="layui-inline">
								<label class="layui-form-label">名称</label>
								<div class="layui-input-inline">
									<input type="text" id="addname"  class="form-control">
								</div>
							</div>
						</div>
						<div class="layui-form-item">
							<div class="layui-inline">
								<div class="layui-input-inline">
									<input class="btn btn-default" type="button" id="paneladdbtn" value="确认新增">
								</div>
							</div>
							<div class="layui-inline">
								<div class="layui-input-inline">
									<input class="btn btn-default" id="canceladdbtn" type="button" value="取消新增">
								</div>
							</div>
						</div>
				</form>
			</div>
			<div class="col-md-3">
			</div>
			</div><!-- panel-body -->
		</div><!-- 新增面板 -->
		
		<!-- 移动面板，界面待优化 -->
		<div class="panel panel-default" id="editbtn_panel" style="display: none;">
			<div class="panel-body">
			<div class="col-md-3">
					<h2>选择要移动的笔记本</h2>
					<div class="treecss">
					  <ul class="movetreeone"></ul>
					</div>
			</div>
			<div class="col-md-3">
					<div class="notebooklist" id="movetreeonelist">
						<!-- 这里加载笔记本列表 -->
					</div>
			</div>
			<div class="col-md-3">
					<h2>选择要移动到的位置</h2>
					<div class="treecss">
					  <ul class="movetreetwo"></ul>
					</div>
			</div>
			<div class="col-md-3">
					<div class="notebooklist" id="movetreetwolist">
						<!-- 这里加载笔记本列表 -->
					</div>
			</div>
			<div class="col-md-12 movepanel" style="display: block;">
				<span id="movefrom"></span>
				<span id="movename" style="padding-left: 15px;"></span>
				<span class="glyphicon glyphicon-arrow-right" id="jiantou"></span>
				<span id="moveto"></span>
			</div>
			
			<form class="form-inline">
					<div class="layui-form-item">
						<div class="layui-inline">
							<div class="layui-input-inline">
								<input class="btn btn-default" type="button" value="确认移动">
							</div>
						</div>
						<div class="layui-inline">
							<div class="layui-input-inline">
								<input class="btn btn-default" id="canceleditbtn" type="button" value="取消移动">
							</div>
						</div>
					</div>
			</form>
			</div><!-- panel-body -->
		</div><!-- 新增面板 -->
		
		<!-- 删除面板，暂时未设计好 -->
		<div class="panel panel-default" id="deletebtn_panel" style="display: none;">
			<div class="panel-body">
				<div class="col-md-3">
						<h2>选择删除文件的路径</h2>
						<div class="treecss">
						  <ul class="deletetree"></ul>
						</div>
				</div>
				<div class="col-md-9">
					<div class="notebooklist" id="deletetreelist">
						<!-- 这里加载笔记本列表 -->
					</div>
				</div>
				<form class="form-inline">
					<div class="layui-form-item">
						<div class="layui-inline">
							<div class="layui-input-inline">
								<input class="btn btn-default" type="button" value="确认删除">
							</div>
						</div>
						<div class="layui-inline">
							<div class="layui-input-inline">
								<input class="btn btn-default" id="canceldeletebtn" type="button" value="取消删除">
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
		
	</div>
			
			
	<div class="container" id="notebookPage_body">
	
	<div class="panel panel-default">
		<div class="panel-body">
			<div class="col-md-6">
			<div class="col-md-12" style="text-align: center;">
				<!-- 中部按钮菜单栏 -->
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="btn-group" role="group" aria-label="...">
							<input class="btn btn-default" id="addbtn" type="button" value="新增">
							<input class="btn btn-default" id="editbtn" type="button" value="移动">
							<input class="btn btn-default" id="deletebtn" type="button" value="删除">
						</div>
					</div>
				</div>
			</div>
				<!-- 左侧下拉菜单 -->
				<div class="col-md-4">
					<div class="treecss">
					  <ul class="pwdtree"></ul>
					</div>
				</div>
				
				<!-- 中部笔记本显示  -->
				<div class="col-md-8">
					<div class="notebooklist" id="pwdlist">
						<!-- 这里加载笔记本列表 -->
					</div>
				</div>
			</div>
				<!-- 右侧文本编辑和功能按钮  -->
				<div class="col-md-6">
					<div class="textareaPage">
					</div>
				</div>
			</div>
			</div>
		</div>

</body>
</html>