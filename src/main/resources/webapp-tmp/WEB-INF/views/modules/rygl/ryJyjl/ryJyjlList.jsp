<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
	<head>
		<meta name="decorator" content="blank" />
		<script type="text/javascript" src="${ctxStatic}/js/modules/rygl/ryJyjl/ryJyjlList.js"></script>
	
	</head>
	<body>
		<blockquote class="layui-elem-quote">
			<span class="layui-breadcrumb">
			  <a href="javascript:">人员信息</a>
			  <a href="javascript:"><cite>教育经历</cite></a>
			</span>
		</blockquote>
		
		<sys:form id="queryForm">
			<input type="hidden" id="ryjbxxId" name="ryjbxxId" value="${ryJyjl.ryjbxxId}"/>
		</sys:form>
		
		<sys:hline/>
		
		<sys:toolbar showExportExcel="true" exportFileName="教育经历信息列表"
			url="${ctx}/rygl/ryJyjl/query" formId="queryForm">
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
					<th data-options="field:'zgbh',sortable:true,halign:'center',align:'left',width:90">职工编号</th>
					<th data-options="field:'name',sortable:true,halign:'center',align:'left',width:90">姓名</th>
				</tr>
			</thead>
			<thead>
				<tr>
					<th data-options="field:'xwMc',sortable:true,halign:'center',align:'left',width:90">学位</th>
					<th data-options="field:'xwhqsj',sortable:true,halign:'center',align:'left',width:90">学位获取时间</th>
					<th data-options="field:'xlMc',sortable:true,halign:'center',align:'left',width:90">学历</th>
					<th data-options="field:'xlhqsj',sortable:true,halign:'center',align:'left',width:90">学历获取时间</th>
					<th data-options="field:'kssj',sortable:true,halign:'center',align:'left',width:90">开始时间</th>
					<th data-options="field:'bysj',sortable:true,halign:'center',align:'left',width:90">毕业时间</th>
					<th data-options="field:'zy',sortable:true,halign:'center',align:'left',width:90">专业</th>
					<th data-options="field:'xz',sortable:true,halign:'center',align:'left',width:90">学制</th>
					<th data-options="field:'byxx',sortable:true,halign:'center',align:'left',width:90">毕业学校</th>
					<th data-options="field:'xxszgj',sortable:true,halign:'center',align:'left',width:90">学校所在国家</th>
				</tr>
			</thead>
		</table>
		
		<div id="dialog"  style="display: none;padding: 10px 10px 0 15px; ">
			<sys:form id="dialogForm"  > 
				<input type="hidden" id="id" name="id" />
				<input type="hidden" id="ryjbxxId" name="ryjbxxId" value="${ryJyjl.ryjbxxId}"/>
				<sys:formRow>
					<sys:formItem lable="学位" isRequired="true" itemStyle="width:150px;">
						<select name="xw" id="xw" lay-filter="xw">
							<option value="">---请选择---</option>
							<c:forEach items="${xwList}" var="m">
								<c:if test="${ryJyjl.xw eq m.id}">
									<option value="${m.id}" selected="selected">${m.name}</option>
								</c:if>
								<c:if test="${not (ryJyjl.xw eq m.id)}">
									<option value="${m.id}">${m.name}</option>
								</c:if>
							</c:forEach>
						</select>
						<input type="hidden" id="xwMc" name="xwMc"/>
				</sys:formItem>
					<sys:formItem lable="学位获取时间" lableStyle="width:130px;">
						<input  id="xwhqsj" name="xwhqsj" class="layui-input" 
						type="text" value =""  style="width:150px;"
						onFocus="laydate({istime: false, format: 'YYYY-MM-DD'})">
					</sys:formItem>
				</sys:formRow>
				 <sys:formRow>
					<sys:formItem lable="学历" isRequired="true" itemStyle="width:150px;">
						<select name="xl" id="xl"  lay-filter="xl">
							<option value="">---请选择---</option>
							<c:forEach items="${xlList}" var="m">
								<c:if test="${ryJyjl.xl eq m.id}">
									<option value="${m.id}" selected="selected">${m.name}</option>
								</c:if>
								<c:if test="${not (ryJyjl.xl eq m.id)}">
									<option value="${m.id}">${m.name}</option>
								</c:if>
							</c:forEach>
						</select>
						<input type="hidden" id="xlMc" name="xlMc"/>
					</sys:formItem>
					<sys:formItem lable="学历获取时间"   lableStyle="width:130px;">
						<input  id="xlhqsj" name="xlhqsj" class="layui-input" 
						type="text" value =""   style="width:150px;"
						onFocus="laydate({istime: false, format: 'YYYY-MM-DD'})">
					</sys:formItem>
				</sys:formRow>
				<sys:hline/>
				<sys:formRow>
					<sys:formItem lable="毕业学校" >
						<sys:input id="byxx" inputStyle="width:150px;" ></sys:input>
					</sys:formItem>
					<sys:formItem lable="所在国家" lableStyle="width:90px;" >
						<sys:input id="xxszgj" inputStyle="width:150px;" ></sys:input>
					</sys:formItem>
				</sys:formRow>
				<sys:formRow>
					<sys:formItem lable="开始时间" isRequired="true">
						<input  id="kssj" name="kssj" class="layui-input" 
							type="text" required style="width:150px;"
							onFocus="laydate({istime: false, format: 'YYYY-MM-DD'})">
					</sys:formItem>
					<sys:formItem lable="毕业时间" isRequired="true" lableStyle="width:90px;">
						<input  id="bysj" name="bysj" class="layui-input" 
							type="text" value ="" required  style="width:150px;"
							onFocus="laydate({istime: false, format: 'YYYY-MM-DD'})">
					</sys:formItem>
				</sys:formRow>
				<sys:formRow>
					<sys:formItem lable="专业" >
						<sys:input id="zy" inputStyle="width:150px;" ></sys:input>
					</sys:formItem>
					<sys:formItem lable="学制" lableStyle="width:90px;">
						<sys:input id="xz" inputStyle="width:150px;" ></sys:input>
					</sys:formItem>
				</sys:formRow>
				<sys:hline/>
				<sys:formRow>
					<sys:formItem lable="备注">
						<sys:textarea id="remarks" inputStyle="width:450px;height:30px;"></sys:textarea>
					</sys:formItem>
				</sys:formRow> 
			</sys:form>
		</div>
	</body>
</html>