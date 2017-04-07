<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="mx" tagdir="/WEB-INF/tags"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查询界面</title>

<mx:commonlink/>
<link href="../../resources/page/homepage/css/homePage.css" rel="stylesheet">
<script type="text/javascript" src="../../resources/page/homepage/js/queryPage.js"></script>

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
		<div class="panel panel-default">
			<div class="panel-heading">推荐</div>
			<div class="panel-body">
				<a>暂时无内容</a>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="col-md-3">
					<div class="input-group">
						<input type="text" class="form-control"
							placeholder="Search for..."> <span
							class="input-group-btn">
							<button class="btn btn-default" type="button">搜索</button>
						</span>
					</div>
				</div>
				<div class="col-md-9">
					
				</div>
				<div class="col-md-12">
					<textarea class="layui-textarea">
					</textarea>
				</div>
				
			</div>
		</div>
	</div>

</body>
</html>