<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
	<head>
		<meta name="decorator" content="blank" />
		<script type="text/javascript" src="${ctxStatic}/js/modules/rygl/ryJtcy/ryJtcyList.js"></script>
	</head>
	<body>
	
		<blockquote class="layui-elem-quote">
			<span class="layui-breadcrumb">
			  <a href="javascript:">人员信息</a>
			  <a href="javascript:"><cite>家庭成员</cite></a>
			</span>
		</blockquote>
		
		<sys:form id="queryForm">
			<input type="hidden" id="ryjbxxId" name="ryjbxxId" value="${ryJtcy.ryjbxxId}"/>
		</sys:form>
		
		<sys:hline/>
		
		<sys:toolbar showExportExcel="true" exportFileName="家庭成员列表"
			url="${ctx}/rygl/ryJtcy/query" formId="queryForm">
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
					<th data-options="field:'name',sortable:true,halign:'center',align:'left',width:90">姓名</th>
				</tr>
			</thead>
			<thead>
				<tr>
					<th data-options="field:'jtcy',sortable:true,halign:'center',align:'left',width:90">家人姓名</th>
					<th data-options="field:'gx',sortable:true,halign:'center',align:'left',width:90">关系</th>
					<th data-options="field:'csrq',sortable:true,halign:'center',align:'left',width:90">出生日期</th>
					<th data-options="field:'xl',sortable:true,halign:'center',align:'left',width:90">学历</th>
					<th data-options="field:'mz',sortable:true,halign:'center',align:'left',width:90">民族</th>
					<th data-options="field:'zzmm',sortable:true,halign:'center',align:'left',width:90">政治面貌</th>
					<th data-options="field:'gzdw',sortable:true,halign:'center',align:'left',width:90">工作单位</th>
					<th data-options="field:'hjszd',sortable:true,halign:'center',align:'left',width:90">户籍地址</th>
					<th data-options="field:'bz',sortable:true,halign:'center',align:'left',width:90">备注</th>
				</tr>
			</thead>
		</table>
		
		<div id="dialog"  style="display: none;padding: 10px 10px 0 20px; ">
			<sys:form id="dialogForm">
				<input type="hidden" id="id" name="id" />
				<input type="hidden" id="ryjbxxId" name="ryjbxxId" value="${ryJtcy.ryjbxxId}"/>
				<sys:formRow>
					<sys:formItem lable="家人姓名" isRequired="true" >
						<sys:input id="jtcy" inputStyle="width:150px;" required="true"></sys:input>
					</sys:formItem>
					<sys:formItem lable="关系" isRequired="true" lableStyle="width:90px;">
						<sys:input id="gx" inputStyle="width:150px;" required="true"></sys:input>
					</sys:formItem>
				</sys:formRow>
				<sys:formRow>
					<sys:formItem lable="出生日期"  >
						<input id="csrq" name="csrq" class="layui-input" type="text"
							value="" required style="width:150px;"
							onFocus="laydate({istime: false, format: 'YYYY-MM-DD'})">
					</sys:formItem>
					<sys:formItem lable="学历"  lableStyle="width:90px;">
						<sys:input id="xl" inputStyle="width:150px;" required="true"></sys:input>
					</sys:formItem>
				</sys:formRow>
				<sys:formRow>
					<sys:formItem lable="民族">
						<sys:input id="mz" inputStyle="width:150px;" required="true"></sys:input>
					</sys:formItem>
					<sys:formItem lable="政治面貌" lableStyle="width:90px;">
						<sys:input id="zzmm" inputStyle="width:150px;" required="true"></sys:input>
					</sys:formItem>
				</sys:formRow>
				<sys:formRow>
					<sys:formItem lable="工作单位">
						<sys:input id="gzdw" inputStyle="width:150px;" required="true"></sys:input>
					</sys:formItem>
					<sys:formItem lable="户籍地址" lableStyle="width:90px;">
						<sys:input id="hjszd" inputStyle="width:150px;" required="true"></sys:input>
					</sys:formItem>
				</sys:formRow>
				
				<sys:formRow>
					<sys:formItem lable="备注">
						<sys:textarea id="bz" inputStyle="width:450px;height:30px;"></sys:textarea>
					</sys:formItem>
				</sys:formRow>
			</sys:form>
		</div>
 	
	</body>
</html>