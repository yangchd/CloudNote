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
			<!-- 上部菜单栏 -->
			<nav class="navbar navbar-default" role="navigation">
			<div class="container-fluid">
				<div class="navbar-header">
					<!-- 上部右侧按钮，宽度不够时出现 -->
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#navbar" aria-expanded="false"
						aria-controls="navbar">
						<span class="sr-only"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span> <span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="">主页</a>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav" id="homePage_ul">
						<li><a href="#">Link</a></li>
						<li><a href="#">Link</a></li>
						<li><a href="#">Link</a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">更多 <span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="#">Action</a></li>
								<li><a href="#">Another action</a></li>
								<li><a href="#">Something else here</a></li>
								<li class="divider"></li>
								<li class="dropdown-header">Nav header</li>
								<li><a href="#">Separated link</a></li>
								<li><a href="#">One more separated link</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
			</nav>
		</div><!-- /container -->
	</div><!-- notebookPage_top -->
	
	<div class="container" id="notebookPage_navigation">
		<!-- 中部按钮菜单栏 -->
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="btn-group" role="group" aria-label="...">
					<input class="btn btn-default" id="addbtn" type="button" value="新增">
					<input class="btn btn-default" id="editbtn" type="button" value="编辑">
					<input class="btn btn-default" id="deletebtn" type="button" value="删除">
				</div>
			</div>
		</div>
		<!-- 新增面板，界面待优化 -->
		<div class="panel panel-default" id="addbtn_panel" style="display: none;">
			<div class="panel-body">
			<form class="form-inline">
				<!-- 下面这些表单使用layui的表单 -->
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">路径</label>
							<div class="layui-input-inline">
								<select class="form-control" style="width: inherit;" name="addpwd">
								  <option value="根目录">根目录</option>
								  <option>选项一</option>
								  <option>测试二</option>
								</select>
							</div>
							<div class="layui-input-inline">
								<select class="form-control" style="width: inherit;" name="addpwd">
								  <option>测试长度</option>
								  <option>选项一</option>
								  <option>测试二</option>
								</select>
							</div>
						<!-- 在输入框后面添加文字的方法
						<div class="layui-form-mid layui-word-aux">请选择创建对象的路径，默认为根目录</div>
						 -->
						</div>
					</div>
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
			</div><!-- panel-body -->
		</div><!-- 新增面板 -->
		
		<!-- 编辑面板，界面待优化 -->
		<div class="panel panel-default" id="editbtn_panel" style="display: none;">
			<div class="panel-body">
			<form class="form-inline">
				<!-- 下面这些表单使用layui的表单 -->
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">移动至</label>
							<div class="layui-input-inline">
								<select class="form-control" style="width: inherit;" name="editpwd">
								  <option value="根目录">根目录</option>
								  <option>选项一</option>
								  <option>测试二</option>
								</select>
							</div>
							<div class="layui-input-inline">
								<select class="form-control" style="width: inherit;" name="editpwd">
								  <option>测试长度</option>
								  <option>选项一</option>
								  <option>测试二</option>
								</select>
							</div>
						<!-- 在输入框后面添加文字的方法
						<div class="layui-form-mid layui-word-aux">请选择创建对象的路径，默认为根目录</div>
						 -->
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">名称</label>
							<div class="layui-input-inline">
								<input type="text" name="editname"  class="form-control">
							</div>
						</div>
					</div>
					<div class="layui-form-item">
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