<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%
String ctx = request.getContextPath();
%>
<meta charset="utf-8">
<link href="<%=ctx%>/css/comon.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" type="text/css" href="<%=ctx%>/js/jquery-easyui-1.5/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=ctx%>/js/jquery-easyui-1.5/themes/icon.css">

<script type="text/javascript" src="<%=ctx%>/js/jquery.js"></script>
<script type="text/javascript" src="<%=ctx%>/js/js.js"></script>
<script type="text/jscript" src="<%=ctx%>/js/Njs.js" ></script>
<script type="text/javascript" src="<%=ctx%>/js/jquery-easyui-1.5/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=ctx%>/js/jquery-easyui-1.5/jquery.easyuiext.js"></script>

<style type="text/css">
</style>
<script type="text/javascript">
 
$(document).ready(function () {
	$("#jlxx").datagrid({
		url : '<%=ctx%>/zpjlxq/findPage.do',
		queryParams : initQueryParams(),
		height : 445,
		rownumbers:true,
		pagination:true,
		title:'查询结果',
		toolbar:[
			{
	            text:'批量通过',
	            iconCls:'icon-ok',
	            handler:function(){
	            	var ids = [];
	        		var rows = $("#jlxx").datagrid('getSelections');
	        		if (rows.length > 0) {	
	        			$.messager.confirm("确认","您确认要进行批量通过操作吗？",function(r){
	        				if(r){
			        			var rwmcs = [];
			        			for(var i=0;i<rows.length;i++) {
			        				rwmcs.push(rows[i].id);
			        			}
			        			$.post("<%=ctx%>/zpjlxq/updateZgsc.do", {ids : rwmcs.join('&') ,zgsc : "1"}, function(result) {
			    					if (result == "SUCCESS") {
			    						query();
			    					} else {
			    						alert("操作失败，请联系系统管理员！", {closeBtn:0});
			    					}
			    				});
	        				}
	        			});
	        		}else{
	        			$.messager.alert("警告","请至少要选择一条要操作的记录！");
	        		}
            	}
	        },{
	            text:'批量不通过',
	            iconCls:'icon-no',
	            handler:function(){
	            	var ids = [];
	        		var rows = $("#jlxx").datagrid('getSelections');
	        		if (rows.length > 0) {	
	        			$.messager.confirm("确认","您确认要进行批量不通过操作吗？",function(r){
	        				if(r){
			        			var rwmcs = [];
			        			for(var i=0;i<rows.length;i++) {
			        				rwmcs.push(rows[i].id);
			        			}
			        			$.post("<%=ctx%>/zpjlxq/updateZgsc.do", {ids : rwmcs.join('&') ,zgsc : "0"}, function(result) {
			    					if (result == "SUCCESS") {
			    						query();
			    					} else {
			    						alert("操作失败，请联系系统管理员！", {closeBtn:0});
			    					}
			    				});
	        				}
	        			});
	        		}else{
	        			$.messager.alert("警告","请至少要选择一条要操作的记录！");
	        		}
            	}
	        },"-",{
	        	text:'批量下载',
	        	iconCls:'icon-print',
	        	handler:function(){
	        		$.messager.confirm("确认","您确认要进行批量下载操作吗？",function(r){
	        			//TODO 为什么附件上传为空就不让下载
	        			//if ($("#file").val() != '') {
			                var form = $("<form>");//定义一个form表单
			                form.attr("style", "display:none");
			                form.attr("target", "");
			                form.attr("method", "post");
			                form.attr("action", "<%=ctx%>/zpjlxq/batchDownloadJl.do");
			                $("body").append(form);//将表单放置在web中
			                
			                var input = $("<input>");
			                input.attr("type", "hidden");
			                input.attr("name", "zzmm");
			                input.attr("value", $("#zzmm").val());
			                form.append(input);
			                
			                input = $("<input>");
			                input.attr("type", "hidden");
			                input.attr("name", "ssbm");
			                input.attr("value", $("#ssbm").val());
			                
			                input = $("<input>");
			                input.attr("type", "hidden");
			                input.attr("name", "dyxl");
			                input.attr("value", $("#dyxl").val());
			                form.append(input);
			                
			                input = $("<input>");
			                input.attr("type", "hidden");
			                input.attr("name", "zgxl");
			                input.attr("value", $("#zgxl").val());
			                form.append(input);
			                
			                input = $("<input>");
			                input.attr("type", "hidden");
			                input.attr("name", "dyxlxx");
			                input.attr("value", $("#dyxlxx").val());
			                form.append(input);
			                
			                var ids = [];
			        		var rows = $("#jlxx").datagrid('getSelections');
			        		if (rows.length > 0) {	
			        			$.each(rows,function(i,item){
			        				ids[i] = item.id;
			        			});
			        			input = $("<input>");
				                input.attr("type", "hidden");
				                input.attr("name", "ids");
				                input.attr("value", ids.join("&"));
				                form.append(input);
			        		}
			                
			                form.submit().remove();//表单提交
			           // }
        			});
	        			
	        	}
	        },"-",{
	        	text:'批量打印简历',
	        	iconCls:'icon-print',
	        	handler:function(){
	        		var ids = [];
	        		var rows = $("#jlxx").datagrid('getSelections');
	        		if (rows.length > 0) {	
	        			$.each(rows,function(i,item){
	        				ids[i] = item.id;
	        			});
	        		}
	        		parent.clikcMenu("<%=ctx%>/zpjlxq/toPldy.do?ids="+ids,"批量打印简历");	        			
	        	}
	        },"-",{
	        	text:'打印花名册',
	        	iconCls:'icon-print',
	        	handler:function(){
	        		var ids = [];
	        		var rows = $("#jlxx").datagrid('getSelections');
	        		if (rows.length > 0) {	
	        			$.each(rows,function(i,item){
	        				ids[i] = item.id;
	        			});
	        		}
	        		parent.clikcMenu("<%=ctx%>/zpjlxq/dyhmc.do?ids="+ids,"打印花名册");	        			
	        	}
	        },"-",{
	        	text:'批量附件下载',
	        	iconCls:'icon-save',
	        	handler:function(){
	        		var ids = [];
	        		var rows = $("#jlxx").datagrid('getSelections');
	        		if (rows.length > 0) {	
	        			$.each(rows,function(i,item){
	        				ids[i] = item.id;
	        			});
	        		}
	        		var form = $("<form>"); // 定义一个form表单
	        		form.attr("style", "display:none");
	        		form.attr("target", "");
	        		form.attr("method", "post");
	        		form.attr("action", "<%=ctx%>/zpjlxq/downloadJlFjByIds.do?ids="+ids);
	        		$("body").append(form);// 将表单放置在web中
	        		form.submit();// 表单提交
	        		form.remove();
	        	}
	        }
		]
	});

	end();
});

