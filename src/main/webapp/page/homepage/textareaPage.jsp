<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
					<div class="textword">
						<span>名称：测试笔记本一</span>
						<span style="float:right;">创建时间:2017.04.07</span>
					</div>
					<div class="textbtn" style="margin-top: 20px;margin-bottom: 20px;">
						<input class="btn btn-default" type="button" value="保存">
						<input class="btn btn-default" type="button" value="编辑">
						<input class="btn btn-default" type="button" value="删除">
						
						<div class="site-demo-button" style="margin-top: 20px;margin-bottom: 20px;display:none;">
						<p>测试用按钮，以后删除</p>
							<button class="layui-btn site-demo-layedit" data-type="content">获取编辑器内容</button>
							<button class="layui-btn site-demo-layedit" data-type="text">获取编辑器纯文本内容</button>
							<button class="layui-btn site-demo-layedit" data-type="selection">获取编辑器选中内容</button>
						</div>
					</div>

					<textarea class="layui-textarea" id="LAY_demo1" style="display: none">
						在这里加载编辑器内容
					</textarea>
</body>
</html>