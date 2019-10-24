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
<!-- 部门树js -->
<script type="text/javascript">
var ctx='<%=ctx%>';
var bmid='${vo.ssbmId}';
</script>
<SCRIPT type="text/javascript" src="<%=ctx%>/js/zp/bmTree.js"></SCRIPT>

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

//批量操作的提交
function bathUpdateSubmit(ids,zt,czyj){
	$("#lcxxForm").form('submit',{  
		    url:"<%=ctx%>/zp/zpjlsxlc/saveFlowInstance.do",  
		    onSubmit: function(param){  
				saveText();
		        var isValid = $(this).form('validate');
				if (isValid==false){
					$.messager.show({title:'提醒',msg:'请填写筛选流程名称',timeout:2500});
				}
				return isValid;  
			
		    },  
		    success:function(data){
				$("#jlsxlcId").val(data);
					//批量操作
				if(data.length>0){
        			var fbren=$("#fbren").val();
        			var fbrenId=$("#fbrenId").val();
        			$.post("<%=ctx%>/zp/zpjlsxlc/bathUpdateZpjlxq.do", 
        					{ids : ids,fbren:fbren,czyj:czyj,
        					fbrenId:fbrenId,id:data,dqsxzt:zt
        					}, 
        					function(result) {
		    						 var zpjhId=$("#zpjhId").val();//招聘计划id
		    						$("#zpjlxx").datagrid('reload',{id:zpjhId});
		    						$('#sxyjtjDialog').dialog('close'); 
        					}
    				);
				}
			},
			error:function(data){
					alert("保存失败!"); 
			}  
		});
}

