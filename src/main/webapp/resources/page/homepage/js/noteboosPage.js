
/**
 * 从后台获取当前用户的目录树
 */


function getTreeById(){
	var beginspaceid = "";
	if(returnPageType()!=""){
		//页面类型控制区、根据页面后面的参数控制页面加载
		if(returnPageType()=="team"){
			beginspaceid = getteamspaceid();
		}
		if(returnPageType()=="lastread"){
			var lastread = getSessionByName("lastread");
			beginspaceid = lastread.split(",")[0];
			quickloadlist(lastread.split(",")[1]);
		}
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
 * 快速打开加载
 */
function quickloadlist(bookid){
	$.ajax({
		type:"GET",
		url:getUrl()+"/query/getquickload",
		dataType:"json",
		timeout:2000,
		success:function(result){
			if(result.retflag==0){
				loadbooklist(result.booklist,$("#pwdlist"),result.booklist[0].spaceid,loadtextarea);
				loadtextarea(bookid);
			}
			if(result.retflag==1){
				loadbooklist(result.booklist,$("#pwdlist"),result.booklist[0].spaceid,loadtextarea);
			}
		},
		error:function(msg){
			alertmsg("error");
		}
	});
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
	  
	  createtree(".edittree",edittreefunc,str,"#edittreelist");
	  
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
 * 编辑树回调函数
 * @param item
 * @param target
 */
function edittreefunc(item,target){
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
				loadbooklist(result.booklist,$(tar),spaceid,editinputfunc);
				$('#editpwdid').val(item.id);
				$('#editpwdname').val(item.name);
			}
			if(result.retflag==1){
				loadbooklist(result.booklist,$(tar),spaceid,editinputfunc);
				$('#editpwdid').val(item.id);
				$('#editpwdname').val(item.name);
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
	$('#deletebookid').text(bookid);
	$('#deletebookname').text("笔记本："+bookname);
}

function editinputfunc(bookid,bookname){
	$('#editbookid').val(bookid);
	$('#editbookname').val(bookname);
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
				$('#movespacename').append("目录："+item.name);
				$('#movebookid').empty();
				$('#movebookname').empty();
				
			}
			if(result.retflag==1){
				loadbooklist(result.booklist,$(tar),spaceid,addmovename);
				$('#movespaceid').empty();
				$('#movespaceid').append(item.id);
				$('#movespacename').empty();
				$('#movespacename').append("目录："+item.name);
				$('#movebookid').empty();
				$('#movebookname').empty();
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
	$('#movetoid').empty();
	$('#movetoid').append(item.id);
	$('#movetoname').empty();
	$('#movetoname').append("目录："+item.name);
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
				$('#deletebookid').text(item.id);
				$('#deletebookname').text("目录："+item.name);
			}
			if(result.retflag==1){
				loadbooklist(result.booklist,$(tar),spaceid,deletename);
				$('#deletebookid').text(item.id);
				$('#deletebookname').text("目录："+item.name);
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
	$('#editpwdnamebtn').on('click',function(){
		var spaceid = $('#editpwdid').val();
		var spacename = $('#editpwdname').val();
		if(spaceid==""||spacename==""){
			alertmsg("你还没有选择要修改的节点");
		}
		var data = {
				spaceid:spaceid,
				spacename:spacename
		}
		$.ajax({
			type:"GET",
			url:getUrl()+"/spaceController/update",
			data:data,
			dataType:"json",
			timeout:2000,
			success:function(result){
				if(result.retflag==0){
					alertmsg(result.msg);
					loadtree();
				}
				if(result.retflag==1){
					alertmsg(result.msg);
				}
			},
			error:function(msg){
				alertmsg("error");
			}
		});
	})
	$('#editbooknamebtn').on('click',function(){
		var bookid = $('#editbookid').val();
		var bookname = $('#editbookname').val();
		if(bookid==""||bookname==""){
			alertmsg("你还没有选择要修改的内容");
		}
		var data = {
				notebookid:bookid,
				notebookname:bookname
		}
		$.ajax({
			type:"GET",
			url:getUrl()+"/notebook/update",
			data:data,
			dataType:"json",
			timeout:2000,
			success:function(result){
				if(result.retflag==0){
					alertmsg(result.msg);
						var tar = "#edittreelist";
						var spaceid = $('.treelistid').text();
						var data1={
								spaceid:spaceid
						}
						$.ajax({
							type:"GET",
							url:getUrl()+"/notebook/getbooklist",
							data:data1,
							dataType:"json",
							timeout:2000,
							success:function(result){
								if(result.retflag==0){
									loadbooklist(result.booklist,$(tar),spaceid,editinputfunc);
								}
								if(result.retflag==1){
									loadbooklist(result.booklist,$(tar),spaceid,editinputfunc);
								}
							},
							error:function(msg){
								alertmsg('error');
							}
						});
				}
				if(result.retflag==1){
					alertmsg(result.msg);
				}
			},
			error:function(msg){
				alertmsg("error");
			}
		});
	})
	
	
	$('#movebtn').on('click',function(){
		$('#movebtn_panel').css("display","block");
	})
	$('#cancelmovebtn').on('click',function(){
		$('#movebtn_panel').css("display","none");
	})
	$('#makemovebtn').on('click',function(){
		var spacefromid = $('#movespaceid').text();
		var spacetoid = $('#movetoid').text();
		var bookid = $('#movebookid').text();
		//下面进行逻辑判断	1移动目录  2移动笔记本
		var moveid = "";
		var data = {};
		var url = "";
		if(bookid==null||bookid==""){
			if(spacefromid==null||spacefromid==""){
				alertmsg("笔记本或者目录至少选择一样~");
				return;
			}else{
				moveid = spacefromid;
				if(spacetoid==null||spacetoid==""){
					alertmsg("请先选择移动至哪个目录~");
					return;
				}
				if(moveid==spacetoid){
					alertmsg("不能将目录移动到他自己下面= =");
					return;
				}
				url = getUrl()+"/spaceController/update";

				data={
						spaceid:moveid,
						parentid:spacetoid
				}
			}
		}else{
			moveid = bookid;
			url = getUrl()+"/notebook/update";
			if(spacetoid==null||spacetoid==""){
				alertmsg("请先选择移动至哪个目录~");
				return;
			}
			data={
					notebookid:moveid,
					spaceid:spacetoid
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
					alertmsg("移动成功");
					$('#movebtn_panel').css("display","none");
					loadtree();
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
		var deleteid = $('#deletebookid').text();
		var deletename = $('#deletebookname').text();
		if(deleteid==null||deleteid==""){
			alertmsg("请选择要删除的内容");
			return;
		}
		var data={};
		var url="";
		if(deletename.indexOf("目录")>=0){
			data={
					spaceid:deleteid,
			}
			url = getUrl()+"/spaceController/delete";
		}else if(deletename.indexOf("笔记本")>=0){
			data={
					notebookid:deleteid,
			}
			url = getUrl()+"/notebook/delete";
		}else{
			alert(deletename);
			return;
		}
		$.ajax({
			type:"GET",
			url:url,
			data:data,
			dataType:"json",
			timeout:2000,
			success:function(result){
				if(result.retflag==0){
					alertmsg(result.msg);
					$('#deletebtn_panel').css("display","none");
					if(deletename.indexOf("目录")>=0){
						loadtree();
					}
				}
				if(result.retflag==1){
					alertmsg(result.msg);
				}
			},
			error:function(msg){
				alertmsg("error");
			}
		});
	})
}