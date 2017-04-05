<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="mx" tagdir="/WEB-INF/tags"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>笔记本</title>

<mx:commonlink/>
<link href="../../resources/page/homepage/css/homePage.css" rel="stylesheet">
<link href="../../resources/page/homepage/css/notebookPage.css" rel="stylesheet">
<script type="text/javascript" src="../../resources/page/homepage/js/noteboosPage.js"></script>

</head>
<body>

	<div id="notebookPage_top">
		<div class="container">
		  <div id="homeTitle">
	      		<!-- 这里加载homeTitle页面 -->
	      </div>
		</div>
	</div>
	
	<div class="container" id="notebookPage_navigation">
		<!-- 中部按钮菜单栏 -->
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="btn-group" role="group" aria-label="...">
					<input class="btn btn-default" id="addbtn" type="button" value="新增">
					<input class="btn btn-default" id="editbtn" type="button" value="移动">
					<input class="btn btn-default" id="deletebtn" type="button" value="删除">
				</div>
				<input class="btn btn-default" id="gotohomepagebtn" style="float:right;" type="button" value="去主页">
			</div>
		</div>
		<!-- 新增面板，界面待优化 -->
		<div class="panel panel-default" id="addbtn_panel" style="display: none;">
			<div class="panel-body">
			<div class="col-md-3">
					<h2>选择路径</h2>
					<div style="display: inline-block; width: 200px; padding: 10px; overflow: auto;">
					  <ul id="addtree"></ul>
					</div>
			</div>
			<div class="col-md-6">
				<form class="form-inline">
						<div class="layui-form-item">
							<div class="layui-inline">
								<label class="layui-form-label">类别</label>
								<div class="layui-input-inline">
									<select class="form-control" style="width: inherit;" name="addtype">
									  <option>笔记本</option>
									  <option>目录</option>
									</select>
								</div>
							</div>
						</div>
						<div class="layui-form-item">
							<div class="layui-inline">
								<label class="layui-form-label">名称</label>
								<div class="layui-input-inline">
									<input type="text" name="addname"  class="form-control">
								</div>
							</div>
						</div>
						<div class="layui-form-item">
							<div class="layui-inline">
								<div class="layui-input-inline">
									<input class="btn btn-default" type="button" value="确认新增">
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
					<div style="display: inline-block; width: 200px; padding: 10px; overflow: auto;">
					  <ul id="movetreeone"></ul>
					</div>
			</div>
			<div class="col-md-3">
				<div class="panel panel-default">
				  <div class="panel-heading">默认分组</div>
					<div class="list-group">
					  <a href="#" class="list-group-item">
					    <h1 class="list-group-item-heading">某某某笔记本</h1>
					    <p class="list-group-item-text">创建时间等信息</p>
					  </a>
					  <a href="#" class="list-group-item">
					    <h1 class="list-group-item-heading">某某某笔记本</h1>
					    <p class="list-group-item-text">创建时间等信息</p>
					  </a>
					  <a href="#" class="list-group-item">
					    <h1 class="list-group-item-heading">某某某笔记本</h1>
					    <p class="list-group-item-text">创建时间等信息</p>
					  </a>
					</div>
				</div>
			</div>
			<div class="col-md-3">
					<h2>选择要移动到的位置</h2>
					<div style="display: inline-block; width: 200px; padding: 10px; overflow: auto;">
					  <ul id="movetreetwo"></ul>
					</div>
			</div>
			<div class="col-md-3">
				<div class="panel panel-default">
				  <div class="panel-heading">默认分组</div>
					<div class="list-group">
					  <a href="#" class="list-group-item">
					    <h1 class="list-group-item-heading">某某某笔记本</h1>
					    <p class="list-group-item-text">创建时间等信息</p>
					  </a>
					  <a href="#" class="list-group-item">
					    <h1 class="list-group-item-heading">某某某笔记本</h1>
					    <p class="list-group-item-text">创建时间等信息</p>
					  </a>
					  <a href="#" class="list-group-item">
					    <h1 class="list-group-item-heading">某某某笔记本</h1>
					    <p class="list-group-item-text">创建时间等信息</p>
					  </a>
					</div>
				</div>
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
		
	</div>
			
			
	<div class="container" id="notebookPage_body">
	
	<div class="panel panel-default">
		<div class="panel-body">
			<div class="col-md-6">
				<!-- 左侧下拉菜单 -->
				<div class="col-md-4">
				<!-- 
					<ul class="layui-nav layui-nav-tree" lay-filter="demo">
					  <li class="layui-nav-item layui-nav-itemed">
					    <a href="javascript:;">所有笔记本</a>
					    <dl class="layui-nav-child">
					      <dd><a href="javascript:;">默认分组</a></dd>
					      <dd><a href="javascript:;">选项二</a></dd>
					      <dd><a href="javascript:;">选项三</a></dd>
					      <dd><a href="">跳转项</a></dd>
					    </dl>
					  </li>
					  <li class="layui-nav-item">
					    <a href="javascript:;">测试分组</a>
					    <dl class="layui-nav-child">
					      <dd><a href="">网址一</a></dd>
					      <dd><a href="">网址二</a></dd>
					      <dd><a href="">网址三</a></dd>
					    </dl>
					  </li>
					  <li class="layui-nav-item"><a href="">其他分组</a></li>
					</ul>
				 -->
					<div style="display: inline-block; width: 200px; padding: 10px; overflow: auto;">
					  <ul id="pwdtree"></ul>
					</div>
				</div>
				
				<!-- 中部笔记本显示  -->
				<div class="col-md-8">
				<div class="panel panel-default">
				  <div class="panel-heading">默认分组</div>
					<div class="list-group">
					  <a href="#" class="list-group-item">
					    <h1 class="list-group-item-heading">某某某笔记本</h1>
					    <p class="list-group-item-text">创建时间等信息</p>
					  </a>
					  <a href="#" class="list-group-item">
					    <h1 class="list-group-item-heading">某某某笔记本</h1>
					    <p class="list-group-item-text">创建时间等信息</p>
					  </a>
					  <a href="#" class="list-group-item">
					    <h1 class="list-group-item-heading">某某某笔记本</h1>
					    <p class="list-group-item-text">创建时间等信息</p>
					  </a>
					</div>
					</div>
				</div>
			</div>
				<!-- 右侧文本编辑和功能按钮  -->
				<div class="col-md-6">
				
					<textarea class="layui-textarea" id="LAY_demo1" style="display: none">  
					  把编辑器的初始内容放在这textarea即可
					</textarea>
					
					<input class="btn btn-lg btn-primary btn-block" type="button" value="保存">
					
					<br/>
					<br/>
					<br/>
					<p>测试用按钮，以后删除</p>
					<div class="site-demo-button" style="margin-top: 20px;">
					  <button class="layui-btn site-demo-layedit" data-type="content">获取编辑器内容</button>
					  <button class="layui-btn site-demo-layedit" data-type="text">获取编辑器纯文本内容</button>
					  <button class="layui-btn site-demo-layedit" data-type="selection">获取编辑器选中内容</button>
					</div>
				</div>
			</div>
			</div>
		</div>

</body>
</html>