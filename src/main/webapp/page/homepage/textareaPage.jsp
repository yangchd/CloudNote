<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<!-- 这个导入其实没有作用，就是方便查看 -->
<script type="text/javascript" src="../../resources/page/homepage/js/textareaPage.js"></script>

<body>
					<div id="textareatopbtn" style="display: none;">
						<div class="textword">
							<span id="bookid" style="display: none;"></span>
							<span>名称:</span>
							<span id="bookname"></span>
							<span style="float:right;">创建时间：<span id="createtime"></span></span>
							
						</div>
						<div class="textbtn" style="margin-top: 15px;margin-bottom: 15px;">
							<input class="btn btn-default" id="save" type="button" value="保存">
							<!-- 
								<input class="btn btn-default" type="button" value="编辑">
							 -->
							<input class="btn btn-default" id="delete" type="button" value="删除">
						</div>
					</div>
					<div id="textareaparent">
						<textarea class="layui-textarea" id="bookarea" style="display: none"></textarea>
					</div>
</body>
</html>