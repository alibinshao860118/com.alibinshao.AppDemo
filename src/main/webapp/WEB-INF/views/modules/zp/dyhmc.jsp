<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String ctx = request.getContextPath();
%>
<link rel="stylesheet" type="text/css" href="<%=ctx%>/js/jquery-easyui-1.5/themes/default/easyui.css">

<script src="<%=ctx%>/js/jquery.js" type="text/jscript"></script>
<script src="<%=ctx%>/js/js.js" type="text/jscript"></script>
<script src="<%=ctx%>/js/Njs.js" type="text/jscript"></script>
<script type="text/javascript" src="<%=ctx%>/js/jquery-easyui-1.5/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=ctx%>/js/jquery-easyui-1.5/jquery.easyuiext.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>应聘简历打印</title>
		<script>
			var ppage = 1;
		    function doPrint(){
			    document.getElementById("printmenu").style.display = "none";
			    window.print();
			    document.getElementById("printmenu").style.display = "";
		    }
		</script>		
	</head>
<STYLE>
.printTable{
    border:0 solid black;
    border-collapse:collapse;
    width:100%
}
.printTable th{
    text-indent:2em;
	text-align: left;
	font-size: 15px;
}
.printTable td{
    border-bottom:1 solid black; 
	border-left: 1 solid black;
	border-right:1 solid black; 
	border-top: 1 solid black;
	text-align: center;
    height:37; 
    empty-cells:show;
}

p{
 FONT-SIZE: 15px; COLOR: #333333; FONT-FAMILY: "楷体_GB2312", Arial, Helvetica, sans-serif
}
pageFormatClass{size:12px;COLOR: #333333; FONT-FAMILY: "宋体", Arial, Helvetica, sans-serif
}

</STYLE>
	<BODY>
	<!--打印的内容开始-->
		<div id = "printmenu" align = "center">
			<input type="button" class="editBottomButton" value="打印" onClick="doPrint(ppage)">
		</div>
		
<script type="text/javascript">
//每行添加操作栏
function formatOperation(value,row, index){
	return "<a href='javascript:void(0)' onclick='fjxz(\""+index+"\")'><span class='btn1 btn_01'>附件下载</span></a>";
}

function fjxz(index) {
	var row = $('#jlfjxx').datagrid('getData').rows[index];
	var form = $("<form>");//定义一个form表单
	form.attr("action", "<%=ctx%>/zpjlxq/downloadJlFj.do");
    $("body").append(form);//将表单放置在web中
    var input = $("<input>");
    input.attr("type", "hidden");
    input.attr("name", "fjlj");
    input.attr("value", row.fjlj);
    form.append(input);
    
    input = $("<input>");
    input.attr("type", "hidden");
    input.attr("name", "fjmc");
    input.attr("value", row.fjmc);
    form.append(input);
    form.submit();
}
</script>

<p align=center><font SIZE="6" face="宋体"><B>应聘人员花名册</p></B></p>
<table class="printTable" border="1" cellspacing="0" cellpadding="0" align=center>
    <tr>
    	<td style="width:3%;">序号</td>
    	<td style="width:5%;">姓名</td>
    	<td style="width:5%;">性别</td>
    	<td style="width:7%;">出生年月</td>
    	<td style="width:5%;">政治面貌</td>
    	<td style="width:5%;">籍贯</td>
    	<td style="width:10%;">第一学历毕业学校、专业、时间</td>
    	<td style="width:5%;">现学历</td>
    	<td style="width:10%;">现学历毕业学校、专业、时间</td>
    	<td style="width:5%;">联系电话</td>
    	<td style="width:7%;">应聘方向</td>
    	<td style="width:8%;">应聘学院</td>
    	<td style="width:7%;">邮箱</td>
    	<td style="width:8%;">所属学科</td>
    	<td style="width:10%;">备注</td>
    </tr>
	    
	<c:forEach var="item" items="${list}" varStatus="status">
	<tr>
       	<td>${status.index + 1}</td>
       	<td style="text-align:left;">${item.username}</td>
       	<td>${item.xb}</td>
        <td>${item.csrq }</td>
        <td>${item.zzmmMc }</td>
        <td>${item.jg }</td>
        <td>${item.dyxlxx }、${item.dyzy }、${item.dyxlrxsj }</td>
    	<td>${item.zgxlMc }</td>
    	<td>${item.zgxlxx }、${item.sxzy }、${item.zgxlrxsj }</td>
    	<td>${item.sj }</td>
    	<td>${item.rpzhiwei }</td>
    	<td>${item.ssbm }</td>
    	<td>${item.yx }</td>
    	<td>${item.xueke }</td>
    	<td>${item.beizhu }</td>
	</tr>
	</c:forEach>

</table>

	</BODY>
</html>