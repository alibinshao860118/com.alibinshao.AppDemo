<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="decorator" content="default" />
<script type="text/javascript">

$(document).ready(function () {
	$("#jlxx").datagrid({
		url : '${ctx}/zpjlxq/findPage',
		queryParams : initQueryParams(),
		height : 445,
		rownumbers:true,
		pagination:true
	});
});

function buildFormData(form){
	var input = $("<input>");
    input.attr("type", "hidden");
    input.attr("name", "ssbm");
    input.attr("value", $("#jlForm #ssbm").val());
    form.append(input);
    
    input = $("<input>");
    input.attr("type", "hidden");
    input.attr("name", "zpjhBh");
    input.attr("value", $("#jlForm #zpjhBh").val());
    form.append(input);
    
    input = $("<input>");
    input.attr("type", "hidden");
    input.attr("name", "username");
    input.attr("value", $("#jlForm #username").val());
    form.append(input);
    
    input = $("<input>");
    input.attr("type", "hidden");
    input.attr("name", "yxbz");
    input.attr("value", $("#jlForm #yxbz").val());
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
}

function query() {
	var queryParams = $("#jlForm").serializeObject();
	if($.trim(queryParams.zpjhBh)==''){
		fdp.utils.tips("招聘计划编号不能为空","#jlForm #zpjhBh");
		return false;
	}
	
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
	return  "<span  onclick='viewJl(\""+row.id+"\")' class='layui-btn layui-btn-normal layui-btn-mini' style='cursor: pointer;'>详情</span>"
	    + "<span  onclick='view(\""+row.id+"\")' class='layui-btn layui-btn-normal layui-btn-mini' style='cursor: pointer;'>报名表</span>"
		+ "<span class='layui-btn layui-btn-warn layui-btn-mini' onclick='updateYxbz(\""+1+"\",\""+row.id+"\")' style='cursor: pointer;'>有效</span>"
		+ "<span class='layui-btn layui-btn-danger layui-btn-mini' onclick='updateYxbz(\""+0+"\",\""+row.id+"\")' style='cursor: pointer;'>无效</span>";
}

function viewJl(id) {
	parent.clikcMenu("${ctx}/zpjlxq/toJlView?id="+id,"查看简历详情");
}

function view(id) {
	parent.clikcMenu("${ctx}/zpjlxq/toView?id="+id,"查看报名表");
}

function updateYxbz(yxbz,id) {
	fdp.utils.confirm("您确认要进行此操作吗？",function(r){
		if(r){
			layer.closeAll();
			$.post("${ctx}/zpjlxq/updateYxbz", {ids : id ,yxbz : yxbz}, function(result) {
				if (result == "SUCCESS") {
					query();
				} else {
					fdp.utils.alertError("操作失败，请联系系统管理员！");
				}
			});
		}
	});
}

function formatYxbz(value,row, index){
	if (row.yxbz == "1") {
		return "<span style='color:green;'>有效</span>";
	} else if (row.yxbz == "0") {
		return "<span style='color:red;'>无效</span>";
	}
}

function more_(){
	if($("#a").css("display")=="none"){
		$("#a").css("display","");
		$("#b").css("display","");
	}else{
		$("#a").css("display","none");
		$("#b").css("display","none");
	}
}
</script>

