
//生成树
layui.use(['tree', 'layer'], function(){
  var layer = layui.layer
  ,$ = layui.jquery; 
  
  
  //去后台制作一个json返回，然后这里调用
  var str = [ //节点
              {
                  "name": "默认文件夹",
                  "id": 1
                  ,"children": [
                    {
                      "name": "分组一"
                      ,"id": 11
                    }, {
                      "name": "分组二"
                      ,"id": 12,
                      "children":[
						{
						    "name": "子分组一"
						    ,"id": 11
						 },
						 {
							   "name": "子分组二"
							    ,"id": 11
							 }
                       ]
                    
                    }, {
                      "name": "分组三"
                      ,"id": 13
                    }
                  ]
                }];
  
  //生成树的函数
  layui.tree({
    elem: '#pwdtree' //指定元素
    ,target: '_blank' //是否新选项卡打开（比如节点返回href才有效）
    ,click: function(item){ //点击节点回调
      layer.msg('当前节名称：'+ item.name + '<br>全部参数：'+ JSON.stringify(item));
//      console.log(item);
    }
    ,nodes: str
  });
  layui.tree({
	    elem: '#addtree' //指定元素
	    ,target: '_blank' //是否新选项卡打开（比如节点返回href才有效）
	    ,click: function(item){ //点击节点回调
	      layer.msg('当前节名称：'+ item.name + '<br>全部参数：'+ JSON.stringify(item));
//	      console.log(item);
	    }
	    ,nodes: str
	  });
  layui.tree({
	  elem: '#movetreeone' //指定元素
		  ,target: '_blank' //是否新选项卡打开（比如节点返回href才有效）
			  ,click: function(item){ //点击节点回调
				  layer.msg('当前节名称：'+ item.name + '<br>全部参数：'+ JSON.stringify(item));
//	      console.log(item);
			  }
  ,nodes: str
  });
  layui.tree({
	  elem: '#movetreetwo' //指定元素
		  ,target: '_blank' //是否新选项卡打开（比如节点返回href才有效）
			  ,click: function(item){ //点击节点回调
				  layer.msg('当前节名称：'+ item.name + '<br>全部参数：'+ JSON.stringify(item));
//	      console.log(item);
			  }
  ,nodes: str
  });
  
});
  






layui.use('element', function(){
  var element = layui.element(); //导航的hover效果、二级菜单等功能，需要依赖element模块
  
  //监听导航点击
  element.on('nav(demo)', function(elem){
    //console.log(elem)
    layer.msg(elem.text());
  });
});

layui.use('layedit', function(){
	  var layedit = layui.layedit
	  ,$ = layui.jquery;
	  
	  //构建一个默认的编辑器
	  var index = layedit.build('LAY_demo1');
	  
	  //编辑器外部操作
	  var active = {
	    content: function(){
	      alert(layedit.getContent(index)); //获取编辑器内容
	    }
	    ,text: function(){
	      alert(layedit.getText(index)); //获取编辑器纯文本内容
	    }
	    ,selection: function(){
	      alert(layedit.getSelection(index));
	    }
	  };
	  
	  $('.site-demo-layedit').on('click', function(){
	    var type = $(this).data('type');
	    active[type] ? active[type].call(this) : '';
	  });
	  
	  //自定义工具栏
	  layedit.build('LAY_demo2', {
	    tool: ['face', 'link', 'unlink', '|', 'left', 'center', 'right']
	    ,height: 100
	  })
	});






window.onload = function(){
	$("#homeTitle").load("homeTitle.jsp", function() {
		$('#gotohomepage').on('click',function(){
			window.location.href=getUrl()+"/page/homepage/homePage.jsp";
		})
    });
	$('#addbtn').on('click',function(){
		$('#addbtn_panel').css("display","block");
	})
	$('#canceladdbtn').on('click',function(){
		//在关闭这个页面之前，最好做重置，等待重置按钮在后续优化
		$('#addbtn_panel').css("display","none");
	})
	$('#editbtn').on('click',function(){
		$('#editbtn_panel').css("display","block");
	})
	$('#canceleditbtn').on('click',function(){
		//在关闭这个页面之前，最好做重置，等待重置按钮在后续优化
		$('#editbtn_panel').css("display","none");
	})
	
	$('#gotohomepagebtn').on('click',function(){
		window.location.href=getUrl()+"/page/homepage/homePage.jsp";
	})
	
}