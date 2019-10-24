<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
	<head>
		<meta name="decorator" content="default" />
		<script type="text/javascript" src="${ctxStatic}/js/modules/rygl/ryGzjl/ryGzjlList.js"></script>
	</head>
	<body>
		<table width="100%">
			<tr>
				<td width="23%" style="vertical-align: top;">
					<sys:treePanel type="orgTree"  title="组织机构列表" async="false"
						onClick="treeNodeClick" id="org" panelHeight="600" value="${orgId}"></sys:treePanel>
					<script>
						function treeNodeClick(e,treeId,treeNode){
							$("#queryForm #fullOrgCodes").val(treeNode.otherParam.fullOrgCodes);
							query();
						}
					</script>
				</td>
				<td style="vertical-align: top;padding-left: 10px;">
					<sys:form id="queryForm">
						<input type="hidden" id="ryjbxxId" name="ryjbxxId" />
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
					
					<sys:toolbar showExportExcel="true" exportFileName="工作经历信息列表"
						url="${ctx}/rygl/ryGzjl/query" formId="queryForm">
					</sys:toolbar>
					
					<table id="tt" > 
					   	<thead frozen="true">
							<tr>
								<th data-options="field:'zgbh',sortable:true,halign:'center',align:'left',width:90">职工编号</th>
								<th data-options="field:'name',sortable:true,halign:'center',align:'left',width:90">姓名</th>
								<th data-options="field:'fullOrgNames',sortable:true,halign:'center',align:'left',width:110">所属部门</th>
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
				</td>
			</tr>  
		</table>
	</body>
</html>