<title>应聘简历管理</title>
</head>
<body style="padding: 10px;">
	<sys:form id="jlForm">
		<sys:formRow>
        	<sys:formItem lable="招聘计划编号" isRequired="true" lableStyle="width:120px;"
        		itemStyle="width:120px;">
        		<sys:input id="zpjhBh" inputStyle="width:120px;" value="${zpjhBh}"></sys:input>
        	</sys:formItem>
            <sys:formItem lable="姓名" lableStyle="width:90px;" itemStyle="width:120px;">
            	<sys:input id="username" inputStyle="width:120px;"></sys:input>
        	</sys:formItem>
            <sys:formItem lable="应聘部门" lableStyle="width:90px;" itemStyle="width:120px;">
            	<sys:input id="ssbm" inputStyle="width:120px;"></sys:input>
        	</sys:formItem>
        	<sys:formItem itemStyle="width:270px;">
	        	<sys:queryButton queryMethod="query();" formId="jlForm"
	        		showMore="true" moreMethod="more_()">
	        	</sys:queryButton>
	        </sys:formItem>
        </sys:formRow>
        <sys:formRow>
        	<sys:formItem lable="应聘职位" lableStyle="width:120px;" itemStyle="width:120px;">
        		<sys:input id="ypzw" inputStyle="width:120px;"></sys:input>
        	</sys:formItem>
        	<sys:formItem lable="第一学历" lableStyle="width:90px;" itemStyle="width:120px;">
        		<select id="dyxlxw" name="dyxlxw">
					<option value=" ">---请选择---</option>
					<c:forEach items="${xl}" var="xl">					
						<option value="${xl.id}">${xl.name}</option>
					</c:forEach>
	            </select>
        	</sys:formItem>
        	<sys:formItem lable="最高学历" lableStyle="width:90px;" itemStyle="width:120px;">
        		<select id="zgxlxw" name="zgxlxw" >
	                <option value=" ">---请选择---</option>
					<c:forEach items="${xl}" var="xl">					
						<option value="${xl.id}">${xl.name}</option>
					</c:forEach>
	            </select>
        	</sys:formItem>
        </sys:formRow>
        <sys:formRow id="a" style="display:none;">
        	<sys:formItem lable="籍贯" lableStyle="width:120px;" itemStyle="width:120px;">
        		<sys:input id="jg" inputStyle="width:120px;"></sys:input>
        	</sys:formItem>
        	<sys:formItem lable="民 族" lableStyle="width:90px;" itemStyle="width:120px;">
        		<sys:input id="mz" inputStyle="width:120px;"></sys:input>
        	</sys:formItem>
        	<sys:formItem lable="性别" lableStyle="width:90px;" itemStyle="width:120px;">
        		<select name="xb" id="xb">
					<option value=" ">---请选择---</option>
					<option value="男">男</option>
					<option value="女">女</option>
				</select>
        	</sys:formItem>
        </sys:formRow>
        <sys:formRow id="b" style="display:none;">
        	<sys:formItem lable="政治面貌" lableStyle="width:120px;" itemStyle="width:120px;">
        		<select name="zzmm" id="zzmm">
					<option value=" ">---请选择---</option>
					<c:forEach items="${zzmm}" var="mzdp">					
						<option value="${mzdp.id}">${mzdp.name}</option>
					</c:forEach>
				</select>
			</sys:formItem>
        	<sys:formItem lable="简历状态" lableStyle="width:90px;" itemStyle="width:120px;">
        		<select id="yxbz" name="yxbz" >
        			 <option value=" ">---请选择---</option>
        			<option value="0">无效</option>
        			<option value="1">有效</option>
        		</select>
        	</sys:formItem>
        	
        	<span class="layui-form-label" style="width:90px;">年龄：</span>
		    <div class="layui-input-inline" style="width: 47px;">
		      <input type="number" id="minNl"  name="minNl"   autocomplete="off" class="layui-input"
		      	min="0">
		    </div>
       		<div class="layui-form-mid">-</div>
		    <div class="layui-input-inline" style="width: 47px;">
		      <input type="number" id="maxNl"  name="maxNl"  autocomplete="off" class="layui-input"
		      	min="0">
		    </div>
        </sys:formRow>
	</sys:form>
	<sys:hline/>
		
		<sys:toolbar showExportExcel="false">
        	<sys:button onclick="batchRight();" btnClass="layui-btn-small layui-btn-warn"><i class='layui-icon'>&#xe618;</i>批量有效</sys:button>
			<sys:button onclick="batchError();" btnClass="layui-btn-small layui-btn-danger"><i class='layui-icon'>&#x1006;</i>批量无效</sys:button>
			<sys:button onclick="batchHmc();" btnClass="layui-btn-small layui-btn-normal"><i class='icon iconfont'>&#xe61b;</i> 下载花名册</sys:button>
			<sys:button onclick="batchBmb();" btnClass="layui-btn-small layui-btn-normal"><i class='icon iconfont'>&#xe61b;</i> 下载报名表</sys:button>
		</sys:toolbar>
		
		<table id="jlxx" style="width: 100%;" >
			<thead frozen="true">
				<tr>	
					<th data-options="field:'id',checkbox:true"">id</th>
					<th data-options="field:'id1',width:230,align:'center',formatter:formatOperation">操作</th> 
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
					<th data-options="field:'yxbz', halign:'center',align:'center',width:80,formatter:formatYxbz">简历状态</th>
					
				</tr>
			</thead>
		</table>
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
			
			function batchRight(){
            	var ids = [];
        		var rows = $("#jlxx").datagrid('getSelections');
        		if (rows.length > 0) {
        			fdp.utils.confirm("您确认要进行批量有效操作吗？",function(r){
        				if(r){
		        			var rwmcs = [];
		        			for(var i=0;i<rows.length;i++) {
		        				rwmcs.push(rows[i].id);
		        			}
		        			$.post("${ctx}/zpjlxq/updateYxbz", {ids : rwmcs.join('&') ,yxbz : "1"}, function(result) {
		    					if (result == "SUCCESS") {
		    						layer.closeAll();
		    						query();
		    					} else {
		    						fdp.utils.alertError("操作失败，请联系系统管理员！");
		    					}
		    				});
        				}
        			});
        		}else{
        			fdp.utils.alertWarn("请至少要选择一条要操作的记录！");
        		}
			}
			
			function batchError(){
				var ids = [];
        		var rows = $("#jlxx").datagrid('getSelections');
        		if (rows.length > 0) {	
        			fdp.utils.confirm("您确认要进行批量无效操作吗？",function(r){
        				if(r){
		        			var rwmcs = [];
		        			for(var i=0;i<rows.length;i++) {
		        				rwmcs.push(rows[i].id);
		        			}
		        			$.post("${ctx}/zpjlxq/updateYxbz", {ids : rwmcs.join('&') ,yxbz : "0"}, function(result) {
		    					if (result == "SUCCESS") {
		    						layer.closeAll();
		    						query();
		    					} else {
		    						fdp.utils.alertError("操作失败，请联系系统管理员！");
		    					}
		    				});
        				}
        			});
        		}else{
        			fdp.utils.alertWarn("请至少要选择一条要操作的记录！");
        		}
			}
			function batchHmc(){
				fdp.utils.confirm("您确认要进行批量下载操作吗？",function(r){
    				
    				if(r){
    					layer.closeAll();
    					
			            if ($("#file").val() != '') {
			                var form = $("<form>");//定义一个form表单
			                form.attr("style", "display:none");
			                form.attr("target", "");
			                form.attr("method", "post");
			                form.attr("action", "${ctx}/zpjlxq/batchDownloadJl");
			                $("body").append(form);//将表单放置在web中
			                
			                buildFormData(form);
			                
			        		//ajax调用生成文件
			        		var p = $(form).serializeObject()
							$.post("${ctx}/zpjlxq/batchGenJlFile",p,function(fileId){

								$("<input type='hidden' name='fileId'>").val(fileId).appendTo(form);
								form.submit().remove();//表单提交
							});
			            }
    				}
    			});
			}
			
			function batchBmb(){
				fdp.utils.confirm("您确认要进行批量下载操作吗？",function(r){
    				
    				if(r){
    					layer.closeAll();
    					
			            if ($("#file").val() != '') {
			                var form = $("<form>");//定义一个form表单
			                form.attr("style", "display:none");
			                form.attr("target", "");
			                form.attr("method", "post");
			                form.attr("action", "${ctx}/zpjlxq/batchDownloadJl.do");
			                $("body").append(form);//将表单放置在web中
			                
			                buildFormData(form);
			                
			        		//ajax调用生成文件
			        		var p = $(form).serializeObject()
							$.post("${ctx}/zpjlxq/batchGenBmb",p,function(fileId){
								$("<input type='hidden' name='fileId'>").val(fileId).appendTo(form);
								form.submit().remove();//表单提交
							});
			            }
    				}
    			});
			}
		</script>
</body>
</html>
