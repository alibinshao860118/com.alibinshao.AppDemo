<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
	<head>
		<meta name="decorator" content="default" />
		<script type="text/javascript" src="${ctxStatic}/js/modules/rygl/ryJbxx/ryxxList.js"></script>
	</head>
	<body>
	
	<table style="width: 100%;height: 100%" >
		<tbody>
			<tr>
				<td width="20%" style="vertical-align: top ">
					<div id="leftMenu" class="layui-collapse">
					  <div class="layui-colla-item">
					    <h2 class="layui-colla-title"><span id="layui-colla-title_">人员信息包括：</span></h2>
					    <div style="overflow: auto;"  
					    	class="layui-colla-content layui-show">
					    	<ul id="_treex" class="ztree" style="height:${panelHeight-145}px;">
							</ul>
							<script>
								var setting = {	
									data: {
										simpleData: {
											enable: true
										}
									},
									callback: {
										onClick: function(event, treeId, treeNode){
											clickItem(treeNode.id,'${ryJbxx.id}');
										}
									}
								};
	
								var zNodes =[
									{ id:'ryJbxx',name:"基本信息"},
									{ id:'ryJyjl',name:"教育经历"},
									{ id:'ryGzjl',name:"工作经历"},
									{ id:'ryZcxx',name:"职称信息"},
									{ id:'ryJtcy',name:"家庭成员"}/* ,
									{ id:'ryQtzl',name:"其它资料"} */
								];
								
								$(document).ready(function(){
									var treeObj = $.fn.zTree.init($("#_treex"), setting, zNodes);
									var nodes = treeObj.getNodes();
									if (nodes.length>0) {
										treeObj.selectNode(nodes[0]);
									}
								});
							</script>
						</div>
					  </div>
					</div>
				</td>
				<td  style="vertical-align: top;padding-left: 10px;">
					<div id="dialogFormDiv" style="width:100% ">
						<blockquote class="layui-elem-quote">
							<span class="layui-breadcrumb">
							  <a href="javascript:">人员信息</a>
							  <a href="javascript:"><cite>基本信息</cite></a>
							</span>
						</blockquote>
						<sys:hline/>
						<sys:form id="dialogForm"  > 
							<input type="hidden" id="id" name="id" value="${ryJbxx.id}"/>
							<sys:formRow>
								<sys:formItem lable="职工编号" isRequired="true">
									<sys:input id="zgbh" inputStyle="width:180px;" required="true"
										value="${ryJbxx.zgbh}"></sys:input>
								</sys:formItem>
								<sys:formItem lable="姓名" isRequired="true">
									<sys:input id="name" inputStyle="width:180px;" required="true"
									 value="${ryJbxx.name}"></sys:input>
								</sys:formItem>
							</sys:formRow>
							<sys:formRow>
								<sys:formItem lable="所属部门" isRequired="true">
									<sys:treeSelect id="orgId" type="orgTree" width="180" panelHeight="203" panelWidth="180"
										value="${ryJbxx.orgId}" formId="dialogForm" ></sys:treeSelect>
								</sys:formItem>
								<sys:formItem lable="性别" isRequired="true" itemStyle="width:75px;">
									<select name="xb"  id="xb" >
									   	<c:if test="${ryJbxx.xb=='1' or empty ryJbxx.xb }">
		                				<option value="1" selected="selected">男</option>
		                				<option value="0" >女</option>
		                				</c:if>
		                				<c:if test="${ryJbxx.xb=='0' }">
		                				<option value="1">男</option>
		                				<option value="0" selected="selected">女</option>
		                				</c:if>
	                				</select>
	                				
								</sys:formItem>
							</sys:formRow>
							<sys:formRow>
								<sys:formItem lable="出生日期">
									<%-- <input  id="birthdate" name="birthdate" class="layui-input" 
									type="text" value="${ryJbxx.birthdate}" required style="width:180px;"
									onFocus="laydate({istime: true, format: 'YYYY-MM-DD'})"> --%>
									<sys:inputDate id="birthdate" format="YYYY-MM-DD" istime="true" required="true"></sys:inputDate>
								</sys:formItem>
								<sys:formItem lable="出生地" >
									<sys:input id="birthaddress" value="${ryJbxx.birthaddress}" inputStyle="width:180px;" ></sys:input>
								</sys:formItem>
							</sys:formRow>
							<sys:formRow>
								<sys:formItem lable="婚否" itemStyle="width:75px;">
									<select name="sfjh"  id="sfjh" >
									   	<c:if test="${ryJbxx.sfjh=='1' or empty ryJbxx.sfjh }">
		                				<option value="1" selected="selected">已婚</option>
		                				<option value="0" >未婚</option>
		                				</c:if>
		                				<c:if test="${ryJbxx.sfjh=='0' }">
		                				<option value="1">已婚</option>
		                				<option value="0" selected="selected">未婚</option>
		                				</c:if>
	                				</select>
								</sys:formItem>
								<sys:formItem lable="国籍" lableStyle="width:215px;">
									<sys:input id="gj" value="${ryJbxx.gj}" inputStyle="width:180px;" ></sys:input>
								</sys:formItem>
							</sys:formRow>
							<sys:formRow>
								<sys:formItem lable="证件类型" >
									<select name="zjlx" id="zjlx" value="${ryJbxx.zjlx}">
										<option value="">---请选择---</option>
										<c:forEach items="${zjlxList}" var="m">	
											<c:if test="${ryJbxx.zjlx eq m.id}">				
												<option value="${m.id}" selected="selected">${m.name}</option>
											</c:if>
											<c:if test="${not (ryJbxx.zjlx eq m.id)}">
												<option value="${m.id}" >${m.name}</option>
											</c:if>
										</c:forEach>
									</select>
								</sys:formItem>
								<sys:formItem lable="证件号码" >
									<sys:input id="sfzjhm" inputStyle="width:180px;" value="${ryJbxx.sfzjhm}"></sys:input>
								</sys:formItem>
							</sys:formRow>
							<sys:formRow>
								<sys:formItem lable="民族" >
									<select name="mz" id="mz" >
										<option value="">---请选择---</option>
										<c:forEach items="${mzList}" var="m">					
											<c:if test="${ryJbxx.mz eq m.id}">				
												<option value="${m.id}" selected="selected">${m.name}</option>
											</c:if>
											<c:if test="${not (ryJbxx.mz eq m.id)}">
												<option value="${m.id}" >${m.name}</option>
											</c:if>
										</c:forEach>
									</select>
								</sys:formItem>
								<sys:formItem lable="籍贯" >
									<sys:input id="jg" inputStyle="width:180px;" value="${ryJbxx.jg}"></sys:input>
								</sys:formItem>
							</sys:formRow>
							<sys:formRow>
								<sys:formItem lable="政治面貌">
									<select name="zzmm" id="zzmm" >
										<option value="">---请选择---</option>
										<c:forEach items="${zzmmList}" var="m">					
											<c:if test="${ryJbxx.zzmm eq m.id}">				
												<option value="${m.id}" selected="selected">${m.name}</option>
											</c:if>
											<c:if test="${not (ryJbxx.zzmm eq m.id)}">
												<option value="${m.id}" >${m.name}</option>
											</c:if>
										</c:forEach>
									</select>
								</sys:formItem>
								<sys:formItem lable="港澳台侨" >
									<sys:input id="gatq" inputStyle="width:180px;" value="${ryJbxx.gatq}"></sys:input>
								</sys:formItem>
							</sys:formRow>
							<sys:formRow>
								<sys:formItem lable="户籍种类" >
									<sys:input id="hjzl" inputStyle="width:180px;" value="${ryJbxx.hjzl}"></sys:input>
								</sys:formItem>
							</sys:formRow>
							<sys:formRow>
								<sys:formItem lable="备注">
									<sys:textarea id="remarks" inputStyle="width:490px;height:30px;"
									 value="${ryJbxx.remarks}"></sys:textarea>
								</sys:formItem>
							</sys:formRow> 
						</sys:form>
						<sys:hline/>
						<div align="center">
									<sys:button onclick="okFunction();">保存</sys:button>
									<sys:button onclick="resetRyjbxx();">重置</sys:button>
								</div>
					</div>
					<iframe name="ryMainIframe"  id="ryMainIframe" frameborder="0" style="width:100%;height:600px;display: none;" >
					</iframe>
				</td>
			</tr>
		</tbody>
	</table>
	<script>
		layui.use(['element'], function(){
			var element = layui.element();
		});
	</script>
	</body>
</html>