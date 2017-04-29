
/**
 * 讲对应的笔记本信息加载到textarea里面
 * notebookid 为笔记本id
 */
function loadtextarea(notebookid,booklistname,flag){
	if(notebookid!=null){
		var data = {
				notebookid:notebookid
		}
		$.ajax({
			type:"GET",
			url:getUrl()+"/notebook/getbooklist",
			data:data,
			dataType:"json",
			timeout:2000,
			success:function(result){
				if(result.retflag==0){
					book = result.booklist[0];
					$('#bookid').text(book.notebookid);
					$('#bookname').text(book.notebookname);
					$('#createtime').text(book.createtime.substring(0,10));
					$('#bookarea').text(book.msg);
					if(flag=="false"){
					}else{
						$('#textareatopbtn').css("display","block");
						//这里添加一个上次阅读标记
						var beginspaceid = "";
						if(returnPageType()=="team"){
							beginspaceid = getteamspaceid();
						}else{
							beginspaceid = getUserSpaceId();
						}
						lastreadflag(beginspaceid,notebookid);
					}
					createtext();
				}
				if(result.retflag==1){
					alertmsg('这里什么都没有~');
				}
			},
			error:function(msg){
				alertmsg("error");
			}
		});
	}else{
		$('#bookid').empty();
		$('#bookname').empty();
		$('#createtime').empty();
		$('#bookarea').empty();
		createtext();
	}
}

//将点击页面的开始空间地址和点击的笔记本id记录
function lastreadflag(spaceid,bookid){
	var userid = getUserID();
	var data = {
			id:userid,
			lastread:spaceid+","+bookid
	}
	$.ajax({
		type:"GET",
		url:getUrl()+"/query/insertorupdate",
		dataType:"json",
		data:data,
		timeout:2000,
		success:function(result){
			if(result.retflag==0){
			}
			if(result.retflag==1){
			}
		},
		error:function(msg){
			alertmsg('error');
		}
	});
}

/**
 * 刷新函数
 */
function reloadlist(){
	var tar = "#pwdlist";
	var spaceid = $('.treelistid').text();
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
				loadbooklist(result.booklist,$(tar),spaceid,loadtextarea);
			}
			if(result.retflag==1){
				loadbooklist(result.booklist,$(tar),spaceid,loadtextarea);
			}
		},
		error:function(msg){
			alertmsg('error');
		}
	});
}

/**
 * 加载编辑器函数
 */
function createtext(){
	layui.use('layedit', function(){
		  var layedit = layui.layedit
		  ,$ = layui.jquery;
		  
		  //构建一个默认的编辑器
		  var index = layedit.build('bookarea');
		  
		  $('#save').unbind();
		  $('#save').on('click',function(){
				var bookid = $('#bookid').text();
				var msg = layui.layedit.getContent(index);
				var data={
						notebookid:bookid,
						msg:msg
				}
				$.ajax({
					type:"GET",
					url:getUrl()+"/notebook/update",
					data:data,
					dataType:"json",
					timeout:2000,
					success:function(result){
						if(result.retflag==0){
							reloadlist();
							alertmsg("保存成功！");
						}
						if(result.retflag==1){
						}
					},
					error:function(msg){
						alertmsg('error');
					}
				});
		  })
		  
		  $('#delete').unbind();
		  $('#delete').on('click',function(){
			  var bookid = $('#bookid').text();
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
						  reloadlist();
						  loadtextarea(null);
						  $('#textareatopbtn').css("display","none");
						  alertmsg("删除成功！")
					  }
					  if(result.retflag==1){
					  }
				  },
				  error:function(msg){
					  alertmsg('error');
				  }
			  });
		  })
	});
}



