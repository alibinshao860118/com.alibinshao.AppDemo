<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
	<head>
		<meta name="decorator" content="default" />
		<script type="text/javascript" src="${ctxStatic}/js/modules/rygl/ryJbxx/ryJbxxList.js"></script>
	</head>
	<body>
		<table width="100%">
			<tr>
				<td width="23%" style="vertical-align: top;">
					<sys:treePanel type="orgTree"  title="组织机构列表" async="false"
						onClick="treeNodeClick" id="org" panelHeight="600" value="${orgId}"></sys:treePanel>
				</td>
				<td style="vertical-align: top;padding-left: 10px;">
					<sys:form id="queryForm">
						<input type="hidden" id="fullOrgCodes" name="fullOrgCodes" value="${fullOrgCodes}" />
				        <sys:formRow>
				        	<sys:formItem lable="职工编号" itemStyle="width:120px;">
				        		<sys:input id="zgbh" inputStyle="width:120px;"></sys:input>
				        	</sys:formItem>
				        	<sys:formItem lable="姓名" lableStyle="width:60px;" itemStyle="width:130px;">
				        		<sys:input id="name" inputStyle="width:120px;"></sys:input>
				        	</sys:formItem>
				        	<sys:formItem>
					        	<sys:queryButton queryMethod="query();" formId="queryForm">
					        	</sys:queryButton>
					        </sys:formItem>
				        </sys:formRow>
					</sys:form>
					
					<sys:hline/>
					
					<sys:toolbar showExportExcel="true" exportFileName="人员基本信息列表"
						url="${ctx}/rygl/ryJbxx/query" formId="queryForm">
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
								<th data-options="field:'fullOrgNames',sortable:true,halign:'center',align:'left',width:110">部门名称</th>
								<th data-options="field:'xb',sortable:true,halign:'center',align:'center',width:55,formatter:formatXb">性别</th>
								<th data-options="field:'birthdateStr',sortable:true,halign:'center',align:'center',width:90">出生日期</th>
								<th data-options="field:'sfjh',sortable:true,halign:'center',align:'center',width:80,formatter:formatSfjhbz">婚否</th>
								<th data-options="field:'zjlxMc',sortable:true,halign:'center',align:'left',width:120">证件类型</th>
								<th data-options="field:'sfzjhm',sortable:true,halign:'center',align:'left',width:190">证件号码</th>
								<th data-options="field:'gj',sortable:true,halign:'center',align:'left',width:90">国籍</th>
								<th data-options="field:'mzMc',sortable:true,halign:'center',align:'center',width:90">民族</th>
								<th data-options="field:'zzmmMc',sortable:true,halign:'center',align:'left',width:90">政治面貌</th>
								<th data-options="field:'birthaddress',sortable:true,halign:'center',align:'left',width:90">出生地</th>
								<th data-options="field:'jg',sortable:true,halign:'center',align:'left',width:90">籍贯</th>
								<th data-options="field:'hjzl',sortable:true,halign:'center',align:'left',width:90">户籍种类</th>
							</tr>
						</thead>
					</table>
				</td>
			</tr>  
		</table>
	</body>
</html>