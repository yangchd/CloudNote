/**
 * 添加小组成员模块
 */
function searchmem($this,members,tableid){
	$this.empty();
	$this.append('<tr><th>名字</th><th>电话</th><th>邮箱</th><th>选项</th></tr>');
	for(var i=0;i<members.length;i++){
		$this.append('<tr>'
								+'<td>'
								+'<p id="userid" style="display:none">'+members[i].id+'</p>'
								+'<p id="username" style="display:none">'+members[i].username+'</p>'
								+members[i].username+'</td><td>'
								+members[i].mobile+'</td><td>'+members[i].email+'</td>'
								+'<td><a href="javascript:;" class="addmembersbtn"><span class="glyphicon glyphicon-plus" ></span></td></a></tr>');
	}
	$('.addmembersbtn').on('click',function(){
		var userid = $(this).parent().parent().find('#userid').text();
		var username = $(this).parent().parent().find('#username').text();
		//在插入之前，做一个重复判断
		var table =document.getElementById(tableid);
		var rows = table.rows.length;
		var flag = 0;
		for(var i=0;i<rows;i++){
			var trid = $(table.rows[i].cells[0].innerHTML).html();
			if(trid==userid){
				flag = 1;
				alertmsg("不能重复添加~");
			}
		}
		if(flag==0){
			$("#"+tableid).find("tbody").append('<tr><td><p style="display: none;" id="adduserid">'
					+userid+'</p>'+username+'</td>'
					+'<td><a href="javascript:;" class="deletemembtn">'
					+'<span class="glyphicon glyphicon-remove"> </span></a></td></tr>'
			);
			$('.deletemembtn').on('click',function(){
				$(this).parent().parent().attr("style","display:none");
				$('#'+tableid+' tr:hidden').remove();
			})
		}
	})
}

/**
 * 初始化小组页面
 */
function loadmyteamtable(){
	var userid = getUserID();
	var data = {
			userid:userid
	}
	$.ajax({
		type:"GET",
		url:getUrl()+"/team/getteamlist",
		data:data,
		async: false, 
		dataType:"json",
		timeout:2000,
		success:function(result){
			if(result.retflag==0){
				var teamlist = result.list;
				$('#myteamtable').empty();
				$('#myteamtable').append('<tr><th>小组名称</th><th>小组组长</th><th>小组成员</th><th>创建时间</th><th>选项</th></tr>');
				for(var i=0;i<teamlist.length;i++){
					var addhtml = '<tr><td id="teamid" style="display:none">'+teamlist[i].teamid+'</td>'
								 +'<td>'+teamlist[i].teamname+'</td><td>'+teamlist[i].leadername+'</td>'
								 +'<td>'+teamlist[i].membername+'</td><td>'+teamlist[i].createtime+'</td>'
								 +'<td><a class="gotonotePage"><span>查看</span><span class="glyphicon glyphicon-share-alt"></span></a>';
					if(teamlist[i].leader==userid){
						addhtml += '<a class="editbtn"><span>编辑</span><span class="glyphicon glyphicon-pencil"></span></a>';
						addhtml += '<a class="deleteteambtn"><span>解散</span><span class="glyphicon glyphicon-remove"></span></a>';
					}
					addhtml += '</td></tr>';
					$('#myteamtable').append(addhtml);
				}
			}
			if(result.retflag==1){
				$('#myteamtable').empty();
				alertmsg("你没有创建或加入小组~");
				$('#addteam_panel').css("display","block");
			}
		},
		error:function(msg){
			alertmsg("error");
		}
	});
	$('.editbtn').on('click',function(){
		$('#editteam_panel').css("display","block");
		var teamid = $(this).parent().parent().find('#teamid').text();
		editteamById(teamid);
	})
	$('.deleteteambtn').on('click',function(){
		var teamid = $(this).parent().parent().find('#teamid').text();
		deleteteamById(teamid);
	})
	$('.gotonotePage').on('click',function(){
		var teamid = $(this).parent().parent().find('#teamid').text();
		gotonotePageById(teamid);
	})
}

/**
 * 删除函数
 */
function deleteteamById(teamid){
	var data = {
			teamid:teamid
	}
	$.ajax({
		type:"GET",
		url:getUrl()+"/team/delete",
		data:data,
		dataType:"json",
		timeout:2000,
		success:function(result){
			if(result.retflag==0){
				alertmsg(result.msg);
				loadmyteamtable();
			}
			if(result.retflag==1){
				alertmsg(result.msg);
			}
		},
		error:function(msg){
			alertmsg("error");
		}
	});
}

/**
 * 编辑函数
 */
function editteamById(teamid){
	$('#editteamid').text(teamid);
	var data={
			teamid:teamid
	}
	$.ajax({
		type:"GET",
		url:getUrl()+"/team/getteamvo",
		data:data,
		dataType:"json",
		timeout:2000,
		success:function(result){
			if(result.retflag==0){
				var teamvo = result.list[0];
				//组名加载
				$('#teamnameedit').val(teamvo.teamname);
				
				
				var membername = teamvo.membername.split(',');
				var memberid = teamvo.member.split(',');
				$('#editteamleader').empty();
				$("#edittableid").find("tbody").empty();
				for(var i=0;i<memberid.length;i++){
					//组长加载
					$('#editteamleader').append('<option value="'+memberid[i]+'">'+membername[i]+'</option>');
					
					//组员加载
					$("#edittableid").find("tbody").append('<tr><td><p style="display: none;" id="adduserid">'
							+memberid[i]+'</p>'+membername[i]+'</td>'
							+'<td><a href="javascript:;" class="deletemembtn">'
							+'<span class="glyphicon glyphicon-remove"> </span></a></td></tr>'
					);
					$('.deletemembtn').on('click',function(){
						$(this).parent().parent().attr("style","display:none");
						$('#edittableid tr:hidden').remove();
					})
				}
				
				
			}
			if(result.retflag==1){
				loadmyteamtable();
			}
		},
		error:function(msg){
			alertmsg("error");
		}
	});
}


