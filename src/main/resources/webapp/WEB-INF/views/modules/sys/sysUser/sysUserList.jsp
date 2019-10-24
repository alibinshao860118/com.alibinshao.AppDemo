<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
	<head>
		<meta name="decorator" content="default" />
		<script type="text/javascript" src="${ctxStatic}/js/modules/sys/sysUser/sysUserList.js"></script>
	</head>
	<body>
		<table width="100%">
			<tr>
				<td width="23%" style="vertical-align: top;">
					<sys:treePanel type="orgTree"  title="组织机构列表" async="false"
						onClick="treeNodeClick" id="org" panelHeight="613" value="${orgId}"></sys:treePanel>
				</td>
				<td style="vertical-align: top;padding-left: 10px;">
					<sys:form id="queryForm">
						<input type="hidden" id="fullOrgCodes" name="fullOrgCodes" value="${fullOrgCodes}" />
				        <sys:formRow>
				        	<sys:formItem lable="登录账号" lableStyle="width:75px;">
				        		<sys:input id="loginId" inputStyle="width:120px;"></sys:input>
				        	</sys:formItem>
				            <sys:formItem lable="用户姓名" lableStyle="width:75px;">
				            	<sys:input id="name" inputStyle="width:120px;"></sys:input>
				        	</sys:formItem>
				        	<sys:formItem>
					        	<sys:queryButton queryMethod="query();" formId="queryForm">
					        	</sys:queryButton>
					        </sys:formItem>
				        </sys:formRow>
					</sys:form>
				
				<sys:hline/>
				
				<sys:toolbar showExportExcel="true" exportFileName="用户列表"
					url="${ctx}/sys/sysUser/query" formId="queryForm">
		        	<div class="layui-btn-group">
			        	<sys:button onclick="add();" btnClass="layui-btn-small layui-btn-normal"><i class='layui-icon'>&#xe654;</i>新增</sys:button>
						<sys:button onclick="edit();" btnClass="layui-btn-small layui-btn-normal"><i class='layui-icon'>&#xe642;</i>修改</sys:button>
						<sys:button onclick="delete_();" btnClass="layui-btn-small layui-btn-danger"><i class='layui-icon'>&#xe640;</i>删除</sys:button>
					
			       	</div>
			       	<div class="layui-btn-group">
			       		<sys:button onclick="zdjs();" btnClass="layui-btn-small layui-btn-normal"><i class='layui-icon'>&#xe614;</i>指定角色</sys:button>
			       		<sys:button onclick="zdscjg();" btnClass="layui-btn-small layui-btn-normal"><i class='layui-icon'>&#xe614;</i>授权机构</sys:button>
			       		<sys:button onclick="czmm();" btnClass="layui-btn-small layui-btn-normal"><i class='icon iconfont'>&#xe68b;</i>重置密码</sys:button>
			       		
			       	</div>
				</sys:toolbar>
			
				<table id="tt" style="height:450px" > 
				    <thead frozen="true"> 
				        <tr> 
				            <th data-options="field:'id',align:'center',checkbox:true">id</th>
							<th data-options="field:'loginId',width:80,halign:'center',align:'left',sortable:true">登录账号</th>
							<th data-options="field:'name',width:100,halign:'center',align:'left',sortable:true">用户姓名</th>
						</th>
					</thead>
					<thead> 
						<tr> 
							<th data-options="field:'sex',width:80,halign:'center',align:'center',sortable:true, 
								formatter:function(value,row,index){if(value=='0') return '女';else if(value=='1'){return '男';} else return '';}">性别</th>
							<th data-options="field:'mobileTel',width:120,halign:'center',align:'left',sortable:true">电话</th>
							<th data-options="field:'email',width:150,halign:'center',align:'left',sortable:true">邮箱</th>
							<th data-options="field:'enableFlag',width:80,halign:'center',align:'center'" formatter="formatSatus">有效</th>
							<th data-options="field:'fullOrgNames',width:'250',halign:'center',align:'left',sortable:true">所属机构</th>
							<th data-options="field:'orgCode',width:'95',halign:'center',align:'left',sortable:true,hidden:true">所属机构代码</th>
							<th data-options="field:'showOrder',width:'80',halign:'center',align:'center',sortable:true">排列顺序</th>
							<th data-options="field:'tel',width:'95',halign:'center',align:'left',sortable:true,hidden:true">办公电话</th>
							<th data-options="field:'remarks',width:'95',halign:'center',align:'left',sortable:true,hidden:true">备注</th>
				        </tr> 
				    </thead> 
				</table>
				</td>
			</tr>  
		</table>
		
		<div id="tjyh"  style="padding: 8px;padding-left:15px; display: none; ">
			<sys:form id="addForm">
				<input type="hidden" id="id" name="id" />
				<input type="hidden" id="oldLoginId" name="oldLoginId" />
				<sys:formRow>
					<sys:formItem lable="登录帐号" isRequired="true">
	            		<sys:input id="loginId" inputStyle="width:180px;" required="true"></sys:input>
					</sys:formItem>
					<sys:formItem lable="用户名称" isRequired="true">
						<sys:input id="name" inputStyle="width:180px;" required="true"></sys:input>
					</sys:formItem>
				</sys:formRow>
				<sys:formRow> 
					<sys:formItem lable="性别" >
						<input type="radio" name="sex" style=" border: none;" value="1" title="男">
      					<input type="radio" name="sex" style=" border: none;" value="0" title="女" checked>
					</sys:formItem>
					<sys:formItem lable="所属机构" isRequired="true">
						<sys:treeSelect id="orgId" type="orgTree" width="180" panelHeight="203" panelWidth="180"
							value="${orgId}" formId="addForm" ></sys:treeSelect>
					</sys:formItem>
				</sys:formRow>
				<sys:formRow>
					<sys:formItem lable="手机号码" >
						<sys:input id="mobileTel" inputStyle="width:180px;"></sys:input>
					</sys:formItem>
					<sys:formItem lable="办公电话">
						<sys:input id="tel" inputStyle="width:180px;"></sys:input>
					</sys:formItem>
				</sys:formRow>
				<sys:formRow>
					<sys:formItem lable="邮箱" >
						<sys:input id="email" inputStyle="width:180px;"></sys:input>
					</sys:formItem>
					<sys:formItem lable="排列顺序" isRequired="true">
						<sys:input id="showOrder" inputStyle="width:180px;"></sys:input>
					</sys:formItem>
				</sys:formRow>
				<sys:formRow>
					<sys:formItem lable="是否启用">
						 <sys:checkbox checked="true" text="是|否" id="enableFlag"></sys:checkbox>
					</sys:formItem>
				</sys:formRow>
				<sys:formRow>
					<sys:formItem lable="备注" >
						<sys:textarea id="remarks" inputStyle="width:490px;height:30px;"></sys:textarea>
					</sys:formItem>
				</sys:formRow>
			</sys:form>
			<sys:hline/>
			<b style="font-weight: bold;">业务规则说明：</b>
			<ol style="line-height: 20px;font-size: 12px;padding-left: 10px;" >
				<li>
					1、“排列顺序”填入为数字，数字越大排列越靠后；用于角色与首页绑定时，按排序显示首页；
				</li>
				<li>
					2、新增用户密码默认为“111111”；用户默认为启用；
				</li>
			</ol>
		</div>
		
		<div id="roleWin"  style="padding: 8px;padding-left:15px; display: none; ">
			<sys:form id="roleForm">
				<input type="hidden" id="userId" name="userId" />
			</sys:form>
			<table width="100%">
				<tr>
					<td style="width: 45%;vertical-align: top;">
						<table id="kxjslb" style="height: 320px;" width="100%">
							<thead>
								<tr>
								    <th data-options="field:'id',align:'center',checkbox:true">id</th>
									<th data-options="field:'code',width:'90',align:'left',sortable:true">角色编码</th>
									<th data-options="field:'name',width:'120',align:'left',sortable:true">角色名称</th>
								</tr>
							</thead>
						</table>
						<script>
							$(function(){
	 						 	var $t = $("#kxjslb").datagrid({
	 						 		title:"可选角色",
	 						 		pagination:true,
	 						 		singleSelect:false,
	 						 		width:350,
	 						 		onLoadSuccess :function(){
	 						 			var $id = $(this).attr("id");
	 						 			var p = $("#"+$id).datagrid("getPager");
	 						 			$(p).pagination({
	 						 				showRefresh : true,
	 						 				displayMsg : "共{total}条",
	 						 				layout : [ 'first', 'prev', 'links','next', 'last', 'refresh' ],
	 						 				onBeforeRefresh :function(){
	 		 						 			$('#kxjslb').datagrid("options").queryParams = {userId : $('#roleForm #userId').val()};
	 		 						 			return true;
	 		 						 		},
	 						 				buttons: [{
												iconCls:'icon-search',
												handler:function(){
													cktj();
												}
											}]
	 						 			});
	 						 		}
	 						 	});
							});
						</script>
					</td>
					<td style="width: 10%;vertical-align: middle; text-align: center;padding: 5px;">
						<sys:button onclick="addRole()" btnClass="layui-btn-small">添加>></sys:button>
						<sys:hline/>
						<sys:button onclick="removeRole()" btnClass="layui-btn-small"><<移除</sys:button>
					</td>
					<td style="width: 45%;vertical-align: top;">
						<table id="yxjslb" style="height: 320px;" width="100%">
							<thead>
								<tr>
								    <th data-options="field:'id',align:'center',checkbox:true">id</th>
									<th data-options="field:'code',width:'90',align:'left',sortable:true">角色编码</th>
									<th data-options="field:'name',width:'120',align:'left',sortable:true">角色名称</th>
								</tr>
							</thead>
						</table>
						<script>
							 $(function(){
							 	$("#yxjslb").datagrid({
							 		title:"已选角色",
							 		pagination:false,
							 		singleSelect:false,
							 		width:340,
							 		url:''
							 	});
							}); 
						</script>
					</td>
				</tr>
			</table>
		</div>
		
		<div id="grantOrgWin"  style="padding: 8px;padding-left:15px; display: none; ">
			<sys:form id="grantOrgForm">
				<input type="hidden" id="userId" name="userId" />
			</sys:form>
			<table width="100%">
				<tr>
					<td style="width: 45%;vertical-align: top;">
						<sys:treePanel type="orgTree"  title="待选授权组织" checkEnable="true"
							onClick="" id="org2" panelHeight="410" chkStyle="radio" async="false"></sys:treePanel>
					</td>
					<td style="width: 10%;vertical-align: middle; text-align: center;padding: 5px;">
						<sys:button onclick="addGrantOrg()" btnClass="layui-btn-small">添加>></sys:button>
						<sys:hline/>
						<sys:button onclick="removeGrantOrg()" btnClass="layui-btn-small"><<移除</sys:button>
					</td>
					<td style="width: 45%;vertical-align: top;">
						<table id="yxGrantOrg" style="height: 320px;" width="100%">
							<thead>
								<tr>
								    <th data-options="field:'id',align:'center',checkbox:true">id</th>
									<th data-options="field:'orgCode',width:'90',halign:'center',align:'left',sortable:true">机构编码</th>
									<th data-options="field:'fullOrgNames',width:'250',halign:'center',align:'left',sortable:true">机构名称</th>
								</tr>
							</thead>
						</table>
						<script>
							 $(function(){
							 	$("#yxGrantOrg").datagrid({
							 		title:"已选授权组织",
							 		pagination:false,
							 		singleSelect:false,
							 		width:340,
							 		url:''
							 	});
							}); 
						</script>
					</td>
				</tr>
			</table>
		</div>
		
		<div id="resetPwdWin"  style="padding: 8px;display: none; ">
			<sys:form id="resetPwdForm">
				<input type="hidden" id="id" name="id" />
				<sys:formRow>
					<sys:formItem lable="登录帐号" lableStyle="width:120px;">
	            		<sys:input id="loginId" inputStyle="width:180px;" readOnly="true"></sys:input>
					</sys:formItem>
				</sys:formRow>
				<sys:formRow>
					<sys:formItem lable="用户名称" lableStyle="width:120px;">
						<sys:input id="name" inputStyle="width:180px;" readOnly="true"></sys:input>
					</sys:formItem>
				</sys:formRow>
				<sys:hline/>
				<sys:formRow>
					<sys:formItem lable="新密码" isRequired="true" lableStyle="width:120px;">
						<sys:input id="newPasswd" inputStyle="width:180px;"></sys:input>
					</sys:formItem>
				</sys:formRow>
				<sys:formRow>
					<sys:formItem lable="确认密码" isRequired="true" lableStyle="width:120px;">
						<sys:input id="confirmNewPwd" inputStyle="width:180px;"></sys:input>
					</sys:formItem>
				</sys:formRow>
			</sys:form>
		</div>
		
		<div id="cktjWin"  style="padding: 8px;display: none; ">
			<sys:form id="cktjForm">
				<input type="hidden" id="userId" name="userId" />
				<sys:formRow>
					<sys:formItem lable="角色编码" lableStyle="width:120px;">
	            		<sys:input id="code" inputStyle="width:180px;" ></sys:input>
					</sys:formItem>
				</sys:formRow>
				<sys:formRow>
					<sys:formItem lable="角色名称" lableStyle="width:120px;">
						<sys:input id="name" inputStyle="width:180px;" ></sys:input>
					</sys:formItem>
				</sys:formRow>
			</sys:form>
		</div>
	</body>
</html>