function query() {
	$("#jlxx").datagrid('reload', initQueryParams());
}

function initQueryParams() {
	var queryParams = $("#jlForm").serializeObject();

	var str = '{';
	for(var p in queryParams){ 
		var obj = queryParams[p];
		var value = "";
	    // 方法
	    if(typeof(obj)=="function"){ 
	     	//obj[p]();
	    }else{ 
	     	// p 为属性名称，obj[p]为对应属性的值
	     	if(obj != ''){
	     		str += '"'+ p +'"'+  ":" +'"'+  obj + '"'+  ",";
	     	}
	    } 
	}
	str += '}';
	var obj = eval('(' + str + ')');
    return obj;
}

function resetx(){
	$("#jlForm")[0].reset();
	query();
}

// 每行添加操作栏
function formatOperation(value,row, index){
	return "<span  onclick='viewJl(\""+row.id+"\")' class='btn1 btn_01' style='cursor: pointer;'>详情</span>&nbsp;&nbsp;" 
	+ "<a href='javascript:void(0)' onclick='view(\""+row.id+"\")'><span class='btn1 btn_01'>报名表</span></a>&nbsp;&nbsp;"
	+ "<a href='javascript:void(0)' onclick='updateZgsc(\""+1+"\",\""+row.id+"\")'><span class='btn1 btn_01'>通过</span></a>&nbsp;&nbsp;"
	+ "<a href='javascript:void(0)' onclick='updateZgsc(\""+0+"\",\""+row.id+"\")'><span class='btn1 btn_01'>不通过</span></a>&nbsp;&nbsp;"
	+ "<a href='javascript:void(0)' onclick='fjsc(\""+row.id+"\")'><span class='btn1 btn_01'>附件上传</span></a>&nbsp;&nbsp;"
	+ "<a href='javascript:void(0)' onclick='fjxz(\""+row.id+"\")'><span class='btn1 btn_01'>附件下载</span></a>";
}

