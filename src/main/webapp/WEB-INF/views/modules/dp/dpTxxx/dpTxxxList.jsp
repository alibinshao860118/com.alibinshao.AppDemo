<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
	<head>
		<meta name="decorator" content="default" />
		<script type="text/javascript" src="${ctxStatic}/js/modules/dp/dpTxxx/dpTxxxList.js"></script>
	</head>
	<body>
		<sys:form id="queryForm">
			<sys:formRow>
				<sys:formItem lable="姓名" lableStyle="width:85px">
		        	<sys:input id="xm" inputStyle="width:120px;"></sys:input>
		        </sys:formItem>
				<sys:formItem lable="职工编号" lableStyle="width:85px">
		        	<sys:input id="zgbh" inputStyle="width:120px;"></sys:input>
		        </sys:formItem>
				<sys:formItem>
			        <sys:queryButton queryMethod="query();" formId="queryForm">
			        </sys:queryButton>
			    </sys:formItem>
			</sys:formRow>
		</sys:form>
		<sys:hline/>
		<sys:toolbar showExportExcel="true" exportFileName="退休信息列表"
			url="${ctx}/dp/dpTxxx/query" formId="queryForm">
			<div class="layui-btn-group">
				<sys:button onclick="add();" btnClass="layui-btn-small layui-btn-normal"><i class='layui-icon'>&#xe654;</i>新增</sys:button>
				<sys:button onclick="edit();" btnClass="layui-btn-small layui-btn-normal"><i class='layui-icon'>&#xe642;</i>修改</sys:button>
				<sys:button onclick="delete_();" btnClass="layui-btn-small layui-btn-danger"><i class='layui-icon'>&#xe640;</i>删除</sys:button>
			</div>
		</sys:toolbar>
	
		<table id="tt" > 
		   	<thead frozen="true">
				<tr>
					<th data-options="field:'id',checkbox:true">id</th>
					<th data-options="field:'xm',sortable:true,halign:'center',align:'left',width:90">姓名</th>
					<th data-options="field:'zgbh',sortable:true,halign:'center',align:'left',width:90">职工编号</th>
				</tr>
			</thead>
			<thead>
				<tr>
					<th data-options="field:'txYf',sortable:true,halign:'center',align:'left',width:90">退休年份</th>
					<th data-options="field:'txMf',sortable:true,halign:'center',align:'left',width:90">退休月份</th>
					<th data-options="field:'txJb',sortable:true,halign:'center',align:'left',width:90">退休级别</th>
					<th data-options="field:'ltxJe',sortable:true,halign:'center',align:'left',width:90">离退休费</th>
					<th data-options="field:'ltxbtJe',sortable:true,halign:'center',align:'left',width:90">离退补贴</th>
				</tr>
			</thead>
		</table>
		
		<div id="dialog"  style="display: none;padding: 10px 10px 0 40px; ">
			<sys:form id="dialogForm">
				<input type="hidden" id="id" name="id" />
				<sys:formRow>
					<sys:formItem lable="姓名" lableStyle="width:85px;" isRequired="true">
						<sys:input id="xm" inputStyle="width:150px;"></sys:input>
			   		</sys:formItem>
					<sys:formItem lable="职工编号" lableStyle="width:85px;" isRequired="true">
						<sys:input id="zgbh" inputStyle="width:150px;"></sys:input>
			   		</sys:formItem>
			   </sys:formRow>
			   <sys:formRow>
					<sys:formItem lable="退休年份" lableStyle="width:85px;" isRequired="true">
			        	<select id="txYf" style="width:150px;">
			        		<option value="">--请选择--</option>
			        	</select>
			   		</sys:formItem>
					<sys:formItem lable="退休月份" lableStyle="width:85px;" isRequired="true">
			        	<select id="txMf" style="width:150px;">
			        		<option value="">--请选择--</option>
			        	</select>
			   		</sys:formItem>
			   </sys:formRow>
			   <sys:formRow>
					<sys:formItem lable="退休级别" lableStyle="width:85px">
						<sys:input id="txJb" inputStyle="width:150px;"></sys:input>
			   		</sys:formItem>
					<sys:formItem lable="离退休费" lableStyle="width:85px">
						<sys:input id="ltxJe" inputStyle="width:150px;"></sys:input>
			   		</sys:formItem>
			   </sys:formRow>
			   <sys:formRow>
					<sys:formItem lable="离退补贴" lableStyle="width:85px">
						<sys:input id="ltxbtJe" inputStyle="width:150px;"></sys:input>
			   		</sys:formItem>
			  </sys:formRow>
			</sys:form>
		</div>
	</body>
</html>