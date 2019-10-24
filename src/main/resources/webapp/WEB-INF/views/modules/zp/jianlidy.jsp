<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>应聘简历打印</title>
		<link rel="stylesheet" type="text/css" href="${ctxStatic}/js/jquery-easyui-1.5/themes/default/easyui.css">
		
		<SCRIPT language=JavaScript src="${ctxStatic}/js/jquery.js"></SCRIPT>
		<SCRIPT language=JavaScript src="${ctxStatic}/js/js.js"></SCRIPT>
		<script src="${ctxStatic}/js/Njs.js" type="text/jscript"></script>
		<script type="text/javascript" src="${ctxStatic}/js/jquery-easyui-1.5/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="${ctxStatic}/js/jquery-easyui-1.5/jquery.easyuiext.js"></script>
<script>
var ppage = 1;
    function doPrint(){
	    document.getElementById("printmenu").style.display = "none";
	    window.print();
	    document.getElementById("printmenu").style.display = "";
	    //dolook(++ppage);
    }
</script>		
	</head>
<STYLE>
.printTable{
    border:0 solid black;
    border-collapse:collapse;
    width:620
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
    height:37px; 
    font-size: 13px;
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
<!--table width=580 border=0 align=center>
 <tr align="center" height="10">
	<td>-->
		<div id = "printmenu" align = "center">
			<input type="button" class="editBottomButton" value="打印" onClick="doPrint(ppage)">
			<input type="button" class="editBottomButton" value="附件查看" onClick="fjck()">
		</div>
	<!--</td>
 </TR>
</table-->
<script type="text/javascript">
$(function(){
	$('#fjxxDialog').dialog('close');
});

function fjck() {
	$('#fjxxDialog').dialog('open');
	$("#jlfjxx").datagrid({
		url:"${ctx}/zpjlxq/findJlfjList",
		queryParams:{zpjlid:${vo.id}},
		height:200
	});
}

//每行添加操作栏
function formatOperation(value,row, index){
	return "<a href='javascript:void(0)' onclick='fjxz(\""+index+"\")'><span class='btn1 btn_01'>附件下载</span></a>";
}

function fjxz(index) {
	var row = $('#jlfjxx').datagrid('getData').rows[index];
	var form = $("<form>");//定义一个form表单
	form.attr("action", "${ctx}/zpjlxq/downloadJlFj");
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
<div id="data1">
    <p align=center><font SIZE="6" face="宋体"><B>湖南省事业单位公开招聘人员报名表</p></B></p>
    <table class="printTable" border="0" cellspacing="0" cellpadding="0" align=center
    	style="width: 620px;">
        <tr><td style="text-align:left;">应聘单位：${vo.ssbm }</td>
        <td style="text-align:left;">应聘岗位:${vo.rpzhiwei }</td>
        <td style="text-align:right;">报名序号： ${vo.id }</td></tr>
    </table>
    <TABLE class="printTable" border="1" cellspacing="0" cellpadding="0" align=center
    	style="width: 620px;">
        <tr><td colspan="2" style="width:14%;">姓    名</td>
        	<td style="width:14%;">${vo.username}</td>
            <td style="width:14%;">性    别</td><td style="width:9%;">${vo.xb}</td>
            <td style="width:14%;">民    族</td><td style="width:16%;">${vo.mzMc }</td>
            <td rowspan="5"></td></tr>
        <tr><td colspan="2">出生年月</td><td>${vo.csrq }</td>
            <td>政治面貌</td><td>${vo.zzmmMc }</td><td>学历学位</td><td>${vo.zgxlMc }</td></tr>
        <tr><td colspan="2">毕业院校</td><td colspan="3">${vo.zgxlxx }</td>
            <td>所学专业</td><td>${vo.sxzy }</td></tr> 
        <tr><td colspan="3">职称、执（职）业资格</td><td colspan="2">${vo.zyzg }</td>
            <td>取得时间</td><td>${vo.zyzgsj }</td></tr>       
        <tr><td colspan="2">户  籍<br>所在地</td><td>${vo.hjdz }</td>
            <td>婚姻状况</td><td>${vo.hyzk }</td>
            <td>档案保<br>管单位</td><td>${vo.rsdadw }</td></tr>
        <tr><td colspan="2">身份证号</td><td colspan="3">${vo.sfzhm }</td>
            <td>有何特长</td><td colspan="2">${vo.tc }</td></tr>    
        <tr><td colspan="2">通讯地址</td><td colspan="4">${vo.txdz }</td>
            <td>邮政编码</td><td>${vo.youbian }</td></tr>
        <tr><td colspan="2">联系电话</td><td colspan="3">${vo.sj }</td>
            <td>EMAIL</td><td colspan="2">${vo.yx }</td></tr> 
        <tr><td colspan="2"  style="height:150px;">简历</td>
        	<td colspan="6">${vo.jianli }</td></tr> 
        <tr><td colspan="2" style="height:150px;">与应聘岗位<br>相关的实践<br>经历或取得<br>的成绩</td>
        	<td colspan="6">${vo.chengji }</td></tr> 
        <tr><td style="width:7%;">应<br>聘<br>人<br>员<br>承<br>诺</td>
            <th colspan="3">本人承诺所提供的材料真实有效，符合应聘岗位所需的资格条件。如有弄虚作假，承诺自动放弃考试和聘用资格。<br>&nbsp&nbsp&nbsp&nbsp应聘人签名:<br><p style="text-align:right;margin:20px;">年&nbsp&nbsp&nbsp&nbsp月&nbsp&nbsp&nbsp&nbsp日&nbsp&nbsp<p></th>
            <td>资<br>格<br>审<br>查<br>意<br>见</td><th colspan="3"><p style="text-indent:2em;margin:10px;">经审查，符合应聘资格条件。</p><br>&nbsp&nbsp&nbsp审查人签名：&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp单位（盖章）<br><br><p style="text-align:right;margin:20px;">年&nbsp&nbsp&nbsp&nbsp月&nbsp&nbsp&nbsp&nbsp日&nbsp&nbsp<p></th></tr>                 
		<tr><td style="height:50px">备<br>注</td><td colspan="7"></td></tr>
    </table>    
    <br>
	<div align="center"><font size="2">第1页/共1页</font></div>
</div>

<!-- 附件查看窗口 start -->
	<div id="fjxxDialog" class="easyui-dialog" title="附件查看" style="width:400px;height:250px;"   
        data-options="iconCls:'icon-save',resizable:true,modal:true">   
		<table id="jlfjxx" style="width: 99%;" >
			<thead frozen="true">
				<tr>	
					<th data-options="field:'fjmc', halign:'center',align:'center',width:200">附件名称</th>
					<th data-options="field:'id', halign:'center',align:'center',width:80,formatter:formatOperation">操作</th>
				</tr>
			</thead>
		</table>
	</div>
	<!-- 附件查看窗口 end -->
	</BODY>
</html>