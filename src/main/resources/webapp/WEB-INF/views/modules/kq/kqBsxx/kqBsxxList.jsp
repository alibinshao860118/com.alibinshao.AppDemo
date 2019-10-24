<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
	<head>
		<meta name="decorator" content="default" />
		<script type="text/javascript" src="${ctxStatic}/js/modules/kq/kqBsxx/kqBsxxList.js"></script>
	</head>
	<body>
		<sys:form id="queryForm">
			<sys:formRow>
				<sys:formItem lable="考勤年份" lableStyle="width:90px" itemStyle="width:110px">
		        	<select id="kqYf" name="kqYf">
						<option value=" ">--请选择--</option>
						<option value="2016">2016年</option>
						<option value="2017">2017年</option>
						<option value="2018">2018年</option>
						<option value="2019">2019年</option>
						<option value="2020">2020年</option>
						<option value="2021">2021年</option>
					</select>
		        </sys:formItem>
				<sys:formItem lable="考勤月份" lableStyle="width:90px" itemStyle="width:110px">
		        	<select id="kqMf" name="kqMf">
		        		<option value=" ">--请选择--</option>
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
				<sys:formItem>
			        <sys:queryButton queryMethod="query();" formId="queryForm">
			        </sys:queryButton>
			    </sys:formItem>
			</sys:formRow>
		</sys:form>
		<sys:hline/>
		<sys:toolbar showExportExcel="true" exportFileName="考勤报送信息数据列表"
			url="${ctx}/kq/kqBsxx/query" formId="queryForm">
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
					<th data-options="field:'orgName',sortable:true,halign:'center',align:'left',width:180">考勤部门</th>
				</tr>
			</thead>
			<thead>
				<tr>
					<th data-options="field:'kqYf',sortable:true,halign:'center',align:'center',width:90">考勤年份</th>
					<th data-options="field:'kqMf',sortable:true,halign:'center',align:'center',width:90">考勤月份</th>
					<th data-options="field:'remarks',sortable:true,halign:'center',align:'left',width:150">备注信息</th>
					<th data-options="field:'createNameBy',sortable:true,halign:'center',align:'center',width:90">报送日期</th>
					<th data-options="field:'createDateStr',sortable:true,halign:'center',align:'center',width:90">报送人</th>
				</tr>
			</thead>
		</table>
		
		<div id="dialog"  style="display: none;padding: 10px 10px 0 20px; ">
			<sys:form id="dialogForm">
				<input type="hidden" id="id" name="id" />
				<sys:formRow>
					<sys:formItem lable="考勤部门" lableStyle="width:90px;" isRequired="true" itemStyle="width:140px;">
						<sys:treeSelect id="orgId" type="orgTree" width="140" panelHeight="203" panelWidth="180"
							value="${orgId}" formId="dialogForm" onSelect="onSelect"></sys:treeSelect>
			   		</sys:formItem>
					<sys:formItem lable="考勤年份" lableStyle="width:90px;" isRequired="true" itemStyle="width:100px;">
						<select id="kqYf" name="kqYf">
							<option value="2016">2016年</option>
							<option value="2017">2017年</option>
							<option value="2018">2018年</option>
							<option value="2019">2019年</option>
							<option value="2020">2020年</option>
							<option value="2021">2021年</option>
						</select>
			   		</sys:formItem>
					<sys:formItem lable="考勤月份" lableStyle="width:90px;" isRequired="true" itemStyle="width:100px;">
						<select id="kqMf" name="kqMf">
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
			   	</sys:formRow>
			   	<sys:formRow>
					<sys:formItem lable="备注信息" lableStyle="width:90px" itemStyle="width:140px;">
						<sys:textarea id="remarks" inputStyle="width:560px;height:30px;"></sys:textarea>
			   		</sys:formItem>
			   </sys:formRow>
			</sys:form>
			<sys:hline/>
	   		<table id="ttt" style="height: 200px;width: 98%"> 
		   		<thead frozen="true">
					<tr>
						<th data-options="field:'xm',sortable:true,halign:'center',align:'left',width:90">姓名</th>
						<th data-options="field:'zgbh',sortable:true,halign:'center',align:'left',width:90">职工编号</th>
					</tr>
				</thead>
				<thead>
					<tr>
						<th data-options="field:'bjTs',sortable:true,halign:'center',align:'center',width:90,editor:{type:'numberspinner',options:{min:0,precision:0}}">病假(天)</th>
						<th data-options="field:'sjTs',sortable:true,halign:'center',align:'center',width:90,editor:{type:'numberspinner',options:{min:0,precision:0}}">事假(天)</th>
						<th data-options="field:'tqjTs',sortable:true,halign:'center',align:'center',width:100,editor:{type:'numberspinner',options:{min:0,precision:0}}">探亲假(天)</th>
						<th data-options="field:'hsjTs',sortable:true,halign:'center',align:'center',width:100,editor:{type:'numberspinner',options:{min:0,precision:0}}">婚丧假(天)</th>
						<th data-options="field:'cjTs',sortable:true,halign:'center',align:'center',width:90,editor:{type:'numberspinner',options:{min:0,precision:0}}">产假(天)</th>
						<th data-options="field:'qtTs',sortable:true,halign:'center',align:'center',width:90,editor:{type:'numberspinner',options:{min:0,precision:0}}">其他(天)</th>
					</tr>
				</thead>
			</table>
		</div>
	</body>
</html>