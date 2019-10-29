<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
	<head>
		<meta name="decorator" content="default" />
		<script type="text/javascript" src="${ctxStatic}/js/modules/pxgl/pxPxjh/pxPxjhList.js"></script>
	</head>
	<body>
			<sys:form id="queryForm">
				<sys:formRow>
					<sys:formItem lable="计划名称" lableStyle="width:85px;">
		        		<sys:input id="jhMc" inputStyle="width:120px;"></sys:input>
		        	</sys:formItem>
					<sys:formItem lable="计划年度" lableStyle="width:85px;" itemStyle="width:125px;">
		        		<select name="jhYd" id="jhYd" >
							<option value="">----请选择----</option>
							<option value="2017">2017年</option>
							<option value="2018">2018年</option>
						</select>
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
		
		<sys:toolbar showExportExcel="true" exportFileName="培训计划信息表数据列表"
			url="${ctx}/pxgl/pxPxjh/query" formId="queryForm">
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
					<th data-options="field:'jhMc',sortable:true,halign:'center',align:'left',width:90">计划名称</th>
				</tr>
			</thead>
			<thead>
				<tr>
					<th data-options="field:'jhRs',sortable:true,halign:'center',align:'left',width:80">计划人数</th>
					<th data-options="field:'orgId',sortable:true,halign:'center',align:'left',width:110">计划所属部门</th>
					<th data-options="field:'pxDx',sortable:true,halign:'center',align:'left',width:90">培训对象</th>
					<th data-options="field:'psQs',sortable:true,halign:'center',align:'left',width:90">培训期数</th>
					<th data-options="field:'mqTs',sortable:true,halign:'center',align:'left',width:90">每期天数</th>
					<th data-options="field:'jhYd',sortable:true,halign:'center',align:'left',width:90">计划年度</th>
					<th data-options="field:'jhJd',sortable:true,halign:'center',align:'left',width:90">计划季度</th>
					<th data-options="field:'jhYf',sortable:true,halign:'center',align:'left',width:90">计划月份</th>
					<th data-options="field:'pxDd',sortable:true,halign:'center',align:'left',width:90">培训地点</th>
					<th data-options="field:'ysJe',sortable:true,halign:'center',align:'left',width:90">预算金额</th>
					<th data-options="field:'remarks',sortable:true,halign:'center',align:'left',width:90">备注信息</th>
				</tr>
			</thead>
		</table>
		
		<div id="dialog"  style="display: none;padding: 10px 10px 0 40px; ">
			<sys:form id="dialogForm">
				<input type="hidden" id="id" name="id" />
				<sys:formRow>
					<sys:formItem lable="计划名称" lableStyle="width:85px;" isRequired="true">
						<sys:input id="jhMc" inputStyle="width:150px;"></sys:input>
			   		</sys:formItem>
					<sys:formItem lable="计划人数" lableStyle="width:85px;" isRequired="true">
						<sys:input id="jhRs" inputStyle="width:150px;"></sys:input>
			   		</sys:formItem>
			   </sys:formRow>
			   <sys:formRow>
			   		<sys:formItem lable="计划所属部门" isRequired="true" lableStyle="width:85px;">
						<sys:treeSelect id="orgId" type="orgTree" width="150" panelHeight="203" panelWidth="180"
						value="${pxPxb.orgId}" formId="dialogForm" ></sys:treeSelect>
					</sys:formItem>
					<sys:formItem lable="培训对象" lableStyle="width:85px;" isRequired="true" >
						<sys:input id="pxDx" inputStyle="width:150px;"></sys:input>
			   		</sys:formItem>
			   </sys:formRow>
			   <sys:formRow>
					<sys:formItem lable="培训期数" lableStyle="width:85px;">
						<sys:input id="psQs" inputStyle="width:150px;"></sys:input>
			   		</sys:formItem>
			   		<sys:formItem lable="每期天数" lableStyle="width:85px;">
						<sys:input id="mqTs" inputStyle="width:150px;"></sys:input>
			   		</sys:formItem>
			   </sys:formRow>
			   <sys:formRow>
					<sys:formItem lable="计划年度" isRequired="true"
					lableStyle="width:85px;" itemStyle="width:125px;">
			   			<%-- <sys:inputDate id="jhYd" format="YYYY"></sys:inputDate> --%>
						<select name="jhYd" id="jhYd" >
							<option value="2017">2017年</option>
							<option value="2018">2018年</option>
						</select>
			   		</sys:formItem>
			   		<sys:formItem lable="计划季度" lableStyle="width:150px;" itemStyle="width:125px;">
			   			<select name="jhJd" id="jhJd" >
							<option value="第一季度">第一季度</option>
							<option value="第二季度">第二季度</option>
							<option value="第三季度">第三季度</option>
							<option value="第四季度">第四季度</option>
						</select>
			   		</sys:formItem>
			   		
			   </sys:formRow>
			   <sys:formRow>
					<sys:formItem lable="计划月份" lableStyle="width:85px;" itemStyle="width:125px;">
			   			<select name="jhYf" id="jhYf" >
							<option value="1月">1月</option>
							<option value="2月">2月</option>
							<option value="3月">3月</option>
							<option value="4月">4月</option>
							<option value="5月">5月</option>
							<option value="6月">6月</option>
							<option value="7月">7月</option>
							<option value="8月">8月</option>
							<option value="9月">9月</option>
							<option value="10月">10月</option>
							<option value="11月">11月</option>
							<option value="12月">12月</option>
						</select>
			   		</sys:formItem>
					<sys:formItem lable="预算金额" lableStyle="width:150px;">
						<sys:input id="ysJe" inputStyle="width:150px;"></sys:input>
			   		</sys:formItem>
			   </sys:formRow>
			   <sys:formRow>
					<sys:formItem lable="培训地点" lableStyle="width:85px;">
						<sys:input id="pxDd" inputStyle="width:445px;"></sys:input>
			   		</sys:formItem>
					
			   </sys:formRow>
			   <sys:formRow>
					<sys:formItem lable="备注" lableStyle="width:85px;">
						<sys:textarea id="remarks" inputStyle="width:445px;height:35px;"></sys:textarea>
					</sys:formItem>
			   </sys:formRow> 
			   <sys:formRow>
			  </sys:formRow>
			</sys:form>
		</div>
	</body>
</html>