<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
	<head>
		<meta name="decorator" content="default" />
		<script type="text/javascript" src="${ctxStatic}/js/modules/pxgl/pxglGnjxgl/pxglGnjxglList.js"></script>
	</head>
	<body>
		
		<sys:form id="queryForm">
			<sys:formRow>
	            <sys:formItem lable="职工编号" >
           	 		<sys:input id="zgbh" inputStyle="width:150px;"></sys:input>
	        	</sys:formItem>
	        	<sys:formItem lable="姓名">
	        		<sys:input id="xm" inputStyle="width:150px;"></sys:input>
	        	</sys:formItem>
	        	<sys:formItem>
		        	<sys:queryButton queryMethod="query();" formId="queryForm">
		        	</sys:queryButton>
		        </sys:formItem>
	        </sys:formRow>
		</sys:form>
		
		<sys:hline/>
		
		<sys:toolbar showExportExcel="true" exportFileName="国内进修管理"
			url="${ctx}/pxgl/pxglGnjxgl/query" formId="queryForm">
			<div class="layui-btn-group">
				<sys:button onclick="add();" btnClass="layui-btn-small layui-btn-normal"><i class='layui-icon'>&#xe654;</i>新增</sys:button>
				<sys:button onclick="edit();" btnClass="layui-btn-small layui-btn-normal"><i class='layui-icon'>&#xe642;</i>修改</sys:button>
				<sys:button onclick="delete_();" btnClass="layui-btn-small layui-btn-danger"><i class='layui-icon'>&#xe640;</i>删除</sys:button>
			</div>
		</sys:toolbar>
	
		<table id="tt" > 
		   	<thead frozen="true">
				<tr>
					<th data-options="field:'id',checkbox:true"">id</th>
					<th data-options="field:'zgbh',sortable:true,halign:'center',align:'left',width:90">职工编号</th>
					<th data-options="field:'xm',sortable:true,halign:'center',align:'left',width:90">姓名</th>
				</tr>
			</thead>
			<thead>
				<tr>
					<th data-options="field:'ywlx',sortable:true,halign:'center',align:'left',width:90">业务类型</th>
					<th data-options="field:'bklb',sortable:true,halign:'center',align:'left',width:90">报考类别</th>
					<th data-options="field:'sqrq',sortable:true,halign:'center',align:'left',width:90">申请日期</th>
					<th data-options="field:'lxsj',sortable:true,halign:'center',align:'left',width:90">来校时间</th>
					<th data-options="field:'bkxx',sortable:true,halign:'center',align:'left',width:90">报考学校</th>
					<th data-options="field:'bkyx',sortable:true,halign:'center',align:'left',width:90">报考院校</th>
					<th data-options="field:'bkzy',sortable:true,halign:'center',align:'left',width:90">报考专业</th>
					<th data-options="field:'xl',sortable:true,halign:'center',align:'left',width:90">学历</th>
					<th data-options="field:'ksrq',sortable:true,halign:'center',align:'left',width:90">开始日期</th>
					<th data-options="field:'jzrq',sortable:true,halign:'center',align:'left',width:90">截止日期</th>
					<th data-options="field:'xxlx',sortable:true,halign:'center',align:'left',width:90">学习类型</th>
					<th data-options="field:'jmxf',sortable:true,halign:'center',align:'left',width:90">减免学费</th>
					<th data-options="field:'xyxq',sortable:true,halign:'center',align:'left',width:90">协议详情</th>
				</tr>
			</thead>
		</table>
		
		<div id="dialog"  style="display: none;padding: 10px 10px 0 40px; ">
			<sys:form id="dialogForm">
				<input type="hidden" id="id" name="id" />
				<sys:formRow>
					<sys:formItem lable="姓名" isRequired="true" lableStyle="width:85px;" >
						<sys:input id="xm"  required="true" inputStyle="width:150px;"></sys:input>
					</sys:formItem>
					<sys:formItem lable="职工编号" isRequired="true" lableStyle="width:85px;" >
						<sys:input id="zgbh"  required="true" inputStyle="width:150px;"></sys:input>
					</sys:formItem>
				</sys:formRow>
				<sys:formRow>
					<sys:formItem lable="业务类型" isRequired="true" lableStyle="width:85px;" >
						<sys:input id="ywlx"  required="true" inputStyle="width:150px;"></sys:input>
					</sys:formItem>
					<sys:formItem lable="报考类别" isRequired="true" lableStyle="width:85px;" >
						<sys:input id="bklb"  required="true" inputStyle="width:150px;"></sys:input>
					</sys:formItem>
				</sys:formRow>
				<sys:formRow>
					<sys:formItem lable="申请日期" isRequired="true" lableStyle="width:85px;" itemStyle="width:150px;">
						<sys:inputDate id="sqrq" format="YYYY-MM-DD"></sys:inputDate>
						
					</sys:formItem>
					<sys:formItem lable="来校时间"  lableStyle="width:85px;" itemStyle="width:150px;">
						<sys:inputDate id="lxsj" format="YYYY-MM-DD"></sys:inputDate>
					</sys:formItem>
				</sys:formRow>
				<sys:formRow>
					<sys:formItem lable="报考学校"  lableStyle="width:85px;" itemStyle="width:150px;">
						<sys:input id="bkxx"  required="true"></sys:input>
					</sys:formItem>
					<sys:formItem lable="报考院校"  lableStyle="width:85px;" itemStyle="width:150px;">
						<sys:input id="bkyx"  required="true"></sys:input>
					</sys:formItem>
				</sys:formRow>
				<sys:formRow>
					<sys:formItem lable="报考专业"  lableStyle="width:85px;" itemStyle="width:150px;">
						<sys:input id="bkzy"  required="true"></sys:input>
					</sys:formItem>
					<sys:formItem lable="学历"  lableStyle="width:85px;" itemStyle="width:150px;">
						<sys:input id="xl"  required="true"></sys:input>
					</sys:formItem>
				</sys:formRow>
				<sys:formRow>
					<sys:formItem lable="开始日期" isRequired="true"  lableStyle="width:85px;" itemStyle="width:150px;">
						<sys:inputDate id="ksrq" format="YYYY-MM-DD"></sys:inputDate>
					</sys:formItem>
					<sys:formItem lable="截止日期" isRequired="true" lableStyle="width:85px;" itemStyle="width:150px;">
						<sys:inputDate id="jzrq" format="YYYY-MM-DD"></sys:inputDate>
					</sys:formItem>
				</sys:formRow>
				<sys:formRow>
					<sys:formItem lable="学习类型"  lableStyle="width:85px;" itemStyle="width:150px;">
						<sys:input id="bkzy"  ></sys:input>
					</sys:formItem>
					<sys:formItem lable="减免学费"  lableStyle="width:85px;" itemStyle="width:150px;">
						<sys:input id="jmxf" inputStyle="" ></sys:input>
					</sys:formItem>
				</sys:formRow>
				<sys:formRow>
					<sys:formItem lable="协议详情" lableStyle="width:85px;">
						<sys:textarea id="xyxq" inputStyle="width:400px;height:30px;"></sys:textarea>
					</sys:formItem>
				</sys:formRow>
			</sys:form>
		</div>
 	
	</body>
</html>