function viewJl(id) {
	parent.clikcMenu("<%=ctx%>/zpjlxq/toJlView.do?id="+id,"查看简历详情");
}

function view(id) {
	parent.clikcMenu("<%=ctx%>/zpjlxq/toView.do?id="+id,"查看简历");
}

function fjsc(id) {
	$("#fjxxForm")[0].reset();
	$("#fjxxForm #id").val(id);
	
	 $('#fjxxDialog').dialog('open');
}

function fjxz(id) {
	// 由于ajxax返回不能是二进制流形式，通过form表单来请求。
	var form = $("<form>"); // 定义一个form表单
	form.attr("style", "display:none");
	form.attr("target", "");
	form.attr("method", "post");
	form.attr("action", "<%=ctx%>/zpjlxq/downloadJlFjById.do?id="+id);
	$("body").append(form);// 将表单放置在web中
	form.submit();// 表单提交
	form.remove();
}

function end() {
	$('#fjxxDialog').dialog('close');
}

function updateZgsc(zgsc,id) {
	$.messager.confirm("确认","您确认要进行此操作吗？",function(r){
		if(r){
			$.post("<%=ctx%>/zpjlxq/updateZgsc.do", {ids : id ,zgsc : zgsc}, function(result) {
				if (result == "SUCCESS") {
					query();
				} else {
					alert("操作失败，请联系系统管理员！", {closeBtn:0});
				}
			});
		}
	});
}

function formatZgsc(value,row, index){
	if (row.zgsc == "1") {
		return "<span style='color:green;'>通过</span>";
	} else if (row.zgsc == "0") {
		return "<span style='color:red;'>未通过</span>";
	}
}

</script>
<title>应聘简历资格审查</title>
</head>

