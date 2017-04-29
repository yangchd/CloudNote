<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="mx" tagdir="/WEB-INF/tags"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>云笔记系统</title>
<mx:commonlink/>
<link href="../../resources/page/homepage/css/homePage.css" rel="stylesheet">
<script type="text/javascript" src="../../resources/page/homepage/js/homePage.js"></script>

</head>

<body>
	<div id="homePage_top">
		<div class="container">
		<nav class="navbar navbar-default" role="navigation" style="height:50px;">
	      <div id="homeTitle">
	      		<!-- 这里加载homeTitle页面 -->
	      </div>
		</nav>
	
	      <!-- 上部图文区 -->
	      <div class="col-md-12 jumbotron">
	        <h1 style="padding-bottom: 12px;">欢迎使用云笔记系统</h1>
	        
	        <div class="col-md-6 lastnote" id="lastreadbody" style="display: none;">
	        	<span>上次打开：</span>
	        	<span>
	        		<a href="javascript:;" id="lastreadbtn">
	        			<span id="lastreadid" style="display: none"></span>
	        			<span id="lastreadname"></span>
	        			<span style="padding-left: 30px;" class="glyphicon glyphicon-share-alt"></span>
	        		</a>
	        	</span>
	        </div>
	        <div class="col-md-6" style="display: none">
		        <div class="input-group" style="max-width: 400px;">
					<input type="text" id="searchkey" class="form-control" placeholder="Search for...">
					<span class="input-group-btn">
						<button class="btn btn-default" id="searchbtn" type="button">搜索</button>
					</span>
				</div>
	        </div>
	      </div>
	    </div>
	</div>

	<div class="container" id="homePage_middle">
		<div class="row" style="text-align: center;">
            <div class="col-md-4">
	          <h2 style="padding-bottom: 12px;">我的空间</h2>
	          <p style="padding-bottom: 12px;">在这里你能看到自己所存储的信息</p>
	          <p style="padding-bottom: 12px;"><a class="btn btn-primary" href="javascript:;" role="button" id="personalbtn">点我查看详情 &raquo;</a></p>
	        </div>
            <div class="col-md-4">
	          <h2 style="padding-bottom: 12px;">我的小组</h2>
	          <p style="padding-bottom: 12px;">在这里你能看到和其他小伙伴一起存储的信息</p>
	          <p style="padding-bottom: 12px;"><a class="btn btn-primary" href="javascript:;" role="button" id="teambtn">点我查看详情 &raquo;</a></p>
	        </div>
            <div class="col-md-4">
	          <h2 style="padding-bottom: 12px;">随便逛逛</h2>
			  <p style="padding-bottom: 12px;">这里或许你能找到你需要的资料</p>
			  <p style="padding-bottom: 12px;"><a class="btn btn-primary" href="javascript:;" role="button" id="querybtn">点我查看详情 &raquo;</a></p>
	        </div>
        </div>
	</div>
	<div class="homePage_bottom"  id="homePage_bottom">
		<footer style="text-align: center;margin-top: 50px;">
        	<p>&copy; The website is made by Yang Changdi</p>
      	</footer>
	</div>
</body>
</html>