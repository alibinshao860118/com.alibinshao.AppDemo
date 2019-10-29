<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
	<head>
		<meta name="decorator" content="default" />
		<script type="text/javascript" src="${ctxStatic}/js/modules/htgl/htHtxx/zzHtxxList.js"></script>
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
				<sys:formItem lable="合同编号" lableStyle="width:85px">
		        	<sys:input id="htBh" inputStyle="width:120px;"></sys:input>
		        </sys:formItem>
		        <%-- <sys:formItem lable="合同状态" lableStyle="width:85px" itemStyle="width:125px;">
		        	<select name="htZt" id="htZt" >
						<option value="">----请选择----</option>
						<option value="1">正常</option>
						<option value="0">终止</option>
					</select>
			   	</sys:formItem> --%>
			   	<input type="hidden" id="htZt" name="htZt" value=""/>
			</sys:formRow>
			<sys:formRow>
		    </sys:formRow>
		</sys:form>
		<sys:hline/>
		<sys:toolbar showExportExcel="true" exportFileName="合同信息表数据列表"
			url="${ctx}/htgl/htHtxx/query" formId="queryForm">
			<div class="layui-btn-group">
				
			</div>
		</sys:toolbar>
	
		<table id="tt" > 
		   	<thead frozen="true">
				<tr>
					<th data-options="field:'id',checkbox:true">id</th>
					<th data-options="field:'xm',sortable:true,halign:'center',align:'left',width:90">姓名</th>
				</tr>
			</thead>
			<thead>
				<tr>
					<th data-options="field:'zgbh',sortable:true,halign:'center',align:'left',width:90">职工编号</th>
					<th data-options="field:'htBh',sortable:true,halign:'center',align:'left',width:90">合同编号</th>
					<th data-options="field:'htLx',sortable:true,halign:'center',align:'left',width:90">合同类型</th>
					<th data-options="field:'htZt',sortable:true,halign:'center',align:'left',width:90,formatter:formatHtzt">合同状态</th>
					<th data-options="field:'sfGdqx',sortable:true,halign:'center',align:'left',width:90,formatter:formatSfgdqx">固定期限</th>
					<th data-options="field:'syqYs',sortable:true,halign:'center',align:'left',width:90">试用期月数</th>
					<th data-options="field:'ksRq',sortable:true,halign:'center',align:'left',width:90">开始日期</th>
					<th data-options="field:'dqRq',sortable:true,halign:'center',align:'left',width:90">到期日期</th>
					<th data-options="field:'xqFlag',sortable:true,halign:'center',align:'left',width:90,formatter:formatXqFlag">续签标志</th>
					<th data-options="field:'xqRq',sortable:true,halign:'center',align:'left',width:90">续签日期</th>
					<th data-options="field:'zzRq',sortable:true,halign:'center',align:'left',width:90">终止日期</th>
					<th data-options="field:'remarks',sortable:true,halign:'center',align:'left',width:190">备注</th>
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
					<sys:formItem lable="合同编号" lableStyle="width:85px">
						<sys:input id="htBh" inputStyle="width:150px;"></sys:input>
			   		</sys:formItem>
					<sys:formItem lable="合同类型" lableStyle="width:85px">
						<sys:input id="htLx" inputStyle="width:150px;"></sys:input>
			   		</sys:formItem>
			   </sys:formRow>
			   <sys:formRow>
					<sys:formItem lable="开始日期" lableStyle="width:85px;" isRequired="true">
			        	<sys:inputDate id="ksRq" inputStyle="width:150px;"></sys:inputDate>
			   		</sys:formItem>
					<sys:formItem lable="到期日期" lableStyle="width:85px;" isRequired="true">
			        	<sys:inputDate id="dqRq" inputStyle="width:150px;"></sys:inputDate>
			   		</sys:formItem>
			   </sys:formRow>
			   <sys:formRow>
					<sys:formItem lable="合同状态" lableStyle="width:85px" itemStyle="width:125px;">
		        		<select name="htZt" id="htZt" >
							<option value="">----请选择----</option>
							<option value="1">正常</option>
							<option value="0">终止</option>
						</select>
			   		</sys:formItem>
					<sys:formItem lable="是否固定期限" lableStyle="width:150px" itemStyle="width:125px;">
						<select name="sfGdqx" id="sfGdqx" >
							<option value="">----请选择----</option>
							<option value="1">是</option>
							<option value="0">否</option>
						</select>
			   		</sys:formItem>
			   </sys:formRow>
			   
			   <sys:formRow>
					<sys:formItem lable="试用期月数" lableStyle="width:85px">
						<sys:input id="syqYs" inputStyle="width:150px;"></sys:input>
			   		</sys:formItem>
			  </sys:formRow>
			  <sys:formRow>
					<sys:formItem lable="备注" lableStyle="width:85px;">
						<sys:textarea id="remarks" inputStyle="width:445px;height:35px;"></sys:textarea>
					</sys:formItem>
			   </sys:formRow>
			</sys:form>
		</div>
	</body>
</html>