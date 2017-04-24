
/**
 * 从后台获取当前用户的树
 */
function getTreeById(){
	var tree="";
	$.ajax({
		type:"GET",
		url:getUrl()+"/spaceController/gettree",
		dataType:"json",
		async:false,
		timeout:2000,
		success:function(result){
			if(result.retflag==0){
				tree = result.tree;
			}
			if(result.retflag==1){
			}
		},
		error:function(msg){
			alert(JSON.stringify(msg));
		}
	});
	return tree;
}



//生成树
layui.use(['tree', 'layer'], function(){
  var layer = layui.layer
  ,$ = layui.jquery; 
  var str = eval('(' + getTreeById() + ')'); ;
  
  
  //生成树的函数
  layui.tree({
    elem: '.pwdtree' //指定元素
    ,target: '_blank' //是否新选项卡打开（比如节点返回href才有效）
    ,click: function(item){ //点击节点回调
      layer.msg('当前节名称：'+ item.name + '<br>全部参数：'+ JSON.stringify(item));
    }
    ,nodes: str
  });
  
  layui.tree({
	    elem: '.addtree' //指定元素
	    ,target: '_blank' //是否新选项卡打开（比如节点返回href才有效）
	    ,click: function(item){ //点击节点回调
	    }
	    ,nodes: str
	  });
  
  layui.tree({
	  elem: '.movetreeone' //指定元素
		  ,target: '_blank' //是否新选项卡打开（比如节点返回href才有效）
			  ,click: function(item){ //点击节点回调
			  }
  ,nodes: str
  });
  
  layui.tree({
	  elem: '.movetreetwo' //指定元素
		  ,target: '_blank' //是否新选项卡打开（比如节点返回href才有效）
			  ,click: function(item){ //点击节点回调
			  }
  ,nodes: str
  });
  
  layui.tree({
	  elem: '.deletetree' //指定元素
		  ,target: '_blank' //是否新选项卡打开（比如节点返回href才有效）
			  ,click: function(item){ //点击节点回调
			  }
  ,nodes: str
  });
  
});
  



//layui.use('element', function(){
//  var element = layui.element(); //导航的hover效果、二级菜单等功能，需要依赖element模块
//  
//  //监听导航点击
//  element.on('nav(demo)', function(elem){
//    //console.log(elem)
//    layer.msg(elem.text());
//  });
//});



window.onload = function(){
	//页面加载部分
	$("#homeTitle").load("homeTitle.jsp", function() {
		homeTitle();
    });
	$(".notebooklist").load("notebooklist.jsp", function() {
	});
	$(".textareaPage").load("textareaPage.jsp", function() {
		createtext();
	});
	
	
	$('#addbtn').on('click',function(){
		$('#addbtn_panel').css("display","block");
	})
	$('#canceladdbtn').on('click',function(){
		//在关闭这个页面之前，最好做重置，等待重置按钮在后续优化
		$('#addbtn_panel').css("display","none");
	})
	$('#paneladdbtn').on('click',function(){
		$.ajax({
			type:"GET",
			url:getUrl()+"/spaceController/gettree",
			dataType:"json",
			timeout:2000,
			success:function(result){
				if(result.retflag==0){
				}
				if(result.retflag==1){
				}
			},
			error:function(msg){
				alert(JSON.stringify(msg));
			}
		});
	})
	
	
	
	$('#editbtn').on('click',function(){
		$('#editbtn_panel').css("display","block");
	})
	$('#canceleditbtn').on('click',function(){
		//在关闭这个页面之前，最好做重置，等待重置按钮在后续优化
		$('#editbtn_panel').css("display","none");
	})
	$('#deletebtn').on('click',function(){
		$('#deletebtn_panel').css("display","block");
	})
	$('#canceldeletebtn').on('click',function(){
		//在关闭这个页面之前，最好做重置，等待重置按钮在后续优化
		$('#deletebtn_panel').css("display","none");
	})
	
	$('#gotohomepagebtn').on('click',function(){
		window.location.href=getUrl()+"/page/homepage/homePage.jsp";
	})
	
}