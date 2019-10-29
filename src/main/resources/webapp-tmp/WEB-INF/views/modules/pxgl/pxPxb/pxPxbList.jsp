<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
	<head>
		<meta name="decorator" content="default" />
		<script type="text/javascript" src="${ctxStatic}/js/modules/pxgl/pxPxb/pxPxbList.js"></script>
	</head>
	<body>
			<sys:form id="queryForm">
				<sys:formRow>
					<sys:formItem lable="培训计划" lableStyle="width:85px;" itemStyle="width:125px;">
		        		<select name="pxjhId" id="pxjhId" >
							<option value="">---请选择---</option>
							<c:forEach items="${pxjhList}" var="m">					
								<option value="${m.pxjhId}">${m.pxjhMc}</option>
							</c:forEach>
						</select>
		        	</sys:formItem>
					<sys:formItem lable="培训班名称" lableStyle="width:110px;">
		        		<sys:input id="pxbMc" inputStyle="width:120px;"></sys:input>
		        	</sys:formItem>
					<sys:formItem>
			        	<sys:queryButton queryMethod="query();" formId="queryForm">
			        	</sys:queryButton>
			        </sys:formItem>
				</sys:formRow>
				
			</sys:form>
		
		<sys:hline/>
		
		<sys:toolbar showExportExcel="true" exportFileName="培训班信息表数据列表"
			url="${ctx}/pxgl/pxPxb/query" formId="queryForm">
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
					<th data-options="field:'pxbMc',sortable:true,halign:'center',align:'left',width:90">培训班名称</th>
					<th data-options="field:'pxjhMc',sortable:true,halign:'center',align:'left',width:90">培训计划</th>
					<th data-options="field:'jhRs',sortable:true,halign:'center',align:'left',width:90">招收人数</th>
					<th data-options="field:'pxDx',sortable:true,halign:'center',align:'left',width:90">讲师姓名</th>
					<th data-options="field:'kkSj',sortable:true,halign:'center',align:'left',width:90">开课时间</th>
					<th data-options="field:'jkSj',sortable:true,halign:'center',align:'left',width:90">结课时间</th>
					<th data-options="field:'pxDd',sortable:true,halign:'center',align:'left',width:90">培训地点</th>
					<th data-options="field:'hgFs',sortable:true,halign:'center',align:'left',width:90">考核合格分数线</th>
					<th data-options="field:'remarks',sortable:true,halign:'center',align:'left',width:90">培训班简介</th>
				</tr>
			</thead>
		</table>
		
		<div id="dialog"  style="display: none;padding: 10px 10px 0 40px; ">
			<sys:form id="dialogForm">
				<input type="hidden" id="id" name="id" />
				<sys:formRow>
					<sys:formItem lable="培训计划" lableStyle="width:80px;" itemStyle="width:155px;">
						<select name="pxjhId" id="pxjhId" >
						<option value="">---请选择---</option>
						<c:forEach items="${pxjhList}" var="m">					
							<option value="${m.pxjhId}">${m.pxjhMc}</option>
						</c:forEach>
						</select>
			   		</sys:formItem>
					<sys:formItem lable="培训班名称" lableStyle="width:125px;" isRequired="true">
						<sys:input id="pxbMc" inputStyle="width:150px;"></sys:input>
			   		</sys:formItem>
			   </sys:formRow>
			   <sys:formRow>
					<sys:formItem lable="招收人数" lableStyle="width:85px;" isRequired="true">
						<sys:input id="jhRs" inputStyle="width:150px;"></sys:input>
			   		</sys:formItem>
					<sys:formItem lable="讲师姓名" lableStyle="width:85px;" isRequired="true">
						<sys:input id="pxDx" inputStyle="width:150px;"></sys:input>
			   		</sys:formItem>
			   </sys:formRow>
			   <sys:formRow>
					<sys:formItem lable="开课时间" lableStyle="width:85px;" isRequired="true">
						<sys:inputDate id="kkSj" format="YYYY-MM-DD" inputStyle="width:150px;"
						istime="true" required="true">
						</sys:inputDate>
			   		</sys:formItem>
					<sys:formItem lable="结课时间" lableStyle="width:85px;" isRequired="true">
						<sys:inputDate id="jkSj" format="YYYY-MM-DD" inputStyle="width:150px;"
						istime="true" required="true">
						</sys:inputDate>
			   		</sys:formItem>
			   </sys:formRow>
			   <sys:formRow>
					<sys:formItem lable="培训地点" lableStyle="width:85px;">
						<sys:input id="pxDd" inputStyle="width:150px;"></sys:input>
			   		</sys:formItem>
					<sys:formItem lable="考核合格分数线" lableStyle="width:85px;">
						<sys:input id="hgFs" inputStyle="width:150px;"></sys:input>
			   		</sys:formItem>
			   </sys:formRow>
			   <sys:formRow>
			   		<sys:formItem lable="培训班简介" lableStyle="width:85px;">
			   			<sys:textarea id="remarks" inputStyle="width:490px;height:30px;">
			   			</sys:textarea>
			   		</sys:formItem>
			  </sys:formRow>
			</sys:form>
		</div>
	</body>
</html>