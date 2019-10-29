<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String ctx = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="<%=ctx%>/css/comon.css" rel="stylesheet" type="text/css" />
<link href="<%=ctx%>/css/index.css" rel="stylesheet" type="text/css" />
<link href="<%=ctx%>/css/font.css" rel="stylesheet" type="text/css" />
<link href="<%=ctx%>/css/tab_css.css" rel="stylesheet" type="text/css" />
  
<style type="text/css">
	.yhPic img{ border:2px solid #dbdbdb; }
.yhPic img:hover{ border:2px solid red; }
.sjpic{ background-image:url(<%=ctx%>/images/new/temp01.png); width:583px; height:333px; margin:auto;}
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

<link rel="stylesheet" type="text/css" href="<%=ctx%>/js/jquery-easyui-1.5/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=ctx%>/js/jquery-easyui-1.5/themes/icon.css">
<link rel="stylesheet" type="text/css" href="<%=ctx%>/js/jquery-easyui-texteditor/texteditor.css">

<SCRIPT language=JavaScript src="<%=ctx%>/js/jquery.js"></SCRIPT>
<SCRIPT language=JavaScript src="<%=ctx%>/js/js.js"></SCRIPT>
<script type="text/javascript" src="<%=ctx%>/js/jquery-easyui-1.5/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=ctx%>/js/jquery-easyui-1.5/jquery.easyuiext.js"></script>
<script type="text/javascript" src="<%=ctx%>/js/jquery-easyui-texteditor/jquery.texteditor.js"></script>

<%-- <SCRIPT language=JavaScript src="<%=ctx%>/js/zDialog.js"></SCRIPT>
<SCRIPT language=JavaScript src="<%=ctx%>/js/zDrag.js"></SCRIPT> --%>
<script src="<%=ctx%>/js/Njs.js" type="text/jscript"></script>
<!-- 树控件 -->
  <link rel="stylesheet" href="<%=ctx%>/js/jquery-ztree/3.5.12/css/zTreeStyle/zTreeStyle.css" type="text/css">
  <script type="text/javascript" src="<%=ctx%>/js/jquery-ztree/3.5.12/js/jquery.ztree.core-3.5.js"></script>
<title>简历筛选流程</title>
</head>
<script type="text/javascript">
//初始化
$(document).ready(function(){
	//简历信息
	$("#zpjlxx").datagrid({
		url:'<%=ctx%>/zp/zpjlsxlc/queryZpjlxxByPage.do',
		queryParams: {
			id: '${vo.zpjhId}'
		},
		height : 300,
		singleSelect : false,
		rownumbers:true,
		pagination:true,
		title:'应聘简历信息'
	});
	
	//环节意见信息
	$("#hjyjxx").datagrid({
		url:'<%=ctx%>/zp/zpjlsxlc/queryHjyjxxByPage.do',
		queryParams: {
			zplcid: '${vo.id}'
		},
		height : 300,
		rownumbers:true,
		pagination:true,
		title:'流程意见'
	});
	//提交窗口
	$('#tjDialog').dialog('close');
	//筛选意见窗口
	$('#sxyjtjDialog').dialog('close');
	//筛选日志窗口
	$('#sxrzDialog').dialog('close');
	
        $("#htmlStr1").attr("disabled","disabled");
});

function cyyj(){   
	var diag = new Dialog();
	diag.Width = 300;
	diag.Height = 100;
	diag.Title = "常用意见";
	htmlstr='<table width="100%" border="0" cellspacing="6" cellpadding="0">';
	htmlstr=htmlstr+'<tr><td><input name="" type="checkbox" value="" checked style="margin:2px 5px 0px 15px;">已阅';
	htmlstr=htmlstr+'<input name="" type="checkbox" value="" checked style="margin:2px 5px 0px 15px;">同意';
	htmlstr=htmlstr+'<input name="" type="checkbox" value="" checked style="margin:2px 5px 0px 15px;">不同意</td></tr></table>';
	diag.InnerHtml=htmlstr;
	diag.OKEvent = function(){diag.close();};//点击确定后调用的方法
	diag.show();
}


//操作栏
function formatOperation(value,row, index){
	return "<a href='javascript:void(0)'  class='btn1 btn_01' onclick='jianlidy(\""+value+"\")' title='查看简历'>查看简历&nbsp;</a>&nbsp;&nbsp;"
		+"<a href='javascript:void(0)'  class='btn1 btn_01' onclick='openSxrz(\""+row.id+"\")' title='筛选日志'>筛选日志</a>"
		;
}

//筛选意见
function openSxyjtjDialog(value){
	/* var jlsxlcId= saveForm();//先提交表单，返回了id才进行筛选的操作
	alert(jlsxlcId); */
	
	$("#sxyjZpjlId").val(value);
	$('#sxyjtjDialog').dialog('open');
}

//筛选日志
function openSxrz(id) {
	$('#sxrzDialog').dialog('open');
	$("#lcrz").datagrid({
		url:'<%=ctx%>/zp/zpjlsxlc/queryLcsxrzByPage.do',
		queryParams: {
			zpjlid: id
		},
		height : '100%',
		rownumbers:true,
		pagination:true
	});
}

//当前的筛查状态
function formatZgsc(value,row, index){
	if (value == "1") {
		return "<span style='color:green;'>已通过</span>";
	} else if (value == "2") {
		return "<span style='color:red;'>未通过</span>";
	}else{
		return "<span style='color:red;'>未筛选</span>";
	}
}
//提交form并且返回id
function saveForm(){
	$("#lcxxForm").form('submit');
	var jlsxlcId= $("#jlsxlcId").val();
	return jlsxlcId;
}
 function jianlidy(id){
	 parent.clikcMenu("<%=ctx%>/zpjlxq/toView.do?id="+id,"查看简历");
 }


 function formatYj(value,row,index){
	 <!--显示意见的格式为 <td>张三：同意！(2017-3-7 14:37:28);</td> -->
	 	if(row.czsjStr){
			return row.zwxm+"："+row.czyj+"("+row.czsjStr+");";
		}else{
			return value;
		}
 }
 //工作流程的提交窗口
 function openTjDialog(){
	 var jlsxmc = $("#jlsxmc").textbox('getText');
	 var isValid = jlsxmc.length>0?true:false;
	 var zpjhId = $("#zpjhId").val();
	 if(isValid==true&&zpjhId.length>0){
	 	$('#tjDialog').dialog('open');
	 }else{
		 alert("请填写筛选信息!");
	 }
 }
 function closeTjDialog(){
	 $('#tjDialog').dialog('close');
 }
 function showBm(value){
	 
	 
 }
 //提交工作流事件
 function process_submit(){
	 var hjID=$("input[name='hjID']:checked").val();
	 var blr =$("#blr").val();
	 
	 if(hjID!=null &&hjID.length>0){
		 if(blr!=null &&blr.length>0){
			 $('#lcxxForm').form('submit',{
			 		url:"<%=ctx%>/zp/zpjlsxlc/processSubmit.do", 
			 		queryParams:{hjID:hjID,blr:blr},
				 	success:function(data){
						$.messager.alert({title:'提醒',msg:'提交成功!'}); 
						location.href='<%=ctx%>/zp/zpjlsxlc/init.do';
					},
					error:function(data){
							alert("保存失败!"); 
					}
			 	 }
				);
		 }else{
			 alert("请选择办理人!");
		 }
		 
	 }else{
	 	alert("请选择环节!");
	 }
	 
 }
 //环节
 function formatOperationHj(value,row, index){
		if(value=='1'){
			return "送部门内审核";
		}else if(value=='2'){
			return "送其他部门会签";
		}else if(value=='3'){
			return "送结束";
		}else{
			return value;
		}
}
</script>
<body style="padding: 5px;">

<form id="lcxxForm" method="post">
<div id="tt" class="easyui-tabs" style="width:100%;height:450px;">   
    <div title="表单 " style="padding:10px;">   
             <!-- 隐藏 -->
             <input type="hidden" name="id" id="jlsxlcId"/>
             <input type="hidden" name="fbrenId" id="fbrenId" value="${vo.fbrenId}" />
             <input type="hidden" name="ssbmId" value="${vo.ssbmId}"/>
             <input type="hidden" name="zt" id="zt" value="1"/><!-- 1暂存2处理中3已完结 -->
             <div class="Tableh2"><strong>筛选信息</strong>
                <div class="btnbox" style="float:right;margin:0px 0px;">
                     <button type="button" class="btn btn_success"  
                     onclick="location='<%=ctx%>/zp/zpjlsxlc/${pageGoBack=='1'?'initYbrw.do':'init.do'}'">返回</button>
                </div>
            </div>
           
            <table width="100%" border="0" cellspacing="6" cellpadding="0">
               <tr>
                	<td align="right" width="15%">筛选流程名称：</td>
                 <td width="35%">
                 <input type="text" class="input02" style="width:100%" id="jlsxmc" name="jlsxmc" value="${vo.jlsxmc }" readonly>
                 </td>
                 <td align="right" width="15%">发起人：</td>
                 <td>
                 	<input type="text" class="input02" style="width:100%"
                 	 id="fbren" name="fbren" value="${vo.fbren}" readonly="readonly">
                 </td>
               </tr>
               <tr>
                	<td align="right">发起时间：</td>
                 <td>
                 	<input type="text" class="input02" style="width:100%"
                 	  value="${vo.czsjStr}" readonly="readonly">
                 </td>
                 <td align="right">发起部门：</td>
                 <td>
                 	<input type="text"  value="${vo.ssbm}"
                 	class="input02" style="width:100%" id="ssbm" name="ssbm">
                 </td>
               </tr>
               <tr>
                	<td align="right">招聘计划：</td>
		                 <td colspan="3">
		                 	<input type="text" class="input02" style="width:100%"
                 	 			id="zpjhMc" name="zpjhMc" value="${vo.zpjhMc}" readonly="readonly">
					<input type="hidden"  id="zpjhId" name="zpjhId">
                 	<input type="hidden"  id="zpjlid" name="zpjlid" value="10000000">
                 	</td>
               </tr>
               
            </table>
            <table id="zpjlxx" style="width: 99%;" >
				<thead>
					<tr>
						<th data-options="field:'username', halign:'center',width:80">姓名</th>
						<th data-options="field:'ssbm', halign:'center',width:110">任聘部门</th>
						<th data-options="field:'rpzhiwei', halign:'center',width:110">任聘岗位</th>
						<th data-options="field:'xb', halign:'center',width:70">性别</th>
						<th data-options="field:'dyxwlxw', halign:'center',width:100">第一学历</th>
						<th data-options="field:'zgxlxw', halign:'center',align:'center',width:100">最高学历</th>
						<th data-options="field:'zzmm', halign:'center',width:110">政治面貌</th>
						<th data-options="field:'dqsxzt', halign:'center',align:'center',width:70,formatter:formatZgsc">筛选状态</th>
						<th data-options="field:'zpjlid',width:240,align:'center',formatter:formatOperation">操作</th>
					</tr>
				</thead>
			</table>
               
    </div> 
      
    <div title="正文" data-options="" style="overflow:auto;padding:10px;">  
    	<input type="hidden"  id="htmlStr" name="htmlStr">
         <div id="htmlStr1" class="easyui-texteditor" title="正文内容" style="width:1000px;height:380px;padding:10px">
    		${vo.htmlStr }
		</div>
    </div>   
    <div title="流程"  style="padding:10px;"> <!-- data-options="iconCls:'icon-reload',closable:true" -->  
            <div class="Centerbox" style="">
              <table width="100%" border="0" cellspacing="10" cellpadding="0">
              <%-- <tr><td>
                  <div class="Tableh2"><strong>本人意见</strong>
                  </div>
              </td></tr>
              <tr><td>
                  <div class="Table02"> 
                     <table width="100%" border="0" cellspacing="0" cellpadding="0">
                     <tr><td>
                     <!-- 操作阶段和操作结论、操作意见 -->
                     <textarea id="czyj" name="czyj" cols="100" rows="3" style="width:100%;"readonly>${vo.czyj }</textarea>
                     </td></tr>
                     </table>
              </td></tr> --%>
              <tr><td>
                  <div class="Table02"> 
                     <table id="hjyjxx" style="width: 100%;" >
						<thead>
							<tr>
								<th data-options="field:'czjd',halign:'center',width:100,formatter:formatOperationHj">流程环节</th>
								<th data-options="field:'czyj', halign:'center',width:900,formatter:formatYj">办理人意见</th>
							</tr>
						</thead>
					</table>
                  </div>
              </td></tr>
              </table>
         </div>    
    </div>   
</div>

 
 <!-- 筛选意见提交窗口 begin-->
<div id="sxyjtjDialog" class="easyui-dialog" title="筛选意见" style="width:400px;height:200px;"   
        data-options="iconCls:'icon-save',resizable:true,modal:true,buttons:[{text:'保存',handler:function(){saveSxyj();}}]">
	<form id="sxyjForm" method="post" style="width:100%;height:100%">      
		<input type="hidden" name="zpjlid" id="sxyjZpjlId"/>
		<input type="hidden" name="zwxm" id="zwxm" value="${vo.fbren}"/>
		<input type="hidden" name="zwxmid" id="zwxmid" value="${vo.fbrenId}"/>
		<input type="hidden" name="czjd" id="czjd" value="审核"/>
		<input type="hidden" name="czjl" id="czjl" value="审核同意"/>
		<input type="hidden" name="ssbmId" value="${vo.ssbmId}"/>
		<textarea id="czyj" name="czyj"  style="width:100%;height:100%"></textarea>
	</form>     
</div>   

<!-- 筛选日志窗口 begin-->
<div id="sxrzDialog" class="easyui-dialog" title="筛选日志" style="width:500px;height:300px;"   
        data-options="iconCls:'icon-save',resizable:true,modal:true,buttons:[{text:'关闭',handler:function(){$('#sxrzDialog').dialog('close');}}]">
	<table id="lcrz" style="width: 100%;" >
		<thead>
			<tr>
				<th data-options="field:'zwxm', halign:'center',width:70">操作人姓名</th>
				<th data-options="field:'czjd', halign:'center',align:'center',width:100,formatter:formatOperationHj">操作阶段</th>
				<th data-options="field:'czjl', halign:'center',align:'center',width:110">操作结论</th>
				<th data-options="field:'czyj',halign:'center',align:'center',width:70">操作意见</th>
				<th data-options="field:'czsjStr',halign:'center',align:'center',width:240">操作时间</th>
			</tr>
		</thead>
	</table>   
</div>      
</body>
</html>
