<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
	<head>
		<meta name="decorator" content="default" />
		<script type="text/javascript" src="${ctxStatic}/js/modules/kq/kqBsmx/kqBsmxList.js"></script>
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
				<sys:formItem lable="姓名" lableStyle="width:70px" itemStyle="width:120px">
		        	<sys:input id="xm" inputStyle="width:110px;"></sys:input>
		        </sys:formItem>
				<sys:formItem>
			        <sys:queryButton queryMethod="query();" formId="queryForm">
			        </sys:queryButton>
			    </sys:formItem>
			</sys:formRow>
			<sys:formRow>
				<sys:formItem lable="职工编号" lableStyle="width:90px" itemStyle="width:110px">
		        	<sys:input id="zgbh" inputStyle="width:110px;"></sys:input>
		        </sys:formItem>
			</sys:formRow>
		</sys:form>
		<sys:hline/>
		<sys:toolbar showExportExcel="true" exportFileName="考勤报送明细数据列表"
			url="${ctx}/kq/kqBsmx/query" formId="queryForm">
		</sys:toolbar>
	
		<table id="tt" > 
		   	<thead frozen="true">
				<tr>
					<th data-options="field:'orgName',sortable:true,halign:'center',align:'left',width:180">考勤部门</th>
					<th data-options="field:'kqYf',sortable:true,halign:'center',align:'center',width:90">考勤年份</th>
					<th data-options="field:'kqMf',sortable:true,halign:'center',align:'center',width:90">考勤月份</th>
					<th data-options="field:'xm',sortable:true,halign:'center',align:'left',width:90">姓名</th>
					<th data-options="field:'zgbh',sortable:true,halign:'center',align:'left',width:90">职工编号</th>
				</tr>
			</thead>
			<thead>
				<tr>
					<th data-options="field:'bjTs',sortable:true,halign:'center',align:'center',width:90">病假天数</th>
					<th data-options="field:'sjTs',sortable:true,halign:'center',align:'center',width:90">事假天数</th>
					<th data-options="field:'tqjTs',sortable:true,halign:'center',align:'center',width:90">探亲假天数</th>
					<th data-options="field:'hsjTs',sortable:true,halign:'center',align:'center',width:90">婚丧假天数</th>
					<th data-options="field:'cjTs',sortable:true,halign:'center',align:'center',width:90">产假天数</th>
					<th data-options="field:'qtTs',sortable:true,halign:'center',align:'center',width:90">其他天数</th>
				</tr>
			</thead>
		</table>
		
	</body>
</html>