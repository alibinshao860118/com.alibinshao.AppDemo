<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
	<head>
		<meta name="decorator" content="default" />
		<script type="text/javascript" src="${ctxStatic}/js/modules/rygl/ryJyjl/ryJyjlList.js"></script>
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
					
					<sys:toolbar showExportExcel="true" exportFileName="教育经历信息列表"
						url="${ctx}/rygl/ryJyjl/query" formId="queryForm">
					</sys:toolbar>
					
					<table id="tt" > 
					   	<thead frozen="true">
							<tr>
								<th data-options="field:'zgbh',sortable:true,halign:'center',align:'left',width:90">职工编号</th>
								<th data-options="field:'name',sortable:true,halign:'center',align:'left',width:90">姓名</th>
								<th data-options="field:'fullOrgNames',sortable:true,halign:'center',align:'left',width:100">所属部门</th>
							</tr>
						</thead>
						<thead>
							<tr>
								<th data-options="field:'xwMc',sortable:true,halign:'center',align:'left',width:90">学位</th>
								<th data-options="field:'xwhqsj',sortable:true,halign:'center',align:'left',width:90">学位获取时间</th>
								<th data-options="field:'xlMc',sortable:true,halign:'center',align:'left',width:90">学历</th>
								<th data-options="field:'xlhqsj',sortable:true,halign:'center',align:'left',width:90">学历获取时间</th>
								<th data-options="field:'kssj',sortable:true,halign:'center',align:'left',width:90">开始时间</th>
								<th data-options="field:'bysj',sortable:true,halign:'center',align:'left',width:90">毕业时间</th>
								<th data-options="field:'zy',sortable:true,halign:'center',align:'left',width:90">专业</th>
								<th data-options="field:'xz',sortable:true,halign:'center',align:'left',width:90">学制</th>
								<th data-options="field:'byxx',sortable:true,halign:'center',align:'left',width:90">毕业学校</th>
								<th data-options="field:'xxszgj',sortable:true,halign:'center',align:'left',width:90">学校所在国家</th>
							</tr>
						</thead>
					</table>
				</td>
			</tr>  
		</table>
	</body>
</html>