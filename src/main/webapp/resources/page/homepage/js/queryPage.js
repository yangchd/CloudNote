/**
 * 
 */


window.onload = function(){
	$("#homeTitle").load("homeTitle.jsp", function() {
		homeTitle();
    });
	$(".notebooklist").load("notebooklist.jsp", function() {
	});
	$(".textareaPage").load("textareaPage.jsp", function() {
		createtext();
	});
	
	$('#searchbtn').on('click',function(){
		var key = $('#searchkey').val();
		if(key==null||key==""){
			alertmsg('查询条件不能为空~');
		}else{
			var data = {
					key:key
			}
			$.ajax({
				type:"GET",
				url:getUrl()+"/query/searchbykey",
				data:data,
				dataType:"json",
				timeout:2000,
				success:function(result){
					if(result.retflag==0){
						loadbooklist(result.list,$('#querylist'),"",loadtextarea,"false");
					}
					if(result.retflag==1){
						loadbooklist(result.list,$('#querylist'),"",loadtextarea,"false");
						alertmsg('什么都没找到，换个条件试试~');
					}
				},
				error:function(msg){
					alertmsg("error");
				}
			});
		}
	})
	
	
}