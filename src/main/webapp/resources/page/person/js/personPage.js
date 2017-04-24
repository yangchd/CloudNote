/**
 * 
 */

function personvalue(){
	var data = {
			id : getUserID()
	}
	$.ajax({
		type:"GET",
		url:getUrl()+"/person/getPersonValue",
		dataType:"json",
		data:data,
		timeout:2000,
		success:function(result){
			if(result.retflag==0){
				$('#personname').val(result.person.username);
				$('#email').val(result.person.email);
				$('#mobile').val(result.person.mobile);
			}
			if(result.retflag==1){
				window.location.href=getUrl()+"/page/login/login.jsp";
			}
		},
		error:function(msg){
			alert(JSON.stringify(msg));
		}
	});
			
}

window.onload = function(){
	//加载上部列表
	$("#homeTitle").load("../homepage/homeTitle.jsp", function() {
		homeTitle();
    });
	
	//加载个人信息
	personvalue();
	
	//修改按钮
	$('#editbtn').on('click',function(){
		$('#editbtndiv').css("display","block");
	})
	$('#cancelbtn').on('click',function(){
		$('#editbtndiv').css("display","none");
	})
	
	//修改按钮
	$('#updatebtn').on('click',function(){
		var data = {
				id : getUserID(),
				username:$("#personname").val(),
				email:$("#email").val(),
				mobile:$("#mobile").val()
		}
		$.ajax({
			type:"GET",
			url:getUrl()+"/person/update",
			dataType:"json",
			data:data,
			timeout:2000,
			success:function(result){
				if(result.retflag==0){
					alert("修改成功");
					$('#editbtndiv').css("display","none");
				}
				if(result.retflag==1){
					window.location.href=getUrl()+"/page/login/login.jsp";
				}
			},
			error:function(msg){
				alert(JSON.stringify(msg));
			}
		});
	});
}

