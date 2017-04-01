<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>笔记本</title>

<link href="../../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">


<script type="text/javascript" src="../../resources/jquery.js"></script>
<script type="text/javascript" src="../../resources/bootstrap/js/bootstrap.js"></script>

<link href="../../resources/layui/css/layui.css" rel="stylesheet">
<script type="text/javascript" src="../../resources/layui/layui.js"></script>


<link href="../../resources/page/homepage/css/homePage.css" rel="stylesheet">

<script type="text/javascript" src="../../resources/page/homepage/js/noteboosPage.js"></script>
</head>
<body>

	<div id="homePage_top">
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
			
			<!-- 左侧文件树 -->
			<div>
				<div class="col-md-3">
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
					    <a href="javascript:;">网址收藏</a>
					    <dl class="layui-nav-child">
					      <dd><a href="">网址一</a></dd>
					      <dd><a href="">网址二</a></dd>
					      <dd><a href="">网址三</a></dd>
					    </dl>
					  </li>
					  <li class="layui-nav-item"><a href="">其他</a></li>
					</ul>
				</div>
				<div class="col-md-3">
				<div class="panel panel-default">
				  <!-- Default panel contents -->
				  <div class="panel-heading">默认分组</div>
				  <div class="panel-body">
				    <p>...</p>
				  </div>
				
				
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
				<div class="col-md-6">
					<textarea class="layui-textarea" id="LAY_demo1" style="display: none">  
					  把编辑器的初始内容放在这textarea即可
					</textarea>
					<div class="site-demo-button" style="margin-top: 20px;">
					  <button class="layui-btn site-demo-layedit" data-type="content">获取编辑器内容</button>
					  <button class="layui-btn site-demo-layedit" data-type="text">获取编辑器纯文本内容</button>
					  <button class="layui-btn site-demo-layedit" data-type="selection">获取编辑器选中内容</button>
					</div>
				</div>
			</div>
		</div><!-- /container -->
	</div><!-- homePage_top -->

</body>
</html>