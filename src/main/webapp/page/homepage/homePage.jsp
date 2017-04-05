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
	      <div id="homeTitle">
	      		<!-- 这里加载homeTitle页面 -->
	      </div>
	
	      <!-- 上部图文区 -->
	      <div class="jumbotron">
	        <h1>欢迎使用云笔记系统</h1>
	        <p>作者：杨昌迪</p>
	        <p>
	          <a class="btn btn-lg btn-primary" href="../errorPage/notOpenPage.html" role="button">View details &raquo;</a>
	        </p>
	      </div>
	    </div>
	</div>

	<div class="container" id="homePage_middle">
		<div class="row" style="text-align: center;">
            <div class="col-md-4">
	          <h2>我的笔记本</h2>
	          <p>在这里你能看到自己所存储的信息</p>
	          <p><a class="btn btn-default" href="javascript:;" role="button" id="personalbtn">点我查看详情 &raquo;</a></p>
	        </div>
            <div class="col-md-4">
	          <h2>我的小组</h2>
	          <p>在这里你能看到和其他小伙伴一起存储的信息</p>
	          <p><a class="btn btn-default" href="" role="button">点我查看详情 &raquo;</a></p>
	        </div>
            <div class="col-md-4">
	          <h2>随便逛逛</h2>
			  <p>这里或许你能找到不认识的小伙伴的资料</p>
			  <p><a class="btn btn-default" href="../CloudNote/cloudNotePage.html" role="button">点我查看详情 &raquo;</a></p>
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