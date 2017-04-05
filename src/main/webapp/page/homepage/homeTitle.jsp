<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
 <!-- 上部菜单栏 -->
	      <nav class="navbar navbar-default" role="navigation">
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
	              <li><a href="#">Link</a></li>
	              <li><a href="#">Link</a></li>
	              <li><a href="#">Link</a></li>
	              <li class="dropdown">
	                <a href="#" class="dropdown-toggle" data-toggle="dropdown">更多 <span class="caret"></span></a>
	                <ul class="dropdown-menu" role="menu">
	                  <li><a href="#">Action</a></li>
	                  <li><a href="#">Another action</a></li>
	                  <li><a href="#">Something else here</a></li>
	                  <li class="divider"></li>
	                  <li class="dropdown-header">Nav header</li>
	                  <li><a href="#">Separated link</a></li>
	                  <li><a href="#">One more separated link</a></li>
	                </ul>
	              </li>
	            </ul>
	          </div><!--/.nav-collapse -->
	        </div><!--/.container-fluid -->
	      </nav>
</body>
</html>