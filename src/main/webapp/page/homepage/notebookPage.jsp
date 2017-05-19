<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="mx" tagdir="/WEB-INF/tags"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>笔记本</title>

<mx:commonlink/>
<link href="../../resources/page/homepage/css/notebookPage.css" rel="stylesheet">
<script type="text/javascript" src="../../resources/page/homepage/js/noteboosPage.js"></script>

</head>
<body>

	<div id="notebookPage_top">
		<div class="container">
		<nav class="navbar navbar-default" role="navigation" style="height:50px;">
		  <div id="homeTitle">
	      		<!-- 这里加载homeTitle页面 -->
	      </div>
		</nav>
		</div>
	</div>
	
	<div class="container" id="notebookPage_navigation">
		<!-- 新增面板，界面待优化 -->
		<div class="panel panel-default" id="addbtn_panel" style="display: none;">
			<div class="panel-body">
			<div class="col-md-2"></div>
			<div class="col-md-3">
					<h2>新增文件路径</h2>
					<div class="treecss">
					  <ul class="addtree"></ul>
					</div>
			</div>
			<div class="col-md-5">
				<form class="form-inline">
						<div class="layui-form-item">
							<div class="layui-inline">
								<label class="layui-form-label">类别</label>
								<div class="layui-input-inline">
									<select class="form-control" style="width: inherit;" id="addtype">
									  <option value="1">笔记本</option>
									  <option value="2">目录</option>
									</select>
								</div>
							</div>
						</div>
						<div class="layui-form-item">
							<div class="layui-inline">
								<label class="layui-form-label">路径</label>
								<div class="layui-input-inline">
									<input type="text" id="addtreeid" class="form-control" readonly="readonly" style="display: none;">
									<input type="text" id="addtreename" class="form-control maxwithbtn" readonly="readonly">
								</div>
							</div>
						</div>
						<div class="layui-form-item">
							<div class="layui-inline">
								<label class="layui-form-label">名称</label>
								<div class="layui-input-inline">
									<input type="text" id="addname"  class="form-control maxwithbtn">
								</div>
							</div>
						</div>
				</form>
			</div>
			<div class="col-md-2">
			</div>
			<div class="col-md-12">
						<div class="layui-form-item">
							<div class="layui-inline">
									<input class="btn btn-default" type="button" id="paneladdbtn" value="确认新增">
							</div>
							<div class="layui-inline">
									<input class="btn btn-default" id="canceladdbtn" type="button" value="取消新增">
							</div>
						</div>
			</div>
			</div><!-- panel-body -->
		</div><!-- 新增面板 -->
		
		<!-- 编辑面板 -->
		<div class="panel panel-default" id="editbtn_panel" style="display: none;">
			<div class="panel-body">
				<div class="col-md-6">
					<div class="col-md-5 nopadding">
							<h2>选择路径</h2>
							<div class="treecss">
							  <ul class="edittree"></ul>
							</div>
					</div>
					<div class="col-md-7 nopadding">
							<p>目录信息</p>
							<div class="layui-form-item" style="padding-top: 20px;">
								<div class="layui-inline">
									<label class="layui-form-label">名称</label>
									<div class="layui-input-inline">
										<input type="text" id="editpwdid" style="display: none;" class="form-control">
										<input type="text" id="editpwdname"  class="form-control">
									</div>
								</div>
								<input class="btn btn-default editbtncss" id="editpwdnamebtn" type="button" value="应用修改">
							</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="col-md-5 nopadding">
						<div class="notebooklist" id="edittreelist">
							<!-- 这里加载笔记本列表 -->
						</div>
					</div>
					<div class="col-md-7 nopadding">
							<p>笔记本信息</p>
							<div class="layui-form-item" style="padding-top: 20px;">
								<div class="layui-inline">
									<label class="layui-form-label">名称</label>
									<div class="layui-input-inline">
										<input type="text" id="editbookid"  style="display: none;"  class="form-control">
										<input type="text" id="editbookname"  class="form-control">
									</div>
								</div>
								<input class="btn btn-default editbtncss" id="editbooknamebtn" type="button" value="应用修改">
							</div>
					</div>
				</div>
				<form class="form-inline">
					<div class="layui-form-item">
						<div class="layui-inline">
								<input class="btn btn-default" id="canceleditbtn" type="button" value="完成修改关闭修改界面">
						</div>
					</div>
				</form>
			</div>
		</div><!-- 编辑面板 -->
		
		<!-- 移动面板，界面待优化 -->
		<div class="panel panel-default" id="movebtn_panel" style="display: none;">
			<div class="panel-body">
			<div class="col-md-1">
			</div>
			<div class="col-md-3">
					<h2>移动前目录</h2>
					<div class="treecss">
					  <ul class="movetreeone"></ul>
					</div>
			</div>
			<div class="col-md-4">
					<div class="notebooklist" id="movetreeonelist">
					</div>
			</div>
			<div class="col-md-3">
					<h2>移动后目录</h2>
					<div class="treecss">
					  <ul class="movetreetwo"></ul>
					</div>
			</div>
			<div class="col-md-1">
			</div>
			<div class="col-md-12 movepanel" style="display: block;">
				<div class="col-md-5">
					<span id="movespaceid" style="display: none;"></span>
					<span id="movespacename"></span>
					<span id="movebookid" style="display: none;"></span>
					<span id="movebookname" style="padding-left: 15px;"></span>
				</div>
				<div class="col-md-2">
					<span id="jiantou">移动至<span class="glyphicon glyphicon-arrow-right" ></span></span>
				</div>
				<div class="col-md-5" >
					<span id="movetoid" style="display: none;"></span>
					<span id="movetoname"></span>
				</div>
			</div>
			<form class="form-inline">
					<div class="layui-form-item">
						<div class="layui-inline">
								<input class="btn btn-default" id="makemovebtn" type="button" value="确认移动">
						</div>
						<div class="layui-inline">
								<input class="btn btn-default" id="cancelmovebtn" type="button" value="取消移动">
						</div>
					</div>
			</form>
			</div><!-- panel-body -->
		</div><!-- 新增面板 -->
		
		<!-- 删除面板，暂时未设计好 -->
		<div class="panel panel-default" id="deletebtn_panel" style="display: none;">
			<div class="panel-body">
				<div class="col-md-3">
				</div>
				<div class="col-md-3">
						<h2>删除文件所在路径</h2>
						<div class="treecss">
						  <ul class="deletetree"></ul>
						</div>
				</div>
				<div class="col-md-3">
					<div class="notebooklist" id="deletetreelist">
						<!-- 这里加载笔记本列表 -->
					</div>
				</div>
				<div class="col-md-3">
				</div>
				<div class="col-md-12" style="margin-top: 10px;margin-bottom: 20px;">
					<div class="col-md-4"></div>
					<div class="col-md-2">
						<span>当前选择：</span>
					</div>
					<div class="col-md-2">
						<span id="deletebookid" style="display: none;"></span>
						<span id="deletebookname"></span>
					</div>
					<div class="col-md-4"></div>
				</div>
				
				<form class="form-inline">
					<div class="layui-form-item">
						<div class="layui-inline">
								<input class="btn btn-default" id="deletebookbtn" type="button" value="确认删除">
						</div>
						<div class="layui-inline">
								<input class="btn btn-default" id="canceldeletebtn" type="button" value="取消删除">
						</div>
					</div>
				</form>
			</div>
		</div>
		
	</div>
			
			
	<div class="container" id="notebookPage_body">
	
	<div class="panel panel-default">
		<div class="panel-body">
				<div class="col-md-12" style="text-align: center;">
					<!-- 中部按钮菜单栏 -->
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="btn-group" role="group" aria-label="...">
								<input class="btn btn-default" id="addbtn" type="button" value="新增">
								<input class="btn btn-default" id="editbtn" type="button" value="编辑">
								<input class="btn btn-default" id="movebtn" type="button" value="移动">
								<input class="btn btn-default" id="deletebtn" type="button" value="删除">
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-5">
					<!-- 左侧下拉菜单 -->
					<div class="col-md-5">
						<div class="treecssbody">
						  <ul class="pwdtree"></ul>
						</div>
					</div>
					
					<!-- 中部笔记本显示  -->
					<div class="col-md-7" style="padding-right: 0px;padding-left: 0px;">
						<div class="notebooklist" id="pwdlist">
							<!-- 这里加载笔记本列表 -->
						</div>
					</div>
				</div>
			
			
				<!-- 右侧文本编辑和功能按钮  -->
				<div class="col-md-7">
					<div class="textareaPage">
					</div>
				</div>
			</div>
		</div><!-- panel panel-default -->
	</div>
</body>
</html>