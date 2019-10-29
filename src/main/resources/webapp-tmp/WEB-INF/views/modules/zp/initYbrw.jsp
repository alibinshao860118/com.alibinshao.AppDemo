<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String ctx = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<style type="text/css">
	.yhPic img{ border:2px solid #dbdbdb; }
.yhPic img:hover{ border:2px solid red; }
.sjpic{ background-image:url(../../images/new/temp01.png); width:583px; height:333px; margin:auto;}
.sjpic span{ display:block; padding-top:270px; margin-left:110px; width:130px; color:#fff; line-height:18px;}
.btn_success,.btn_qx{ border:1px solid #1e42a3;text-shadow:0px -1px 0px #11258b;
box-shadow:inset 1px 1px 0px #3e8acb,inset -1px -1px 0px #295aae,1px 2px 2px #ccc;
	background: -moz-linear-gradient(TOP, #3371bf 0%, #2651a8 100%); /* FF3.6+ */
				background: -webkit-gradient(top, color-stop(0%,#3371bf), color-stop(100%,#2651a8)); /* Chrome,Safari4+ */
				background: -webkit-linear-gradient(TOP, #3371bf 0%,#2651a8 100%); /* Chrome10+,Safari5.1+ */
				background: -o-linear-gradient(TOP, #3371bf 0%,#2651a8 100%); /* Opera11.10+ */
				background: -ms-linear-gradient(TOP, #3371bf 0%,#2651a8 100%); /* IE10+ */
				filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#3371bf', endColorstr='#2651a8',GradientType=0 ); /* IE6-9 */
				background: linear-gradient(TOP, #3371bf 0%,#2651a8 100%); /* W3C */
	}
	.btn:hover{ opacity:0.9;}
	.btn {
display: inline-block; letter-spacing:1px; border-radius:2px; 
border: 1px solid transparent;white-space: nowrap;

font-weight: 400;
text-align: center;
vertical-align: middle;
cursor: pointer; line-height:27px;
padding: 0px 20px; color:#fff;
}
.sh2_navhelp{background-color: #fcf8e3;box-shadow:0 0 5px rgba(0,0,0,0.1); clear:both; padding:6px 6px 6px 10px; margin-top:10px; }
</style>
<link href="<%=ctx%>/css/comon.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" type="text/css" href="<%=ctx%>/js/jquery-easyui-1.5/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=ctx%>/js/jquery-easyui-1.5/themes/icon.css">

<SCRIPT language=JavaScript src="<%=ctx%>/js/jquery.js"></SCRIPT>
<SCRIPT language=JavaScript src="<%=ctx%>/js/js.js"></SCRIPT>
<script type="text/javascript" src="<%=ctx%>/js/jquery-easyui-1.5/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=ctx%>/js/jquery-easyui-1.5/jquery.easyuiext.js"></script>

<title>我的待办</title>
</head>

<script type="text/javascript">
$(document).ready(function () {
	$("#dbxx").datagrid({
		url:'<%=ctx%>/zp/zpjlsxlc/queryYbrwByPage.do',
		height : 300,
		singleSelect : true,
		rownumbers:true,
		pagination:true,
		/* data:d1, */
		title:'我的已办信息'
		
	});
});

//操作栏
function formatOperation(value,row, index){
	return "<a href='javascript:void(0)'  class='btn1 btn_01' onclick='dbcl(\""+row.id+"\")' >查看&nbsp;</a>"
		;
}
function formatOperationHj(value,row, index){
	if(value=='1'){
		return "送部门内审核";
	}else if(value=='2'){
		return "送其他部门会签";
	}else if(value=='3'){
		return "送结束";
	}
}
function dbcl(id){
	location.href="<%=ctx%>/zp/zpjlsxlc/jianlisxlcgl_view.do?pageGoBack=1&id="+id;
}

</script>

<body style="padding: 10px;">
	<table id="dbxx" style="width: 100%;" >
		<thead>
			<tr>
				<th data-options="field:'jlsxmc', halign:'center',width:160">筛选流程名称</th>
				<th data-options="field:'czsjStr', halign:'center',align:'center',width:150">操作时间</th>
				<th data-options="field:'zpjlid',width:80,align:'center',formatter:formatOperation">操作</th>
			</tr>
		</thead>
	</table>
</body>
</html>
