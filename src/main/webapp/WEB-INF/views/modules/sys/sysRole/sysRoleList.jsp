<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
	<head>
		<meta name="decorator" content="default" />
		<script type="text/javascript" src="${ctxStatic}/js/modules/sys/sysRole/sysRoleList.js"></script>
	</head>
	<body>
		<table width="100%">
			<tr>
				<td width="70%" style="vertical-align: top;">
				 	<sys:form id="queryForm">
				 		<%-- <input type="hidden" id="fullOrgCodes" name="fullOrgCodes" value="${fullOrgCodes}" /> --%>
				        <sys:formRow>
 				        	<sys:formItem lable="角色编码" lableStyle="width:80px;">
				            	<input type="text" name="code" placeholder="请输入角色编码" 
				            		autocomplete="off" style="width:120px;" class="layui-input">
				        	</sys:formItem> 
				            <sys:formItem lable="角色名称" lableStyle="width:80px;">
			           	 		<input type="text" name="name" placeholder="请输入角色名称" 
				            		autocomplete="off" style="width:120px;" class="layui-input">
				        	</sys:formItem>
				        	<sys:formItem>
					        	<sys:queryButton queryMethod="query();" formId="queryForm">
					        	</sys:queryButton>
					        </sys:formItem>
				        </sys:formRow>
					</sys:form>
			 	
			 		<sys:hline />
			 		
			 		<sys:toolbar showExportExcel="true" exportFileName="角色信息列表"
						url="${ctx}/sys/sysRole/query" formId="queryForm">
						<div class="layui-btn-group">
							<sys:button onclick="add();" btnClass="layui-btn-small layui-btn-normal"><i class='layui-icon'>&#xe654;</i>新增</sys:button>
							<sys:button onclick="edit();" btnClass="layui-btn-small layui-btn-normal"><i class='layui-icon'>&#xe642;</i>修改</sys:button>
							<sys:button onclick="delete_();" btnClass="layui-btn-small layui-btn-danger"><i class='layui-icon'>&#xe640;</i>删除</sys:button>
						</div>
						<%-- <div class="layui-btn-group">
				       		<sys:button onclick="add();" btnClass="layui-btn-small layui-btn-normal"><i class='layui-icon'>&#xe614;</i>指定成员</sys:button>
				       	</div> --%>
					</sys:toolbar>
					
					<table id="tt" style="height:450px" > 
						<thead frozen="true"> 
					        <tr> 
					            <th data-options="field:'id',align:'center',checkbox:true">id</th>
								<th data-options="field:'code',halign:'center',align:'left',width:80">角色编号</th>
								<th data-options="field:'name',halign:'center',align:'left',width:120">角色名称</th>
							</tr>
						</thead>
					    <thead> 
					        <tr> 
							<th data-options="field:'fullOrgNames',halign:'center',align:'left',width:150">所属机构</th>
							<th data-options="field:'enableFlag',halign:'center',align:'center',width:80" formatter="formatenableFlag">是否有效</th>
							<th data-options="field:'showOrder',halign:'center',align:'center',width:80">显示顺序</th>
							<th data-options="field:'remarks',halign:'center',align:'left',width:190">备注</th>
					        </tr> 
					    </thead> 
					</table>
				</td>
				<td style="vertical-align: top;padding-left: 10px;">
					<sys:treePanel type="grantTree" panelHeight="541" title="角色拥有的功能权限【请选择】" 
						onClick="treeNodeClick" id="menuTree" checkEnable="true" async="true">
						<sys:button onclick="saveRoleMenu()" btnClass="layui-btn-small layui-btn-normal">保存</sys:button>
						<sys:button onclick="resetRoleMenu()" btnClass="layui-btn-small">重置</sys:button>
						<br/><span>说明：<span style="color:red;">请单击左侧表格中角色，查看或设置功能权限。</span></span><br/>
					</sys:treePanel>
					<form>
						<input type="hidden" id="roleId" />
					</form>
				</td>
			</tr>
		</table>
		
		<div id="dialog"  style="display: none;padding: 10px 25px 0 0px; ">
			<sys:form id="dialogForm">
				<sys:formRow>
					<sys:formItem lable="角色编码" isRequired="true">
						<input type="hidden" id="id" name="id" />
						<sys:input id="code" inputStyle="width:180px;" required="true"></sys:input>
					</sys:formItem>
					<sys:formItem lable="角色名称" isRequired="true">
						<sys:input id="name" inputStyle="width:180px;" required="true"></sys:input>
					</sys:formItem>
				</sys:formRow>
				<sys:formRow>
					<sys:formItem lable="所属机构" isRequired="true">
						<sys:treeSelect id="orgId" type="orgTree" width="180" panelHeight="300" panelWidth="280"
							value="${orgId}" formId="dialogForm"></sys:treeSelect>
					</sys:formItem>
					<sys:formItem lable="排列顺序" isRequired="true">
						<sys:input id="showOrder" inputStyle="width:180px;" ></sys:input>
					</sys:formItem>
				</sys:formRow>
				<sys:formRow>
					<sys:formItem lable="是否有效" >
						<sys:checkbox checked="true" text="是|否" id="enableFlag"></sys:checkbox>
					</sys:formItem>
				</sys:formRow>
				<sys:formRow>
					<sys:formItem lable="备注">
						<sys:textarea id="remarks" inputStyle="width:490px;height:30px;"></sys:textarea>
					</sys:formItem>
				</sys:formRow>
			</sys:form>
		</div>
	</body>
</html>