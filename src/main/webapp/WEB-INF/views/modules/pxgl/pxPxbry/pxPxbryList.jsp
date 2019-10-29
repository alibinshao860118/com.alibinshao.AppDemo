<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
	<head>
		<meta name="decorator" content="default" />
		<script type="text/javascript" src="${ctxStatic}/js/modules/pxgl/pxPxbry/pxPxbryList.js"></script>
	</head>
	<body>
			<sys:form id="queryForm">
				<sys:formRow>
					<sys:formItem lable="培训班" lableStyle="width:85px;" itemStyle="width:125px;">
		        		<select name="pxbId" id="pxbId" >
							<option value="">---请选择---</option>
							<c:forEach items="${pxbList}" var="m">					
								<option value="${m.pxbId}">${m.pxbMc}</option>
							</c:forEach>
						</select>
		        	</sys:formItem>
					<sys:formItem lable="姓名" lableStyle="width:85px;">
		        		<sys:input id="xm" inputStyle="width:120px;"></sys:input>
		        	</sys:formItem>
					<sys:formItem>
			        	<sys:queryButton queryMethod="query();" formId="queryForm">
			        	</sys:queryButton>
			        </sys:formItem>
				</sys:formRow>
				<sys:formRow>
					<sys:formItem lable="职工编号" lableStyle="width:85px;">
		        		<sys:input id="zgbh" inputStyle="width:120px;"></sys:input>
		        	</sys:formItem>
		        </sys:formRow>
			</sys:form>
		
		<sys:hline/>
		
		<sys:toolbar showExportExcel="true" exportFileName="培训班人员信息表数据列表"
			url="${ctx}/pxgl/pxPxbry/query" formId="queryForm">
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
				</tr>
			</thead>
			<thead>
				<tr>
					<th data-options="field:'pxbMc',sortable:true,halign:'center',align:'left',width:90">培训班</th>
					<th data-options="field:'xm',sortable:true,halign:'center',align:'left',width:90">姓名</th>
					<th data-options="field:'zgbh',sortable:true,halign:'center',align:'left',width:90">职工编号</th>
					<th data-options="field:'kqFs',sortable:true,halign:'center',align:'left',width:90">考勤成绩</th>
					<th data-options="field:'psFs',sortable:true,halign:'center',align:'left',width:90">平时成绩(分数)</th>
					<th data-options="field:'zhFs',sortable:true,halign:'center',align:'left',width:90">综合成绩(分数)</th>
					<th data-options="field:'jyzBh',sortable:true,halign:'center',align:'left',width:90">结业证号</th>
					<th data-options="field:'remarks',sortable:true,halign:'center',align:'left',width:90">备注信息</th>
				</tr>
			</thead>
		</table>
		
		<div id="dialog"  style="display: none;padding: 10px 10px 0 40px; ">
			<sys:form id="dialogForm">
				<input type="hidden" id="id" name="id" />
				<sys:formRow>
					<sys:formItem lable="培训班" lableStyle="width:85px;" 
					isRequired="true" itemStyle="width:150px;">
						<select name="pxbId" id="pxbId" >
							<option value="">---请选择---</option>
							<c:forEach items="${pxbList}" var="m">					
								<option value="${m.pxbId}">${m.pxbMc}</option>
							</c:forEach>
						</select>
			   		</sys:formItem>
					<sys:formItem lable="姓名" lableStyle="width:125px;" isRequired="true">
						<sys:input id="xm" inputStyle="width:150px;"></sys:input>
			   		</sys:formItem>
			   </sys:formRow>
			   <sys:formRow>
					<sys:formItem lable="职工编号" lableStyle="width:85px;" isRequired="true">
						<sys:input id="zgbh" inputStyle="width:150px;"></sys:input>
			   		</sys:formItem>
					<sys:formItem lable="考勤成绩" lableStyle="width:85px;">
						<sys:input id="kqFs" inputStyle="width:150px;"></sys:input>
			   		</sys:formItem>
			   </sys:formRow>
			   <sys:formRow>
					<sys:formItem lable="平时成绩(分数)" lableStyle="width:85px;">
						<sys:input id="psFs" inputStyle="width:150px;"></sys:input>
			   		</sys:formItem>
					<sys:formItem lable="综合成绩(分数)" lableStyle="width:85px;">
						<sys:input id="zhFs" inputStyle="width:150px;"></sys:input>
			   		</sys:formItem>
			   </sys:formRow>
			   <sys:formRow>
					<sys:formItem lable="结业证号" lableStyle="width:85px;">
						<sys:input id="jyzBh" inputStyle="width:150px;"></sys:input>
			   		</sys:formItem>
			   </sys:formRow>
			   <sys:formRow>
			   		<sys:formItem lable="备注" lableStyle="width:85px;">
			   			<sys:textarea id="remarks" inputStyle="width:450px;height:30px;">
			   			</sys:textarea>
			   		</sys:formItem>
			  </sys:formRow>
			</sys:form>
		</div>
	</body>
</html>