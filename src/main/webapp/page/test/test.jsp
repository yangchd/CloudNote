<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script type="text/javascript" src="../../resources/jquery.js"></script>
<script type="text/javascript">

window.onload = function(){
	$('#testbtn').on('click',function(){
		$.ajax({
			url:"localhost:8080/cloudnote/getUserMsg",
			type:"GET",
			dataType: 'json',
            timeout: 2000,
            success:function(msg){
            	alert(msg);
            },
            error:function(data){
            	alert(data);
            }
		})
	})
}

</script>
</head>
<body>
<h1>helloworld!</h1>
<button id="testbtn">click me</button>
</body>
</html>