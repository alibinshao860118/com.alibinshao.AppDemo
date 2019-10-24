<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
	<head>
		<meta name="decorator" content="default" />
		<script type="text/javascript" src="${ctxStatic}/js/modules/zp/zpZpjh/zpZpjhList.js"></script>
	</head>
	<body>
		
		<sys:form id="queryForm">
	        <sys:formRow>
	        	<sys:formItem lable="计划编号" lableStyle="width:80px" itemStyle="width:120px">
	        		<sys:input id="jhBh" inputStyle="width:120px;"></sys:input>
	        	</sys:formItem>
	            <sys:formItem lable="所属年度" lableStyle="width:80px" itemStyle="width:100px">
           	 		<select id="jhNd" name="jhNd">
						<option value="2017" >2017年</option>
						<option value="2018" >2018年</option>
						<option value="2019" >2019年</option>
						<option value="2020" >2020年</option>
						<option value="2021" >2021年</option>
					</select>
	        	</sys:formItem>
	        	<sys:formItem>
		        	<sys:queryButton queryMethod="query();" formId="queryForm">
		        	</sys:queryButton>
		        </sys:formItem>
	        </sys:formRow>
		</sys:form>
		
		<sys:hline/>
		
		<sys:toolbar showExportExcel="true" exportFileName="招聘计划列表"
			url="${ctx}/zp/zpZpjh/query" formId="queryForm">
			<div class="layui-btn-group">
				<sys:button onclick="add();" btnClass="layui-btn-small layui-btn-normal"><i class='layui-icon'>&#xe654;</i>新增</sys:button>
				<sys:button onclick="edit();" btnClass="layui-btn-small layui-btn-normal"><i class='layui-icon'>&#xe642;</i>修改</sys:button>
				<sys:button onclick="delete_();" btnClass="layui-btn-small layui-btn-danger"><i class='layui-icon'>&#xe640;</i>删除</sys:button>
			</div>
			<div class="layui-btn-group">
				<sys:button onclick="active();" btnClass="layui-btn-small layui-btn-normal"><i class='layui-icon'>&#xe630;</i> 恢复报名</sys:button>
				<sys:button onclick="stop();" btnClass="layui-btn-small layui-btn-danger"><i class='layui-icon'>&#xe651;</i> 停止报名</sys:button>
			</div>
		</sys:toolbar>
	
		<table id="tt" > 
		   	<thead frozen="true">
				<tr>
					<th data-options="field:'id',checkbox:true"">id</th>
					<th data-options="field:'jhBh',halign:'center',align:'center',width:100">计划编号</th>
					<th data-options="field:'jhBt',halign:'center',align:'left',width:230">计划标题</th>
				</tr>
			</thead>
			<thead>
				<tr>
					<th data-options="field:'jhNd',halign:'center',align:'center',width:100">所属年度</th>
					<th data-options="field:'jhKssj',halign:'center',align:'center',width:120">招聘开始时间</th>
					<th data-options="field:'jhJssj',halign:'center',align:'center',width:120">招聘结束时间</th>
					<th data-options="field:'enableFlag',halign:'center',align:'center',width:90" formatter="formatenableFlag">计划状态</th>
				</tr>
			</thead>
		</table>
		
		<div id="dialog"  style="display: none;padding: 10px 10px 0 10px; ">
			<sys:form id="dialogForm">
				<input type="hidden" id="id" name="id" />
				<sys:formRow>
					<sys:formItem lable="计划编号" isRequired="true">
						<sys:input id="jhBh" inputStyle="width:180px;" required="true"></sys:input>
					</sys:formItem>
					<sys:formItem lable="计划标题" isRequired="true">
						<sys:input id="jhBt" inputStyle="width:180px;" required="true"></sys:input>
					</sys:formItem>
				</sys:formRow>
				<sys:formRow>
					<sys:formItem lable="所属年度" isRequired="true">
						<sys:input id="jhNd" inputStyle="width:180px;" required="true"></sys:input>
					</sys:formItem>
				</sys:formRow>
				<sys:formRow>
					<sys:formItem lable="开始时间" >
						<sys:input id="jhKssj" inputStyle="width:180px;"></sys:input>
					</sys:formItem>
					<sys:formItem lable="结束时间" >
						<sys:input id="jhJssj" inputStyle="width:180px;"></sys:input>
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