<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String contextPath = request.getContextPath();
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" charset="utf-8" src="../kindeditor/themes/default/default.css"></script>
<script type="text/javascript" charset="utf-8" src="../kindeditor/kindeditor-min.js"> </script>
<SCRIPT language=JavaScript src="../js/jquery.js"></SCRIPT>
<script>
KindEditor.ready(function(K) {
	editor = K.create('textarea[name="htmlstr"]', {allowFileManager : true	});
	K('input[name=getHtml]').click(function(e) {alert(editor.html());});
	K('input[name=isEmpty]').click(function(e) {alert(editor.isEmpty());});
	K('input[name=getText]').click(function(e) {alert(editor.text());});
	K('input[name=selectedHtml]').click(function(e) {alert(editor.selectedHtml());});
	K('input[name=setHtml]').click(function(e) {editor.html('<h3>Hello KindEditor</h3>');});
	K('input[name=setText]').click(function(e) {editor.text('<h3>Hello KindEditor</h3>');});
	K('input[name=insertHtml]').click(function(e) {editor.insertHtml('<strong>插入HTML</strong>');});
	K('input[name=appendHtml]').click(function(e) {editor.appendHtml('<strong>添加HTML</strong>');});
	K('input[name=clear]').click(function(e) {editor.html('');});
});
</script>
</head>
<body style="overflow-x:hidden;overflow-y:hidden;border:0;margin:0;">	
		<textarea id="htmlstr" name="htmlstr" cols="100" rows="5" style="width:900px;height:250px;visibility:hidden;"></textarea>
			    <script id="editor" type="text/plain" style="width:1024px;height:300px;"></script>
		<br />
		<input type="button" name="button" value="提交内容" onclick="javaScript:submit()"/> 
</html>


<script type="text/javascript">
function submit(){
//数据保存时：editor.sync();
//只读设置：editor.readonly(true);
//读取内容：editor.html("content");
	editor.sync();
	alert($("#htmlstr").val());

	$.ajax({
		url:"<%=contextPath%>/action/uploadKindEditor.do",
		type:"post",
		data:{"htmlstr" : $("#htmlstr").val()},
		dataType:"text",
		contentType:"application/json",
		success:function(data){	
			alert("保存成功");
		},
		error:function(){
			alert("异常");
		},
		timeout : 1000000000
	});
}
</script>