<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>cloudnote</title>

    <link href="../../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../../resources/login/css/login.css" rel="stylesheet">
    
    <script type="text/javascript" src="../../resources/jquery.js"></script>
    <script type="text/javascript" src="../../resources/tool.js"></script>
    <script type="text/javascript" src="../../resources/login/js/login.js"></script>

  </head>

  <body>

    <div class="container">
      <form class="form-signin" role="form">
        <h2 class="form-signin-heading">Login</h2>
        <!-- required -->
        <input type="text" class="form-control" id="username" placeholder="Email address"  autofocus>
        <input type="password" class="form-control" id="password" placeholder="Password" >
        <input type="button" class="btn btn-lg btn-primary btn-block" id="loginbtn" value="Sign in"/>
      </form>
    </div> <!-- /container -->

  </body>
</html>
