<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<link href="../../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="../../resources/page/login/css/register.css" rel="stylesheet">

<script type="text/javascript" src="../../resources/jquery.js"></script>
<script type="text/javascript" src="../../resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../../resources/page/login/js/register.js"></script>


<title>注册</title>
</head>
<body>
    <div class="container">
      <form class="form-signin" role="form">
        <h2 class="form-signin-heading">Register</h2>
        
        <input type="text" class="form-control" id="username" placeholder="用户名" autofocus>
        <input type="text" class="form-control" id="email" placeholder="email" >
        <input type="text" class="form-control" id="mobile" placeholder="mobile" >
        <input type="password" class="form-control" id="password" placeholder="password" >
        <input type="button" class="btn btn-lg btn-primary btn-block" id="registerbtn" value="注册"/>
      	
      </form>
    </div> <!-- /container -->

</body>
</html>