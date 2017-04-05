<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
 <!-- 上部菜单栏 -->
	        <div class="container-fluid">
	          <div class="navbar-header">
	          	<!-- 上部右侧按钮，宽度不够时出现 -->
	            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
	              <span class="sr-only"></span>
	              <span class="icon-bar"></span>
	              <span class="icon-bar"></span>
	              <span class="icon-bar"></span>
	            </button>
	            <a class="navbar-brand" id="gotohomepage" href="javascript:;">主页</a>
	          </div>
	          <div id="navbar" class="navbar-collapse collapse">
	            <ul class="nav navbar-nav" id="homePage_ul">
	              <li><a href="javascript:;">我的空间</a></li>
	              <li><a href="javascript:;">我的小组</a></li>
	              <li class="dropdown">
	                <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">更多 <span class="caret"></span></a>
	                <ul class="dropdown-menu" role="menu">
	                  <li><a href="javascript:;">待定一</a></li>
	                  <li><a href="javascript:;">待定二</a></li>
	                  <li><a href="javascript:;">待定三</a></li>
	                  <li class="divider"></li>
	                  <li class="dropdown-header">我是分割线</li>
	                  <li><a href="javascript:;">未完成一</a></li>
	                  <li><a href="javascript:;">未完成二</a></li>
	                </ul>
	              </li>
	            </ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="javascript:;">个人名字显示</a></li>
				<li><a href="javascript:;">设置</a></li>
			</ul>
		</div><!--/.nav-collapse -->
	        </div><!--/.container-fluid -->
</body>
</html>