<body style="padding: 10px;"> 
	<div>
		<form id="jlForm"  method="post"  enctype="multipart/form-data"> 
			<table width="100%" border="0" cellspacing="6" cellpadding="0">
				<tr>
					<td align="right">
						姓名：
					</td>
					<td>
						<input class="easyui-textbox" name="username" type="text" id="username">
					</td>				
					<td align="right">
						应聘部门：
					</td>
					<td>
						<input class="easyui-textbox" name="ssbm" type="text" id="ssbm">
					</td>
					<td align="right">
						应聘职位：
					</td>
					<td>
						<input class="easyui-textbox" name="ypzw" type="text" id="ypzw">
					</td>
					<td>
						<div class="btnbox" style="float: right">
							<button type="button" class="btn btn_success" onclick="query()">搜 索</button>
							<button type="button" class="btn btn_qx" onclick="resetx()">重 置</button>
							<!-- TODO 此处与combox多选冲突-->
							<button type="button" class="btn btn_qx more_search" >更多></button>
					        <script>
					        $(document).ready(function(e) {
					          $(".more_search").click(function(){
								  $(".last_line").fadeToggle()
								  });  
					        });
					        </script> 
				        </div>
					</td>
				</tr>
				<tr>
					<td align="right">
						第一学历：
					</td>
					<td>
						<select id="dyxlxw" name="dyxlxw"  class="easyui-combobox" multiple="true" labelPosition="top" style="width:160px;">
							<c:forEach items="${xl}" var="xl">					
								<option value="${xl.id}">${xl.name}</option>
							</c:forEach>
			            </select>
					</td>
					<td align="right">
						最高学历：
					</td>
					<td>
						<select id="zgxlxw" name="zgxlxw"  class="easyui-combobox" multiple="true" labelPosition="top" style="width: 160px;">
			                <!-- <option value="">---请选择---</option> -->
							<c:forEach items="${xl}" var="xl">					
								<option value="${xl.id}">${xl.name}</option>
							</c:forEach>
			            </select>
					</td>
					<td align="right">
						年龄：
					</td>
					<td>
						<input name="nl" id="nl" class="easyui-slider" style="width:160px" data-options="
			                showTip: true,
			                range: true,
			                value: [20,60]
			            ">
					</td>
					<td></td>
				</tr>
				<tr class="last_line" style="display:none">
				<!-- TODO 此处与combox多选冲突<tr class="last_line" style="display:none">-->
					<td align="right">
						第一学历毕业学校：
					</td>
					<td>
						<input class="easyui-textbox" name="dyxlxx" type="text" id="dyxlxx" style="width:160px;">
					</td>
					<td align="right">
						第一学历211：
					</td>
					<td>
		                <input type="radio" name="dy211" value="0">否
		                <input type="radio" name="dy211" value="1">是
					</td>
					<td align="right">
						政治面貌：
					</td>
					<td align="left">
						<select class="easyui-combobox" name="zzmm" class="select01" id="zzmm" labelPosition="top" style="width:160px;">
							<option value="">---请选择---</option>
							<c:forEach items="${zzmm}" var="mzdp">					
								<option value="${mzdp.id}">${mzdp.name}</option>
							</c:forEach>
						</select>
					</td>
					<td></td>
				</tr>
				<tr class="last_line" style="display:none">
					
					<td align="right">
						最高学历毕业学校：
					</td>
					<td>
						<input class="easyui-textbox" name="zgxlxx" type="text" id="zgxlxx" style="width:160px;">
					</td>
					<td align="right">
						最高学历211：
					</td>
					<td>
						<input type="radio" name="zg211" value="0">否
		                <input type="radio" name="zg211" value="1">是
					</td>
					<td align="right">
						性别：
					</td>
					<td>
						<select class="easyui-combobox" name="xb" id="xb" labelPosition="top" style="width:160px;">
							<option value="">---请选择---</option>
							<option value="1">男</option>
							<option value="0">女</option>
							<option value="2">其他</option>
						</select>
					</td>
					<td></td>
				</tr>
				<tr class="last_line" style="display:none">
					<td align="right">
						籍贯：
					</td>
					<td>
						<input class="easyui-textbox" name="jg" type="text" id="jg" style="width:160px;">
					</td>
					<td align="right">
						民 族：
					</td>
					<td>
						<input class="easyui-textbox" name="mz" type="text" id="mz" style="width:160px;">
					</td>
					<td align="right">
						是否有效：
					</td>
					<td>
						<input type="radio" name="yxbz" value="0">否
		                <input type="radio" name="yxbz" value="1" checked="checked">是
					</td>
					<td></td>
				</tr>
				<tr class="last_line" style="display:none">
					<td align="right">
						已确认：
					</td>
					<td>
						<input type="radio" name="xcqrbz" value="0" >否
		                <input type="radio" name="xcqrbz" value="1"  checked="checked">是
					</td>
					<td align="right">
					</td>
					<td>
					</td>
					<td align="right">
					</td>
					<td>
					</td>
					<td></td>
				</tr>
			</table>
		</form>	
		<div style="height: 10px;"></div>
		<table id="jlxx" style="width: 100%;" >
			<thead frozen="true">
				<tr>	
					<th data-options="field:'id',checkbox:true"">id</th>
					<th data-options="field:'id1',width:255,align:'center',formatter:formatOperation">操作</th> 
					<th data-options="field:'username', halign:'center',align:'center',width:70">姓名</th>
				</tr>
			</thead>
			<thead>
				<tr>
					<th data-options="field:'xb', halign:'center',align:'center',width:40">性别</th>
					<th data-options="field:'csrq', halign:'center',align:'center',width:90">出生年月</th>
					<th data-options="field:'zzmmMc', halign:'center',align:'center',width:80">政治面貌</th>
					<th data-options="field:'jg', halign:'center',align:'center',width:80">籍贯</th>
					<th data-options="field:'dyxlMc', halign:'center',align:'center',width:80">第一学历</th>
					<th data-options="field:'dyxlxx', halign:'center',align:'center',width:120">第一学历学校</th>
					<th data-options="field:'dyzy', halign:'center',align:'center',width:120">第一学历专业</th>
					<th data-options="field:'dyxlrxsj', halign:'center',align:'center',width:120,formatter:formatDyxlkssj">第一学历时间</th>
					<th data-options="field:'zgxlMc', halign:'center',align:'center',width:80">最高学历</th>
					<th data-options="field:'zgxlxx', halign:'center',align:'center',width:120">最高学历学校</th>
					<th data-options="field:'sxzy', halign:'center',align:'center',width:120">最高学历专业</th>
					<th data-options="field:'zgxlrxsj', halign:'center',align:'center',width:120,formatter:formatZgxlkssj">最高学历时间</th>
					<th data-options="field:'sj', halign:'center',align:'center',width:120">联系电话</th>
					<th data-options="field:'ssbm', halign:'center',align:'center',width:80">任聘部门</th>
					<th data-options="field:'rpzhiwei', halign:'center',align:'center',width:80">应聘职位</th>
					<th data-options="field:'zgsc', halign:'center',align:'center',width:70,formatter:formatZgsc">确认状态</th>
				</tr>
			</thead>
		</table>
	</div>
	<script>
		function formatDyxlkssj(value, row, index){
			if(value==null){
				return "";
			}
			return (value==null?'':value) +" - " + (row.dyxlbysj==null?'':row.dyxlbysj);
		}
		
		function formatZgxlkssj(value, row, index){
			if(value==null){
				return "";
			}
			return (value==null?'':value) +" - " + (row.zgxlbysj==null?'':row.zgxlbysj);
		}
	</script>	
	<!-- 附件上传窗口 start -->
	<div id="fjxxDialog" class="easyui-dialog" title="附件上传" style="width:400px;height:230px; display:none;"   
        data-options="iconCls:'icon-save',resizable:true,modal:true,buttons:[{text:'保存',handler:save},{text:'关闭',handler:end}]">   
		<form id="fjxxForm"  method="post" enctype="multipart/form-data"> 
			<input name="id" id="id" type="hidden">
			<table>
				<tr id="fileTr">
					<td width="80" align="right" colspan="2">附件：</td>
					<td id="fileTd" class="select01" colspan="2">
						<input class="easyui-filebox" id="file" name="sourceFile" style="width:250px"
							data-options="multiple:false,buttonText:'浏览',onChange:fileChangeFj" />
					</td>
				</tr>
				<tr>
					<td>
						&nbsp;
					<td/>
					<td>
						<ul class="info_list">
							
						</ul> 
					<td/>
				</tr>
			</table>
			<script type="text/javascript">
			function fileChangeFj(){
				var value = $("#file").filebox('getValue');
				if(value!=null && value!=""){
					var name = value.replace(/.{0,}\\/, "");
					var outer = "<li></li>"
					var str = "<a href='javascript:void(0);' class='fjName'>"+name+"</a>";
					str += "<a href='javascript:void(0);' class='delete'><img src=\"<%=ctx%>/images/dot02.jpg\" /></a>";
					
					var $outer = $(outer);
					var $td = $("#fileTd"); 
					
					$td.attr("id","")
					$td.css("display", "none");
					jQuery($td).appendTo($outer);
					
					jQuery(str).appendTo($outer);
					
					$outer.appendTo(".info_list");
					
					var tdObj = $("<td></td>");
					tdObj.attr("id","fileTd")
					tdObj.attr("colspan","2");
					
					var inputObj = $("<input class='easyui-filebox' id='file' name='sourceFile' style='width:250px' data-options='buttonText:\"浏览\",multiple:false,onChange:fileChangeFj' />");
					$(inputObj).appendTo(tdObj);
					
					$(tdObj).appendTo("#fileTr");
					$.parser.parse('#fileTr');
				}
			}
				
				$(document).ready(function () {
					$(".delete").live("click",function(){
						$(this).parent().remove();
					});
				});
				
				function save(){
					$("#fjxxForm").form({
						  url:"<%=ctx%>/zpjlxq/saveFj.do",   
					      success:function(data){    
					    	  if(data=='SUCCESS'){
					    		  alert("附件提交成功！");
					    		  end();
					    		  $(".info_list li").remove();
					    	  }else{
					    		  alert("附件提交失败，请联系系统管理员！");
					    	  }
					     }    
					});
					$('#fjxxForm').submit();  
				}
			</script>
			</form>
		</div>
		<!-- 附件上传窗口 end -->
	
</body>
</html>
