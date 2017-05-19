/**
 * 
 */

function delHtmlTag(str){
	return str.replace(/<[^>]+>/g,"");
}

/**
 * 生成列表函数
 * list为查询到的笔记本列表
 * this为生成位置
 * spaceid为当前所有笔记本所在空间的id
 * func为每个列所添加的动作函数
 * flag控制编辑器是否编辑，false时不能编辑
 */
function loadbooklist(list,$this,spaceid,func,flag){
	$this.find('#booklist').empty();
	$this.find('#booklist').append('<div class="treelistid" style="display: none;">'+spaceid+'</div>');
	if(list==null||list.length<=0){
		$this.find('#booklist')
		.append("<a href='javascript:;' class='list-group-item'>"
				+"<h1 class='list-group-item-heading'style='height: 180px;text-align: center;padding-top: 80px;'>这个目录没有内容</h1>"
				+"</a>");
	}else{
		for(var i=0;i<list.length;i++){
			//去掉标签解决一些格式错误
			var msg = list[i].msg;
			if(msg==null||msg==""){
				msg="这个笔记本里面没有内容";
			}
			msg = delHtmlTag(msg);
			if(msg!=null && msg.length>11){
				msg = msg.substring(0,11)+"……";
			}
			$this.find('#booklist')
			.append("<a href='javascript:;' class='list-group-item'>"
					+"<h1 class='list-group-item-heading' id='booklistid' style='display:none;'>"+list[i].notebookid+"</h1>"
					+"<h1 class='list-group-item-heading' id='booklistname'>"+list[i].notebookname+"</h1>"
					+"<p class='list-group-item-text'>"+msg+"</p>"
					+"</a>");
		}
	}
	$('.list-group-item').unbind();
	$('.list-group-item').on('click',function(){
		var booklistid = $(this).find('#booklistid').text();
		var booklistname = $(this).find('#booklistname').text();
		//将信息加载到编辑区
		func(booklistid,booklistname,flag);
	})
}