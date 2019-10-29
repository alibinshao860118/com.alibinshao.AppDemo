<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
	<head>
		<meta name="decorator" content="blank" />
		<script type="text/javascript" src="${ctxStatic}/js/modules/rygl/ryGzjl/ryGzjlList.js"></script>
	
	</head>
	<body>
		<blockquote class="layui-elem-quote">
			<span class="layui-breadcrumb">
			  <a href="javascript:">人员信息</a>
			  <a href="javascript:"><cite>工作经历</cite></a>
			</span>
		</blockquote>
		
		<sys:form id="queryForm">
			<input type="hidden" id="ryjbxxId" name="ryjbxxId" value="${ryGzjl.ryjbxxId}"/>
		</sys:form>
		<sys:hline/>
		<sys:toolbar showExportExcel="true" exportFileName="工作经历信息列表"
			url="${ctx}/rygl/ryGzjl/query" formId="queryForm">
			<div class="layui-btn-group">
				<sys:button onclick="add();" btnClass="layui-btn-small layui-btn-normal"><i class='layui-icon'>&#xe654;</i>新增</sys:button>
				<sys:button onclick="edit();" btnClass="layui-btn-small layui-btn-normal"><i class='layui-icon'>&#xe642;</i>修改</sys:button>
				<sys:button onclick="delete_();" btnClass="layui-btn-small layui-btn-danger"><i class='layui-icon'>&#xe640;</i>删除</sys:button>
			</div>
		</sys:toolbar>
	
		<table id="tt" > 
		   	<thead frozen="true">
				<tr>
					<th data-options="field:'id',checkbox:true"">id</th>
					<th data-options="field:'zgbh',sortable:true,halign:'center',align:'left',width:90">职工编号</th>
					<th data-options="field:'name',sortable:true,halign:'center',align:'left',width:90">姓名</th>
				</tr>
			</thead>
			<thead>
				<tr>
					<th data-options="field:'kssj',sortable:true,halign:'center',align:'left',width:90">开始时间</th>
					<th data-options="field:'jsrq',sortable:true,halign:'center',align:'left',width:90">结束日期</th>
					<th data-options="field:'gzdw',sortable:true,halign:'center',align:'left',width:90">工作单位</th>
					<th data-options="field:'zw',sortable:true,halign:'center',align:'left',width:90">职务</th>
					<th data-options="field:'gznr',sortable:true,halign:'center',align:'left',width:90">工作内容</th>
					<th data-options="field:'lzyr',sortable:true,halign:'center',align:'left',width:90">离职原因</th>
				</tr>
			</thead>
		</table>
		
		<div id="dialog"  style="display: none;padding: 10px 5px 0 25px; ">
			<sys:form id="dialogForm">
				<input type="hidden" id="id" name="id" />
				<input type="hidden" id="ryjbxxId" name="ryjbxxId" value="${ryGzjl.ryjbxxId}"/>
				<sys:formRow>
					<sys:formItem lable="开始时间" isRequired="true">
						<input id="kssj" name="kssj" class="layui-input" type="text"
							value="" required style="width:150px;"
							onFocus="laydate({istime: true, format: 'YYYY-MM-DD'})">
					</sys:formItem>
					<sys:formItem lable="结束时间" isRequired="true" lableStyle="width:90px;">
						<input id="jsrq" name="jsrq" class="layui-input" type="text"
							value="" required style="width:150px;"
							onFocus="laydate({istime: true, format: 'YYYY-MM-DD'})">
					</sys:formItem>
				</sys:formRow>
				<sys:formRow>
					<sys:formItem lable="工作单位" isRequired="true">
						<sys:input id="gzdw" inputStyle="width:150px;"></sys:input>
					</sys:formItem>
					<sys:formItem lable="职务" isRequired="true" lableStyle="width:90px;">
						<sys:input id="zw" inputStyle="width:150px;"></sys:input>
					</sys:formItem>
				</sys:formRow>
				<sys:formRow>
					<sys:formItem lable="工作内容">
						<sys:textarea id="gznr" inputStyle="width:450px;height:30px;"></sys:textarea>
					</sys:formItem>
				</sys:formRow>
				<sys:formRow>
					<sys:formItem lable="离职原因">
						<sys:textarea id="lzyr" inputStyle="width:450px;height:30px;"></sys:textarea>
					</sys:formItem>
				</sys:formRow>
			</sys:form>
		</div>
 	
	</body>
</html>