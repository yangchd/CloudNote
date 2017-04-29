
/**
 * 从后台获取当前用户的目录树
 */
function getTreeById(){
	var thisURL = document.URL;
	var getval  = thisURL.split("?")[1];
	var beginspaceid = "";
	if(getval!=null&&getval!=""){
		beginspaceid = getval.split("=")[1];
	}else{
		beginspaceid = "";
	}
	var data = {
			spaceid:beginspaceid
	}
	var tree="";
	$.ajax({
		type:"GET",
		url:getUrl()+"/spaceController/gettree",
		dataType:"json",
		data:data,
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
			alertmsg("error");
		}
	});
	return tree;
}


/**
 * 生成树函数 
 *  target为生成树位置 
 *  func为点击回调函数 
 *  str为树结构
 *  listtarget为当前树控制列表的位置
 */
function createtree(target,func,str,listtarget){
	var listtar = listtarget;
	var tar = target;
	//生成之前先清空
	$(tar).empty();
	  layui.tree({
		    elem: tar //指定元素
		    ,click: function(item){
		    	func(item,listtar);
		    }
		    ,nodes: str
	  });
}

/**
 * 生成树函数
 */
function loadtree(){
	layui.use(['tree', 'layer'], function(){
	  var layer = layui.layer
	  ,$ = layui.jquery; 
	  //获取树结构
	  var str = eval('(' + getTreeById() + ')'); ;
	  //生成树
	  createtree(".pwdtree",pwdtree,str,"#pwdlist");
	  createtree(".addtree",addtree,str);
	  createtree(".movetreeone",movefromtree,str,"#movetreeonelist");
	  createtree(".movetreetwo",movetotree,str,"#movetreetwolist");
	  createtree(".deletetree",deletetree,str,"#deletetreelist");
	  
	});
}


/**
 * 主面板生成树回调函数
 * item 为传入当前点击节点信息
 * target为生成列表位置
 */
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
				//根据查询到的结果生成显示列表
				loadbooklist(result.booklist,$(tar),spaceid,loadtextarea);
			}
			if(result.retflag==1){
				loadbooklist(result.booklist,$(tar),spaceid,loadtextarea);
			}
		},
		error:function(msg){
			alertmsg("error");
		}
	});
}

/**
 * 新增面板树函数
 * @param item
 */
function addtree(item){
	$('#addtreename').val(item.name);
	$('#addtreeid').val(item.id);
}

function addmovename(bookid,bookname){
	$('#movebookid').empty();
	$('#movebookid').append(bookid);
	$('#movebookname').empty();
	$('#movebookname').append(bookname);
}
function deletename(bookid,bookname){
	$('#deletebookid').empty();
	$('#deletebookid').append(bookid);
	$('#deletebookname').empty();
	$('#deletebookname').append(bookname);
}

/**
 * 移动树点击回调函数
 */
function movefromtree(item,target){
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
				loadbooklist(result.booklist,$(tar),spaceid,addmovename);
				$('#movespaceid').empty();
				$('#movespaceid').append(item.id);
				$('#movespacename').empty();
				$('#movespacename').append("目录："+item.name+"下  ");
			}
			if(result.retflag==1){
				loadbooklist(result.booklist,$(tar),spaceid,addmovename);
			}
		},
		error:function(msg){
			alertmsg("error");
		}
	});
}
function movetotree(item,target){
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
				loadbooklist(result.booklist,$(tar),spaceid,addmovename);
				$('#movetoid').empty();
				$('#movetoid').append(item.id);
				$('#movetoname').empty();
				$('#movetoname').append("目录："+item.name+"下  ");
			}
			if(result.retflag==1){
				loadbooklist(result.booklist,$(tar),spaceid,addmovename);
			}
		},
		error:function(msg){
			alertmsg("error");
		}
	});
}

/**
 * 删除回调函数
 * @param item
 * @param target
 */
function deletetree(item,target){
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
				loadbooklist(result.booklist,$(tar),spaceid,deletename);
			}
			if(result.retflag==1){
				loadbooklist(result.booklist,$(tar),spaceid,deletename);
			}
		},
		error:function(msg){
			alertmsg("error");
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
			alertmsg("请先选择路径");
			return;
		}
		if(spacename==null||spacename==""){
			alertmsg("名称不能为空");
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
					alertmsg("新增成功");
				}
				if(result.retflag==1){
				}
			},
			error:function(msg){
				alertmsg("error");
			}
		});
	})
	
	
	
	$('#editbtn').on('click',function(){
		$('#editbtn_panel').css("display","block");
	})
	$('#canceleditbtn').on('click',function(){
		$('#editbtn_panel').css("display","none");
	})
	$('#movebtn').on('click',function(){
		var spaceid = $('#movetoid').text();
		var bookid = $('#movebookid').text();
		if(bookid==null||bookid==""){
			alertmsg("您还没有选择要移动的笔记本~");
			return;
		}
		if(spaceid==null||spaceid==""){
			alertmsg("请先选择移动至哪个目录");
			return;
		}
		var data={
				notebookid:bookid,
				spaceid:spaceid
		}
		$.ajax({
			type:"GET",
			url:getUrl()+"/notebook/update",
			data:data,
			dataType:"json",
			timeout:2000,
			success:function(result){
				if(result.retflag==0){
					alertmsg("移动成功");
					$('#editbtn_panel').css("display","none");
				}
				if(result.retflag==1){
				}
			},
			error:function(msg){
				alertmsg("error");
			}
		});
	})
	
	
	
	$('#deletebtn').on('click',function(){
		$('#deletebtn_panel').css("display","block");
	})
	$('#canceldeletebtn').on('click',function(){
		$('#deletebtn_panel').css("display","none");
	})
	$('#deletebookbtn').on('click',function(){
		var bookid = $('#deletebookid').text();
		if(bookid==null||bookid==""){
			alertmsg("请选择要删除的笔记本~");
			return;
		}
		var data={
				notebookid:bookid,
		}
		$.ajax({
			type:"GET",
			url:getUrl()+"/notebook/delete",
			data:data,
			dataType:"json",
			timeout:2000,
			success:function(result){
				if(result.retflag==0){
					alertmsg("删除成功");
					$('#deletebtn_panel').css("display","none");
				}
				if(result.retflag==1){
				}
			},
			error:function(msg){
				alertmsg("error");
			}
		});
	})
	
	
	
	
}