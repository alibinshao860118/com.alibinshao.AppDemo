<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
	<head>
		<meta name="decorator" content="default" />
		<script type="text/javascript" src="${ctxStatic}/js/modules/dp/dpCgxx/dpCgxxList.js"></script>
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
			<sys:formRow>
		    </sys:formRow>
		</sys:form>
		<sys:hline/>
		<sys:toolbar showExportExcel="true" exportFileName="出国信息数据列表"
			url="${ctx}/dp/dpCgxx/query" formId="queryForm">
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
				</tr>
			</thead>
			<thead>
				<tr>
					<th data-options="field:'xm',sortable:true,halign:'center',align:'left',width:90">姓名</th>
					<th data-options="field:'zgbh',sortable:true,halign:'center',align:'left',width:90">职工编号</th>
					<th data-options="field:'cgLb',sortable:true,halign:'center',align:'left',width:90">出国类别</th>
					<th data-options="field:'cgGb',sortable:true,halign:'center',align:'left',width:90">出国国别</th>
					<th data-options="field:'cgRw',sortable:true,halign:'center',align:'left',width:90">出国任务</th>
					<th data-options="field:'cgFs',sortable:true,halign:'center',align:'left',width:90">出国方式</th>
					<th data-options="field:'cgRq',sortable:true,halign:'center',align:'left',width:90">出国日期</th>
					<th data-options="field:'yhgRq',sortable:true,halign:'center',align:'left',width:90">应回国日期</th>
					<th data-options="field:'hgRq',sortable:true,halign:'center',align:'left',width:90">实回国日期</th>
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
					<sys:formItem lable="出国类别" lableStyle="width:85px;" isRequired="true">
						<sys:input id="cgLb" inputStyle="width:150px;"></sys:input>
			   		</sys:formItem>
					<sys:formItem lable="出国国别" lableStyle="width:85px;" isRequired="true">
						<sys:input id="cgGb" inputStyle="width:150px;"></sys:input>
			   		</sys:formItem>
			   </sys:formRow>
			   <sys:formRow>
					<sys:formItem lable="出国任务" lableStyle="width:85px">
			        	<sys:textarea id="cgRw" inputStyle="width:150px;height:30px;"></sys:textarea>
			   		</sys:formItem>
					<sys:formItem lable="出国方式" lableStyle="width:85px">
						<sys:input id="cgFs" inputStyle="width:150px;"></sys:input>
			   		</sys:formItem>
			   </sys:formRow>
			   <sys:formRow>
					<sys:formItem lable="出国日期" lableStyle="width:85px;" isRequired="true">
			        	<sys:inputDate id="cgRq" inputStyle="width:150px;"></sys:inputDate>
			   		</sys:formItem>
					<sys:formItem lable="应回国日期" lableStyle="width:85px;" isRequired="true">
			        	<sys:inputDate id="yhgRq" inputStyle="width:150px;"></sys:inputDate>
			   		</sys:formItem>
			   </sys:formRow>
			   <sys:formRow>
					<sys:formItem lable="实回国日期" lableStyle="width:85px">
			        	<sys:inputDate id="hgRq" inputStyle="width:150px;"></sys:inputDate>
			   		</sys:formItem>
			  </sys:formRow>
			</sys:form>
		</div>
	</body>
</html>