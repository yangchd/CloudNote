/**
 * 
 */


function loadbooklist(list,$this){
	$this.find('#booklist').empty();
	if(list==null||list.length<=0){
		$this.find('#booklist')
		.append("<a href='javascript:;' class='list-group-item'>"
				+"<h1 class='list-group-item-heading'style='height: 200px;text-align: center;padding-top: 90px;'>这个目录没有内容</h1>"
				+"</a>");
	}else{
		for(var i=0;i<list.length;i++){
			var msg = list[i].msg;
			if(msg!=null && msg.length>8){
				msg = msg.substring(0,8)+"……";
			}
			if(msg==null){
				msg="这个笔记本里面没有内容";
			}
			$this.find('#booklist')
			.append("<a href='javascript:;' class='list-group-item'>"
					+"<h1 class='list-group-item-heading' id='booklistid' style='display:none;'>"+list[i].notebookid+"</h1>"
					+"<h1 class='list-group-item-heading' id='title'>"+list[i].notebookname+"</h1>"
					+"<p class='list-group-item-text'>"+msg+"</p>"
					+"</a>");
		}
	}
	
}