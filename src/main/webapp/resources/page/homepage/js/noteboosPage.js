
/**
 * 从后台获取当前用户的目录树
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


/**
 * 生成树函数 
 *  target为生成树位置 
 *  this为指定地点 
 *  str为树结构
 *  listtarget为对应列表位置
 */
function createtree(target,func,str,listtarget){
	var listtar = listtarget;
	var tar = target;
	  layui.tree({
		    elem: tar //指定元素
		    ,click: function(item){
		    	func(item,listtar);
		    }
		    ,nodes: str
	  });
}


function loadtree(){
	//生成树
	layui.use(['tree', 'layer'], function(){
	  var layer = layui.layer
	  ,$ = layui.jquery; 
	  //获取树结构
	  var str = eval('(' + getTreeById() + ')'); ;
	  //生成树
	  $('.pwdtree').empty();
	  $('.addtree').empty();
	  $('.movetreeone').empty();
	  $('.movetreetwo').empty();
	  $('.deletetree').empty();
	  createtree(".pwdtree",pwdtree,str,"#pwdlist");
	  createtree(".addtree",addtree,str);
	  createtree(".movetreeone",booklisttree,str,"#movetreeonelist");
	  createtree(".movetreetwo",booklisttree,str,"#movetreetwolist");
	  createtree(".deletetree",booklisttree,str,"#deletetreelist");
	  
	});
}


//主面板函数
function pwdtree(item,target){
	var tar = target;
	var spaceid = item.id;
	var data={
			spaceid:spaceid
	}
	$.ajax({
		type:"GET",
		url:getUrl()+"/notebook/getbooklist",
		data:data,
		dataType:"json",
		timeout:2000,
		success:function(result){
			if(result.retflag==0){
				loadbooklist(result.booklist,$(tar));
				$('.list-group-item').on('click',function(){
					var booklistid = $(this).find('#booklistid').text();
					//将信息加载到编辑区
					for(var i=0;i<result.booklist.length;i++){
						if(result.booklist[i].notebookid==booklistid){
							loadtextarea(result.booklist[i],$(tar));
						}
					}
				})
			}
			if(result.retflag==1){
				loadbooklist(result.booklist,$(tar));
			}
		},
		error:function(msg){
			alert(JSON.stringify(msg));
		}
	});
}

//新增面板树函数
function addtree(item){
	$('#addtreename').val(item.name);
	$('#addtreeid').val(item.id);
}


function addmovename(){
	var name = $(this).find("#title").val();
	alert(name);
}

function booklisttree(item,target){
	var tar = target;
	var spaceid = item.id;
	var data={
			spaceid:spaceid
	}
	$.ajax({
		type:"GET",
		url:getUrl()+"/notebook/getbooklist",
		data:data,
		dataType:"json",
		timeout:2000,
		success:function(result){
			if(result.retflag==0){
				loadbooklist(result.booklist,$(tar));
				$('#movefrom').empty();
				$('#movefrom').append("目录："+item.name+"下  ");
			}
			if(result.retflag==1){
				loadbooklist(result.booklist,$(tar));
			}
		},
		error:function(msg){
			alert(JSON.stringify(msg));
		}
	});
}

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
	
	//加载所有树状结构
	loadtree();
	
	$('#addbtn').on('click',function(){
		$('#addbtn_panel').css("display","block");
	})
	$('#canceladdbtn').on('click',function(){
		$('#addbtn_panel').css("display","none");
	})
	$('#paneladdbtn').on('click',function(){
		//先判断输入
		var spaceid=$('#addtreeid').val();
		var spacename=$('#addname').val();
		if(spaceid==null||spaceid==""){
			alert("请先选择路径");
			return;
		}
		if(spacename==null||spacename==""){
			alert("名称不能为空");
			return;
		}
		
		var type = $('#addtype').val();
		var data={};
		var url="";
		if(type=="1"){
			url = getUrl()+"/notebook/createbook";
			data={
					spaceid:spaceid,
					notebookname:spacename
			}
		}
		if(type=="2"){
			url=getUrl()+"/spaceController/createspace";
			data={
					parentid:spaceid,
					spacename:spacename
			}
		}
		$.ajax({
			type:"GET",
			url:url,
			data:data,
			dataType:"json",
			timeout:2000,
			success:function(result){
				if(result.retflag==0){
					if(type=="2"){
						loadtree();
					}
					$('#addbtn_panel').css("display","none");
					alert("新增成功");
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
	
	
}