/**
 * 
 */

//打开book到textarea函数
function loadtextarea(book,$this){
	var data = {
			notebookid:book.notebookid
	}
	$.ajax({
		type:"GET",
		url:getUrl()+"/notebook/getbooklist",
		data:data,
		dataType:"json",
		timeout:2000,
		success:function(result){
			if(result.retflag==0){
//				loadbooklist(result.booklist,$(tar));
				book = result.booklist[0];
				$('#bookid').text(book.notebookid);
				$('#bookname').text(book.notebookname);
				$('#createtime').text(book.createtime.substring(0,10));
				$('#bookarea').text(book.msg);
				createtext();
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
							alert("保存成功！")
						}
						if(result.retflag==1){
						}
					},
					error:function(msg){
						alert(JSON.stringify(msg));
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
				  url:getUrl()+"/notebook/update",
				  data:data,
				  dataType:"json",
				  timeout:2000,
				  success:function(result){
					  if(result.retflag==0){
						  alert("删除成功！")
					  }
					  if(result.retflag==1){
					  }
				  },
				  error:function(msg){
					  alert(JSON.stringify(msg));
				  }
			  });
		  })
	});
}



