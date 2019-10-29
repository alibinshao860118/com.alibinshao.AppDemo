<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
	<head>
		<meta name="decorator" content="default" />
		<script type="text/javascript" src="${ctxStatic}/js/modules/pxgl/pxJszgz/pxJszgzList.js"></script>
	</head>
	<body>
			<sys:form id="queryForm">
				<sys:formRow>
					<sys:formItem lable="姓名" lableStyle="width:85px;">
		        		<sys:input id="xm" inputStyle="width:120px;"></sys:input>
		        	</sys:formItem>
					<sys:formItem lable="职工编号" lableStyle="width:85px;">
		        		<sys:input id="zgbh" inputStyle="width:120px;"></sys:input>
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
		
		<sys:toolbar showExportExcel="true" exportFileName="教师资格证信息表数据列表"
			url="${ctx}/pxgl/pxJszgz/query" formId="queryForm">
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
					<th data-options="field:'xm',sortable:true,halign:'center',align:'left',width:90">姓名</th>
					<th data-options="field:'zgbh',sortable:true,halign:'center',align:'left',width:90">职工编号</th>
					<th data-options="field:'gqpxFs',sortable:true,halign:'center',align:'left',width:90">岗前培训成绩</th>
					<th data-options="field:'jncsFs',sortable:true,halign:'center',align:'left',width:90">技能测试成绩</th>
					<th data-options="field:'pthDj',sortable:true,halign:'center',align:'left',width:90">普通话等级</th>
					<th data-options="field:'tjZg',sortable:true,halign:'center',align:'left',width:90">体检结果</th>
					<th data-options="field:'zgzBh',sortable:true,halign:'center',align:'left',width:120">资格证号</th>
					<th data-options="field:'remarks',sortable:true,halign:'center',align:'left',width:190">备注信息</th>
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
					<sys:formItem lable="岗前培训成绩(分数)" lableStyle="width:85px;">
						<sys:input id="gqpxFs" inputStyle="width:150px;"></sys:input>
			   		</sys:formItem>
					<sys:formItem lable="技能测试成绩(分数)" lableStyle="width:85px;">
						<sys:input id="jncsFs" inputStyle="width:150px;"></sys:input>
			   		</sys:formItem>
			   </sys:formRow>
			   <sys:formRow>
					<sys:formItem lable="普通话等级" lableStyle="width:85px;">
						<sys:input id="pthDj" inputStyle="width:150px;"></sys:input>
			   		</sys:formItem>
					<sys:formItem lable="体检结果" lableStyle="width:85px;">
						<sys:input id="tjZg" inputStyle="width:150px;"></sys:input>
			   		</sys:formItem>
			   </sys:formRow>
			   <sys:formRow>
					<sys:formItem lable="资格证号" lableStyle="width:85px;">
						<sys:input id="zgzBh" inputStyle="width:150px;"></sys:input>
			   		</sys:formItem>
					
			   </sys:formRow>
			   <sys:formRow>
			   		<sys:formItem lable="备注信息" lableStyle="width:85px;">
						<sys:textarea id="remarks" inputStyle="width:445px;height:45px;"></sys:textarea>
			   		</sys:formItem>
			  </sys:formRow>
			</sys:form>
		</div>
	</body>
</html>