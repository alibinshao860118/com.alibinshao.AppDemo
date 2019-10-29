<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
	<head>
		<meta name="decorator" content="default" />
		<script type="text/javascript" src="${ctxStatic}/js/modules/rygl/ryQtzl/ryQtzlList.js"></script>

	</head>
	<body>
		
		<div style="display: none;">
		<sys:form id="queryForm">
	        <sys:formRow>
	        	<sys:formItem lable="人员基本信息ID">
	        		<sys:input id="ryjbxxId" value="${ryQtzl.ryjbxxId}" inputStyle="width:180px;"></sys:input>
	        	</sys:formItem>
	            
	        	<sys:formItem>
		        	<sys:queryButton queryMethod="query();" formId="queryForm">
		        	</sys:queryButton>
		        </sys:formItem>
	        </sys:formRow>
		</sys:form>
		</div>
		
		其它资料
		<sys:hline/>
		<sys:toolbar showExportExcel="true" exportFileName="其它资料列表"
			url="${ctx}/rygl/ryQtzl/query" formId="queryForm">
			<div class="layui-btn-group">
				<sys:button onclick="add();" btnClass="layui-btn-small layui-btn-normal"><i class='layui-icon'>&#xe654;</i>新增</sys:button>
				<%-- <sys:button onclick="edit();" btnClass="layui-btn-small layui-btn-normal"><i class='layui-icon'>&#xe642;</i>修改</sys:button> --%>
				<sys:button onclick="delete_();" btnClass="layui-btn-small layui-btn-danger"><i class='layui-icon'>&#xe640;</i>删除</sys:button>
			</div>
		</sys:toolbar>
	
		<table id="tt" > 
		   	<thead frozen="true">
				<tr>
					<th data-options="field:'id',checkbox:true"">id</th>
				</tr>
			</thead>
			<thead>
				<tr>
										<th data-options="field:'zlmc',sortable:true,halign:'center',align:'left',width:90">资料名称</th>
										<th data-options="field:'zlsm',sortable:true,halign:'center',align:'left',width:90">资料说明</th>
										<th data-options="field:'fjmc',sortable:true,halign:'center',align:'left',width:90">附件名称</th>
									</tr>
			</thead>
		</table>
		
		<div id="dialog"  style="display: none;padding: 10px 25px 0 0px; ">
			<sys:form id="dialogForm" >
				<sys:formRow>
				
					<sys:input id="id" inputStyle="width:180px;display:none;"
						></sys:input>
					<sys:input id="ryjbxxId" inputStyle="width:180px;display:none;"
						value="${ryQtzl.ryjbxxId}"></sys:input>
					<sys:input id="enableFlag" inputStyle="width:180px;display:none;"
						value="1"></sys:input>
						
					<sys:formItem lable="资料名称" isRequired="true">
						<sys:input id="zlmc" inputStyle="width:180px;" ></sys:input>
					</sys:formItem>
					
				</sys:formRow>
				<sys:formRow>
				<sys:formItem lable="资料说明" isRequired="true">
						<sys:textarea id="zlsm" inputStyle="width:490px;height:30px;"></sys:textarea>
					</sys:formItem>
				</sys:formRow>
				<%-- <sys:formRow>
					<sys:formItem lable="附件名称" >
						<sys:input id="fjmc" inputStyle="width:180px;" ></sys:input>
					</sys:formItem>
				</sys:formRow> --%>
				<sys:formRow>
					<sys:formItem lable="附件上传" >
								<!-- data-options="multiple:false,buttonText:'浏览',onChange:fileChangeFj"  -->
					<input class="easyui-filebox" id="file" name="sourceFile" style="width:250px"
								data-options="multiple:false,buttonText:'浏览' "
								maxlength="200" />
					</sys:formItem>
				</sys:formRow>
					<ul class="info_list">
								
					</ul>
			</sys:form>
		</div>
 	
	</body>
</html>