//初始化
$(document).ready(function(){
	
	//简历信息
	$("#zpjlxx").datagrid({
		url:'<%=ctx%>/zp/zpjlsxlc/queryZpjlxxByPage.do',
		queryParams: {
			id: '9999999'
		},
		height : 300,
		singleSelect : false,
		rownumbers:true,
		pagination:true,
		title:'应聘简历信息',
		toolbar:[
			{
	            text:'批量筛选',
	            iconCls:'icon-edit',
	            handler:function(){
	            	var rows = $("#zpjlxx").datagrid('getSelections');
	        		if (rows.length > 0){
	        					var ids="";
	        					for(var i=0;i<rows.length;i++) {//简历的id
	        	        				ids+=rows[i].zpjlid+',';
	        	        		}
	        					openSxyjtjDialog(ids);
	        		}else{
	        			$.messager.alert("提醒","请至少要选择一条要操作的记录！");
	        		}
	            	
	            }
	        }
			
		]
	});
	//form表单初始化
	$("#lcxxForm").form({  
		    url:"<%=ctx%>/zp/zpjlsxlc/saveFlowInstance.do",  
		    onSubmit: function(param){  
				saveText();
		        var isValid = $(this).form('validate');
				if (isValid==false){
					$.messager.show({title:'提醒',msg:'请填写筛选流程名称',timeout:2500});
				}
				return isValid;  
			
		    },  
		    success:function(data){
					$.messager.show({title:'提醒',msg:'保存成功!',timeout:2000});  
			        $("#jlsxlcId").val(data);  
					$("#hjyjxx").datagrid('reload',{
						zplcid:data
					});
			},
			error:function(data){
					alert("保存失败!"); 
			}  
		});
	
	//环节意见信息
	$("#hjyjxx").datagrid({
		url:'<%=ctx%>/zp/zpjlsxlc/queryHjyjxxByPage.do',
		queryParams: {
			zplcid: '9999999'
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
	return "<a href='javascript:void(0)'  class='btn1 btn_01' onclick='jianlidy(\""+value+"\")' title='查看简历'>查看简历</a>&nbsp;&nbsp;"
		+"<a href='javascript:void(0)'  class='btn1 btn_01' onclick='openSxyjtjDialog(\""+value+"\")' title='筛选'>筛选</a>&nbsp;&nbsp;"
		+"<a href='javascript:void(0)'  class='btn1 btn_01' onclick='openSxrz(\""+row.id+"\")' title='筛选日志'>筛选日志</a>"
		;
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
		pagination:true,
		title:''
	});
	
	$("#lcrz").datagrid("reload");
}
//筛选简历信息意见对话框
function openSxyjtjDialog(value){
	$("#zpjlid").val(value);
	$('#sxyjtjDialog').dialog('open');
}
function saveSxyj(){
	 var ids =$("#zpjlid").val();
	//判断是否通过
	 var zt=$("input[name='czjl']:checked").val();
	 var czyj=$("#czyj").val();
	 bathUpdateSubmit(ids,zt,czyj);
}
 function jianlidy(id){
	 parent.clikcMenu("<%=ctx%>/zpjlxq/toView.do?id="+id,"查看简历");
 }
 function saveText(){
	 var htmlStr=$('#htmlStr1').texteditor('getValue');
	 $("#htmlStr").val(htmlStr);
 }
 function findZpjlxx(value){
	if(value !=null&&value !=''){
	 $("#zpjhId").val(value);	
	 $("#zpjlxx").datagrid('reload',{id:value});
	}
 }
 function formatYj(value,row,index){
	 <!--显示意见的格式为 <td>张三：同意！(2017-3-7 14:37:28);</td> -->
	 	if(row.czsjStr){
			return row.zwxm+"："+row.czyj+"("+row.czsjStr+");";
		}else{
			return value;
		}
 }
 //打开工作流程的提交窗口
 function openTjDialog(){
	 var jlsxmc = $("#jlsxmc").textbox('getText');
	 var isValid = jlsxmc.length>0?true:false;
	 var zpjhId = $("#zpjhId").val();
	 var zpjlid = $("#zpjlid").val();
	 if(isValid==true&&zpjhId.length>0&&zpjlid.length>0){
	 	$('#tjDialog').dialog('open');
	 }else{
		 $.messager.alert({title:'提醒',msg:"请填写筛选信息并且筛选简历!"});
	 }
 }
 function closeTjDialog(){
	 $('#tjDialog').dialog('close');
 }
 
 //提交工作流事件
 function process_submit(){
	 var hjID=$("input[name='hjID']:checked").val();
	 var blr =$("#blr").val();
	 
	 if(hjID!=null &&hjID.length>0){
		 if(blr!=null &&blr.length>0){
			 $('#lcxxForm').form('submit',{
			 		url:"<%=ctx%>/zp/zpjlsxlc/processSubmit.do", 
			 		queryParams:{czjd:hjID,blr:blr},
				 	success:function(data){
						$.messager.alert({title:'提醒',msg:'提交成功!'}); 
						location.href='<%=ctx%>/zp/zpjlsxlc/init.do';
					},
					error:function(data){
						$.messager.alert({title:'提醒',msg:"保存失败!"});
					}
			 	 }
				);
		 }else{
			 $.messager.alert({title:'提醒',msg:"请选择办理人!"});
		 }
		 
	 }else{
		 $.messager.alert({title:'提醒',msg:"请选择环节!"});
	 }
	 
 }
</script>
<body style="padding: 5px;">

<form id="lcxxForm" method="post">
<div id="tt" class="easyui-tabs" style="width:100%;">   
    <div title="表单 " style="padding:10px;">   
             <!-- 隐藏 -->
             <input type="hidden" name="id" id="jlsxlcId"/>
             <input type="hidden" name="fbrenId" id="fbrenId" value="${vo.fbrenId}" />
             <input type="hidden" name="ssbmId" value="${vo.ssbmId}"/>
             <input type="hidden" name="zt" id="zt" value="1"/><!-- 1暂存2处理中3已完结 -->
             <input type="hidden"  id="zpjhId" name="zpjhId">
             <input type="hidden" name="zpjlid" id="zpjlid"/>
	        <input type="hidden" name="zwxm" id="zwxm" value="${vo.fbren}"/>
	        <input type="hidden" name="zwxmid" id="zwxmid" value="${vo.fbrenId}"/>
	        <input type="hidden" name="ssbmId" value="${vo.ssbmId}"/>
	        
             <div class="Tableh2"><strong>筛选信息</strong>
                <div class="btnbox" style="float:right;margin:0px 0px;">
               		<button type="submit" class="btn btn_success" >保存</button>
                     <button type="button" class="btn btn_success"  onclick="location='<%=ctx%>/zp/zpjlsxlc/init.do'">返回</button>
                </div>
            </div>
           
            <table width="100%" border="0" cellspacing="6" cellpadding="0">
               <tr>
                	<td align="right" width="15%">筛选流程名称<span style="color:red;">*</span>：</td>
                 <td width="35%">
                 <input type="text" class="easyui-textbox" 
					data-options="required:true" style="width:100%" id="jlsxmc" name="jlsxmc">
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
                 	  value="${vo.fqsj}" readonly="readonly">
                 </td>
                 <td align="right">发起部门：</td>
                 <td>
                 	<input type="text"  value="${vo.ssbm}"
                 	class="input02" style="width:100%" id="ssbm" name="ssbm">
                 </td>
               </tr>
               <tr>
                	<td align="right">招聘计划<span style="color:red;">*</span>：</td>
		                 <td colspan="3">
		                 	<select width="80" class="select01" name="zpjhMc" id="zpjhMc" onchange="javascript:findZpjlxx(this.value);" required>
							<option value="">---请选择---</option>
							<c:forEach items="${jhList}" var="jh">					
								<option value="${jh.zpjhId}" >${jh.zpjhMc}</option>
							</c:forEach>
							</select>
                 	</td>
               </tr>
               
            </table>
            <table id="zpjlxx" style="width: 100%;" >
				<thead>
					<tr>
						<th data-options="field:'id',checkbox:true"">id</th>
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
         <div id="htmlStr1" class="easyui-texteditor" title="正文内容" style="height:380px;padding:10px">
    		<h3 style="text-align:center">填写正文内容</h3>
		</div>
    </div>   
    <div title="流程"  style="padding:10px;"> <!-- data-options="iconCls:'icon-reload',closable:true" -->  
            <div class="Centerbox" style="">
              <table width="100%" border="0" cellspacing="10" cellpadding="0">
              <tr><td>
                  <div class="Tableh2"><strong>本人意见</strong>
                  <div class="btnbox" style="float:right;margin:0px 0px;">
                        <!-- <button type="button" class="btn btn_success" onclick="cyyj()">常用意见</button> -->
                        <button type="submit" class="btn btn_success" onclick="">保存意见</button>
                        <button type="button" class="btn btn_success"  onclick="openTjDialog();">提交</button>
                        <button type="button" class="btn btn_success"  onclick="location='<%=ctx%>/zp/zpjlsxlc/init.do'">关闭</button></div>
                  </div>
              </td></tr>
              <tr><td>
                     <!-- 操作意见 -->
                     <textarea id="czyj" name="czyj" cols="100" rows="3" style="width:100%;"></textarea>
              </td></tr>
              <tr><td>
                     <table id="hjyjxx" style="width: 100%;" >
						<thead>
							<tr>
								<th data-options="field:'czjd',halign:'center',width:100 ,formatter:formatOperationHj">流程环节</th>
								<th data-options="field:'czyj', halign:'center',width:500,formatter:formatYj">办理人意见</th>
							</tr>
							
						</thead>
					</table>
              </td></tr>
              </table>
         </div>    
    </div>   
</div>
<!-- 提交窗口 begin-->
<div id="tjDialog" class="easyui-dialog" title="任务提交" style="width:500px;height:300px;"   
        data-options="iconCls:'icon-save',resizable:true,modal:true,
        buttons:[{text:'确定',handler:process_submit},{text:'关闭',handler:closeTjDialog}]">   
 <div class="tabbox BoxCss01" >
    <div class="tabCenter" style="background-color:#fff; padding:0px;">
       <table width="100%" border="0" cellspacing="10" cellpadding="0">
           <tr><td>
               <div class="Centerbox">
                  <div class="Tableh2"><strong style="width: 120px">下一环节</strong>
                  </div>
                  <div class="Table03">
                  <table width="100%" border="0" cellspacing="6" cellpadding="0">
                     <tr><td>
                        <input name="hjID" id="hjID" type="radio" value="1" onclick="showBm(this.value)" style="margin:2px 5px 0px 15px;">送部门内审核
                        <input name="hjID" id="hjID" type="radio" value="2" onclick="showBm(this.value)" style="margin:2px 5px 0px 15px;">送其他部门会签
                        <!-- <input name="hjID" type="radio" value="3"  style="margin:2px 5px 0px 15px;">送结束 -->
                     </td>
                     </tr>
                  </table>
                  </div>
                  <div class="Tableh2"><strong>下一环节处理人</strong>
                  </div>
                  <div style="border: 2px;" id="treeDiv"> 
		                  <!-- 办理人hidden -->
		                  <input type="hidden"  id="blr" name="blr" >
                    	 <ul id="tree" class="ztree" style="width:230px; overflow:auto;height: 100px;"></ul>
                  </div>
                  <div style="border: 2px;"> 
	                  <table>
					<tr><td align="left"  style="background: #f4f9fd;height:20px;">
						<b>已选人员列表：<br></b>
						</td>
						   <td width="400px" align="left" id="yxrylb_td"></td>
					</tr>
					</table>
                  </div>
         </div>

         </td></tr></table>    
    </div>
 </div>
 </form>
<!-- 提交窗口 end--> 
 
 <!-- 筛选意见提交窗口 begin-->
<div id="sxyjtjDialog" class="easyui-dialog" title="筛选意见" style="width:500px;height:240px;"   
        data-options="iconCls:'icon-save',resizable:true,modal:true,buttons:[{
        	text:'确定',handler:function(){saveSxyj();}
        }]">
   <form id="sxyjForm" method="post" style="width:100%;height:100%">  
   		<table style="width:100%;">
   			<tr>
   				<td style="padding: 3px;">
   					<input name="czjl" id="czjl" type="radio" value="1" checked="checked"  style="margin:2px 5px 0px 0px;">通过
        			<input name="czjl" id="czjl" type="radio" value="2"   style="margin:2px 5px 0px 15px;">不通过
   				</td>
   			</tr>
   			<tr>
   				<td style="padding: 3px;">
   					筛选意见：
   				</td>
   			</tr>
   			<tr>
   				<td style="padding: 3px;">
   					<textarea id="czyj" name="czyj" style="margin-left:3px;width:99%;" rows="4"></textarea>
   				</td>
   			</tr>
   		</table>
   </form>     
</div> 

<!-- 筛选日志窗口 begin-->
<div id="sxrzDialog" class="easyui-dialog" title="筛选日志" style="width:400px;height:300px;padding: 3px;" 
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