/**
 * 查看小组空间
 */
function gotonotePageById(teamid){
	var data={
			teamid:teamid
	}
	$.ajax({
		type:"GET",
		url:getUrl()+"/team/getteamvo",
		data:data,
		dataType:"json",
		timeout:2000,
		success:function(result){
			if(result.retflag==0){
				setteamspaceid(result.list[0].spaceid);
				window.location.href=getUrl()+"/page/homepage/notebookPage.jsp?team";
			}
			if(result.retflag==1){
				alertmsg("error");
			}
		},
		error:function(msg){
			alertmsg("error");
		}
	});
}



/**
 * 小组成员增删改函数
 * searchmsg 查询的信息
 * $searchlist 查询信息表格
 */
function teammemberedit(searchmsg,$searchlist,tableid){
	if(searchmsg==""||searchmsg==null){
		alertmsg("查询信息不能为空~");
	}else{
		var data ={
				search:searchmsg
		}
		$.ajax({
			type:"GET",
			url:getUrl()+"/person/search",
			data:data,
			dataType:"json",
			timeout:2000,
			success:function(result){
				if(result.retflag==0){
					var members = result.list;
					searchmem($searchlist,members,tableid);
				}
				if(result.retflag==1){
					$searchlist.empty();
					alertmsg("什么都没查到，换个条件试试~");
				}
			},
			error:function(msg){
				alertmsg("error");
			}
		});
	}
}


window.onload = function(){
	$("#homeTitle").load("homeTitle.jsp", function() {
		homeTitle();
    });
	
	//加载小组
	loadmyteamtable();
	
	$('#addbtn').on('click',function(){
		$('#addteam_panel').css("display","block");
	})
	$('#canceladdbtn').on('click',function(){
		$('#addteam_panel').css("display","none");
	})
	$('#createteambtn').on('click',function(){
		//获取参数
		var teamname = $('#teamnamecreate').val();
		var member = "";
		var table =document.getElementById("addtableid");
		var rows = table.rows.length;
		for(var i=0;i<rows;i++){
			var trid = $(table.rows[i].cells[0].innerHTML).html();
			member = member+trid+",";
		}
		if(teamname==null||teamname==""){
			alertmsg("小组名称不能为空~");
			return;
		}
		if(member==null||member==""){
			 alertmsg("至少需要添加一名成员~");
			 return;
		}
		var data={
				teamname:teamname,
				member:member
		}
		$.ajax({
			type:"GET",
			url:getUrl()+"/team/createteam",
			data:data,
			dataType:"json",
			timeout:2000,
			success:function(result){
				if(result.retflag==0){
					alertmsg(result.msg);
					loadmyteamtable();
					$('#addteam_panel').css("display","none");
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

	//在这里添加组员查找动作
	$('#searchmembtn').on('click',function(){
		var searchmsg = $('#searchmsg').val();
		teammemberedit(searchmsg,$('#memberlist'),"addtableid");
	})
	$('#editsearchmembtn').on('click',function(){
		var searchmsg = $('#editsearchmsg').val();
		teammemberedit(searchmsg,$('#editmemberlist'),"edittableid");
	})
	
	$('#canceleditbtn').on('click',function(){
		$('#editteam_panel').css("display","none");
	})
	//小组名称修改
	$('#editteamnamebtn').on('click',function(){
		var teamname = $('#teamnameedit').val();
		var teamid = $('#editteamid').text();
		var data = {
				teamname:teamname,
				teamid:teamid
		}
		$.ajax({
			type:"GET",
			url:getUrl()+"/team/update",
			data:data,
			dataType:"json",
			timeout:2000,
			success:function(result){
				if(result.retflag==0){
					alertmsg(result.msg);
					loadmyteamtable();
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
	
	//小组组长修改
	$('#editteamleaderbtn').on('click',function(){
		var leader = $('#editteamleader').val();
		var teamid = $('#editteamid').text();
		var data = {
				leader:leader,
				teamid:teamid
		}
		$.ajax({
			type:"GET",
			url:getUrl()+"/team/update",
			data:data,
			dataType:"json",
			timeout:2000,
			success:function(result){
				if(result.retflag==0){
					alertmsg(result.msg);
					loadmyteamtable();
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
	//小组成员修改
	$('#editmembtn').on('click',function(){
		//获取参数
		var teamid = $('#editteamid').text();
		var member = "";
		var table =document.getElementById("edittableid");
		var rows = table.rows.length;
		for(var i=0;i<rows;i++){
			var trid = $(table.rows[i].cells[0].innerHTML).html();
			member = member+trid+",";
		}
		if(member==null||member==""){
			alertmsg("至少需要添加一名成员~");
			return;
		}
		var data={
				member:member,
				teamid:teamid
		}
		$.ajax({
			type:"GET",
			url:getUrl()+"/team/update",
			data:data,
			dataType:"json",
			timeout:2000,
			success:function(result){
				if(result.retflag==0){
					alertmsg(result.msg);
					loadmyteamtable();
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