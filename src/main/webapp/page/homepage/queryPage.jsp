<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="mx" tagdir="/WEB-INF/tags"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查询界面</title>

<mx:commonlink/>
<script type="text/javascript" src="../../resources/page/homepage/js/queryPage.js"></script>

</head>
<body>
	<div class="container">
		<nav class="navbar navbar-default" role="navigation" style="height:50px;">
		<div id="homeTitle">
			<!-- 这里加载homeTitle页面 -->
		</div>
		</nav>
	</div>
	<div class="container" style="display: none">
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
						<input type="text" id="searchkey" class="form-control" placeholder="Search for...">
						<span class="input-group-btn">
							<button class="btn btn-default" id="searchbtn" type="button">搜索</button>
						</span>
					</div>
					<div class="notebooklist" id="querylist" style="margin-top: 30px;">
						<!-- 这里加载笔记本列表 -->
					</div>
				</div>
				<div class="col-md-9">
					<div class="textareaPage">
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>