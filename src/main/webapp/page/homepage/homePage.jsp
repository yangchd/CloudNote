<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>主页</title>

<link href="../../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="../../resources/homepage/css/homePage.css" rel="stylesheet">

<script type="text/javascript" src="../../resources/homepage/js/homePage.js"></script>
<script type="text/javascript" src="../../resources/jquery.js"></script>
<script type="text/javascript" src="../../resources/bootstrap/js/bootstrap.min.js"></script>

</head>

<body>
	<div id="homePage_top">
		<div class="container">
	
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
	            <a class="navbar-brand" href="#">CodeStation</a>
	          </div>
	          <div id="navbar" class="navbar-collapse collapse">
	            <ul class="nav navbar-nav" id="homePage_ul">
	              <li><a href="#">Link</a></li>
	              <li><a href="#">Link</a></li>
	              <li><a href="#">Link</a></li>
	              <li class="dropdown">
	                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <span class="caret"></span></a>
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
	             <form class="navbar-form navbar-right" role="form">
		            <div class="form-group">
		              <input type="text" placeholder="Email" class="form-control">
		            </div>
		            <div class="form-group">
		              <input type="password" placeholder="Password" class="form-control">
		            </div>
		            <button type="submit" class="btn btn-primary">Sign in</button>
		          </form>
	          </div><!--/.nav-collapse -->
	        </div><!--/.container-fluid -->
	      </nav>
	
	      <!-- 上部图文区 -->
	      <div class="jumbotron">
	        <h1>Personal Page</h1>
	        <p>This example is a quick exercise . It includes the responsive CSS and HTML</p>
	        <p>Author：杨昌迪</p>
	        <p>
	          <a class="btn btn-lg btn-primary" href="../errorPage/notOpenPage.html" role="button">View details &raquo;</a>
	        </p>
	      </div>
	    </div> <!-- /container -->
	</div><!-- homePage_top -->

	<div class="container" id="homePage_middle">
		<div class="row" style="text-align: center;">
            <div class="col-md-4">
	          <h2>Exercise Code</h2>
	          <p>There's something code write during study.</p>
	          <p><a class="btn btn-default" href="" role="button">View details &raquo;</a></p>
	        </div>
            <div class="col-md-4">
	          <h2>weibo</h2>
	          <p>There's nothing here.</p>
	          <p><a class="btn btn-default" href="" role="button">View details &raquo;</a></p>
	        </div>
            <div class="col-md-4">
	          <h2>Cloud notes</h2>
			  <p>There's nothing here.</p>
			  <p><a class="btn btn-default" href="../CloudNote/cloudNotePage.html" role="button">View details &raquo;</a></p>
	        </div>
        </div>
        <footer style="text-align: center;">
        	<p>&copy; The website is made by Yang Changdi</p>
      	</footer>
	</div>
	<div id="homePage_bottom">
		
	</div>
</body>
</html>