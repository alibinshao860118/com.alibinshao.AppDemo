<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
	<head>
		<meta name="decorator" content="default" />
		<script type="text/javascript" src="${ctxStatic}/js/modules/sys/sysZzjgbmgz/sysZzjgbmgzList.js"></script>
	</head>
	<body>
		<sys:form id="dialogForm">
				<input type="hidden" id="id" name="id" value="${sysZzjgbmgz.id}"/>
				<sys:formRow>
					行政机构
				</sys:formRow>	
				<sys:formRow>
					<sys:formItem lable="编码前缀" lableStyle="width:110px">
						<sys:input id="xzjgQz" inputStyle="width:150px;" value="${sysZzjgbmgz.xzjgQz}"></sys:input>
			   		</sys:formItem>
					<sys:formItem lable="编码递增值" lableStyle="width:110px">
						<sys:input id="xzjgDz" inputStyle="width:150px;" value="${sysZzjgbmgz.xzjgDz}"></sys:input>
			   		</sys:formItem>
			   </sys:formRow>
			   <sys:hline />
			   <sys:formRow>
					教学单位
				</sys:formRow>
			   <sys:formRow>
					<sys:formItem lable="编码前缀" lableStyle="width:110px">
						<sys:input id="jxdwQz" inputStyle="width:150px;" value="${sysZzjgbmgz.jxdwQz}"></sys:input>
			   		</sys:formItem>
					<sys:formItem lable="编码递增值" lableStyle="width:110px">
						<sys:input id="jxdwDz" inputStyle="width:150px;" value="${sysZzjgbmgz.jxdwDz}"></sys:input>
			   		</sys:formItem>
			   </sys:formRow>
			   <sys:hline />
			   <sys:formRow>
					科研单位
			   </sys:formRow>
			   <sys:formRow>
					<sys:formItem lable="编码前缀" lableStyle="width:110px">
						<sys:input id="kydwQz" inputStyle="width:150px;" value="${sysZzjgbmgz.kydwQz}"></sys:input>
			   		</sys:formItem>
					<sys:formItem lable="编码递增值" lableStyle="width:110px">
						<sys:input id="kydwDz" inputStyle="width:150px;" value="${sysZzjgbmgz.kydwDz}"></sys:input>
			   		</sys:formItem>
			   </sys:formRow>
			   <sys:hline />
			   <sys:formRow>
					教辅单位
			   </sys:formRow>
			   <sys:formRow>
					<sys:formItem lable="编码前缀" lableStyle="width:110px">
						<sys:input id="jfdwQz" inputStyle="width:150px;" value="${sysZzjgbmgz.jfdwQz}"></sys:input>
			   		</sys:formItem>
					<sys:formItem lable="编码递增值" lableStyle="width:110px">
						<sys:input id="jfdwDz" inputStyle="width:150px;" value="${sysZzjgbmgz.jfdwDz}"></sys:input>
			   		</sys:formItem>
			   </sys:formRow>
			   <sys:hline />
			   <sys:formRow>
					群团组织
			   </sys:formRow>
			   <sys:formRow>
					<sys:formItem lable="编码前缀" lableStyle="width:110px">
						<sys:input id="qtzzQz" inputStyle="width:150px;" value="${sysZzjgbmgz.qtzzQz}"></sys:input>
			   		</sys:formItem>
					<sys:formItem lable="编码递增值" lableStyle="width:110px">
						<sys:input id="qtzzDz" inputStyle="width:150px;" value="${sysZzjgbmgz.qtzzDz}"></sys:input>
			   		</sys:formItem>
			   </sys:formRow>
			   <sys:formRow>
			   
			  </sys:formRow>
		</sys:form>
			<sys:hline />
			<div align="center" style="width:550px;">
				<sys:button onclick="okFunction();">保存</sys:button>
				<sys:button onclick="reset();">重置</sys:button>
			</div>
	<%-- <sys:form id="queryForm">
			<sys:formRow>
				<sys:formItem lable="行政机构编码前缀" lableStyle="width:110px">
		        	<sys:input id="xzjgQz" inputStyle="width:120px;"></sys:input>
		        </sys:formItem>
				<sys:formItem lable="行政机构编码递增值" lableStyle="width:110px">
		        	<sys:input id="xzjgDz" inputStyle="width:120px;"></sys:input>
		        </sys:formItem>
			</sys:formRow>
			<sys:formRow>
				<sys:formItem lable="教学单位编码前缀" lableStyle="width:110px">
		        	<sys:input id="jxdwQz" inputStyle="width:120px;"></sys:input>
		        </sys:formItem>
				<sys:formItem lable="教学单位编码递增值" lableStyle="width:110px">
		        	<sys:input id="jxdwDz" inputStyle="width:120px;"></sys:input>
		        </sys:formItem>
			</sys:formRow>
			<sys:formRow>
				<sys:formItem lable="科研单位编码前缀" lableStyle="width:110px">
		        	<sys:input id="kydwQz" inputStyle="width:120px;"></sys:input>
		        </sys:formItem>
				<sys:formItem lable="科研单位编码递增值" lableStyle="width:110px">
		        	<sys:input id="kydwDz" inputStyle="width:120px;"></sys:input>
		        </sys:formItem>
			</sys:formRow>
			<sys:formRow>
				<sys:formItem lable="教辅单位编码前缀" lableStyle="width:110px">
		        	<sys:input id="jfdwQz" inputStyle="width:120px;"></sys:input>
		        </sys:formItem>
				<sys:formItem lable="教辅单位编码递增值" lableStyle="width:110px">
		        	<sys:input id="jfdwDz" inputStyle="width:120px;"></sys:input>
		        </sys:formItem>
			</sys:formRow>
			<sys:formRow>
				<sys:formItem lable="群团组织编码前缀" lableStyle="width:110px">
		        	<sys:input id="qtzzQz" inputStyle="width:120px;"></sys:input>
		        </sys:formItem>
				<sys:formItem lable="群团组织编码递增值" lableStyle="width:110px">
		        	<sys:input id="qtzzDz" inputStyle="width:120px;"></sys:input>
		        </sys:formItem>
			</sys:formRow>
			<sys:formRow>
		    </sys:formRow>
		</sys:form>
		<sys:hline/>
		<sys:toolbar showExportExcel="true" exportFileName="组织机构编码规则数据列表"
			url="${ctx}/sys/sysZzjgbmgz/query" formId="queryForm">
			<div class="layui-btn-group">
				<sys:button onclick="add();" btnClass="layui-btn-small layui-btn-normal"><i class='layui-icon'>&#xe654;</i>新增</sys:button>
				<sys:button onclick="edit();" btnClass="layui-btn-small layui-btn-normal"><i class='layui-icon'>&#xe642;</i>修改</sys:button>
			</div>
		</sys:toolbar> --%>
	
		<!-- <table id="tt" > 
		   	<thead frozen="true">
				<tr>
					<th data-options="field:'id',checkbox:true">id</th>
				</tr>
			</thead>
			<thead>
				<tr>
					<th data-options="field:'xzjgQz',sortable:true,halign:'center',align:'left',width:90">行政机构编码前缀</th>
					<th data-options="field:'xzjgDz',sortable:true,halign:'center',align:'left',width:90">行政机构编码递增值</th>
					<th data-options="field:'jxdwQz',sortable:true,halign:'center',align:'left',width:90">教学单位编码前缀</th>
					<th data-options="field:'jxdwDz',sortable:true,halign:'center',align:'left',width:90">教学单位编码递增值</th>
					<th data-options="field:'kydwQz',sortable:true,halign:'center',align:'left',width:90">科研单位编码前缀</th>
					<th data-options="field:'kydwDz',sortable:true,halign:'center',align:'left',width:90">科研单位编码递增值</th>
					<th data-options="field:'jfdwQz',sortable:true,halign:'center',align:'left',width:90">教辅单位编码前缀</th>
					<th data-options="field:'jfdwDz',sortable:true,halign:'center',align:'left',width:90">教辅单位编码递增值</th>
					<th data-options="field:'qtzzQz',sortable:true,halign:'center',align:'left',width:90">群团组织编码前缀</th>
					<th data-options="field:'qtzzDz',sortable:true,halign:'center',align:'left',width:90">群团组织编码递增值</th>
				</tr>
			</thead>
		</table> -->
		
		<div id="dialog"  style="display: none;padding: 10px 10px 0 40px; ">
			
		</div>
	</body>
</html>