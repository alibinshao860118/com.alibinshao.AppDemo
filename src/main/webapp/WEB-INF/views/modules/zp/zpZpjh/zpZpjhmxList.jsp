<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
	<head>
		<meta name="decorator" content="default" />
		<script type="text/javascript" src="${ctxStatic}/js/modules/zp/zpZpjh/zpZpjhmxList.js"></script>
	</head>
	<body>
		
 		<div class="layui-elem-quote">
		  <span class="layui-breadcrumb" style="font-size: 18px">
			  <a href="${ctx}/zp/zpZpjh/list">招聘计划编制</a>
			  <a><cite>
			  	<c:choose>
			  		<c:when test="${empty zpjh.id}">新增</c:when>
			  		<c:otherwise>修改</c:otherwise>
			  	</c:choose>
			  </cite></a>
			</span>
		</div> 
		
		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 10px;">
		  <legend>1、基本信息</legend>
		</fieldset>
		
		<sys:form id="dialogForm">
			<input type="hidden" id="id" name="id" value="${zpjh.id}"/>
			<input type="hidden" id="zpjhId" name="zpjhId" value="${zpjh.id}"/>
			<sys:formRow>
				<sys:formItem lable="计划编号" isRequired="true">
					<sys:input id="jhBh" inputStyle="width:180px;" required="true"
						value="${zpjh.jhBh}"></sys:input>
				</sys:formItem>
				<sys:formItem lable="计划标题" isRequired="true">
					<sys:input id="jhBt" inputStyle="width:180px;" required="true"
						value="${zpjh.jhBt}"></sys:input>
				</sys:formItem>
				<sys:formItem lable="所属年度" isRequired="true">
					<select id="jhNd" name="jhNd">
						<option value="2017" ${zpjh.jhNd=='2017'?'selected':''}>2017年</option>
						<option value="2018" ${zpjh.jhNd=='2018'?'selected':''}>2018年</option>
						<option value="2019" ${zpjh.jhNd=='2019'?'selected':''}>2019年</option>
						<option value="2020" ${zpjh.jhNd=='2020'?'selected':''}>2020年</option>
						<option value="2021" ${zpjh.jhNd=='2021'?'selected':''}>2021年</option>
					</select>
				</sys:formItem>
			</sys:formRow>
			<sys:formRow>
				<sys:formItem lable="开始时间" >
					<sys:inputDate id="jhKssj" inputStyle="width:180px;"
						value="${zpjh.jhKssj}"></sys:inputDate>
				</sys:formItem>
				<sys:formItem lable="结束时间" >
					<sys:inputDate id="jhJssj" inputStyle="width:180px;"
						value="${zpjh.jhJssj}"></sys:inputDate>
				</sys:formItem>
				<!-- <sys:formItem lable="是否有效" >
					<sys:checkbox checked="true" text="是|否" id="enableFlag"></sys:checkbox>
				</sys:formItem> -->
			</sys:formRow>
			<sys:formRow>
				<sys:formItem lable="备注">
					<sys:textarea id="remarks" inputStyle="width:810px;height:30px;"
						value="${zpjh.remarks}"></sys:textarea>
				</sys:formItem>
			</sys:formRow>
		</sys:form>
	
		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 10px;">
		  <legend>2、具体需求</legend>
		</fieldset>
		
		<div class="layui-btn-group" style="margin-bottom: 5px;">
			<sys:button onclick="add();" btnClass="layui-btn-small"><i class='layui-icon'>&#xe654;</i>新增</sys:button>
			<sys:button onclick="edit();" btnClass="layui-btn-small layui-btn-warm"><i class='layui-icon'>&#xe642;</i>修改</sys:button>
			<sys:button onclick="delete_();" btnClass="layui-btn-small layui-btn-danger"><i class='layui-icon'>&#xe640;</i>删除</sys:button>
		</div>
		<table id="tt" style="height: 200px;" > 
		   	<thead frozen="true">
				<tr>
					<th data-options="field:'id',checkbox:true"">id</th>
					<th data-options="field:'zpbmMc',halign:'center',align:'left',width:140">部门</th>
					<th data-options="field:'zpGw',halign:'center',align:'left',width:140">岗位</th>
					
				</tr>
			</thead>
			<thead>
				<tr>
					<th data-options="field:'zpRs',halign:'center',align:'center',width:70">招聘人数</th>
					<th data-options="field:'zyYq',halign:'center',align:'left',width:210">专业要求</th>
					<th data-options="field:'xlYq',halign:'center',align:'left',width:140">学历/学位要求</th>
					<th data-options="field:'nlYq',halign:'center',align:'left',width:90">年龄要求</th>
					<th data-options="field:'qtYq',halign:'center',align:'left',width:100">其他要求</th>
					<th data-options="field:'remarks',halign:'center',align:'left',width:120">备注</th>
				</tr>
			</thead>
		</table>
		
		<sys:hline/>
		
		<center>
			<sys:button onclick="okFunction();" btnClass="layui-btn-radius layui-btn-normal">&nbsp;&nbsp;保&nbsp;&nbsp;存&nbsp;&nbsp;</sys:button>
			<sys:button onclick="preview();" btnClass="layui-btn-radius">&nbsp;&nbsp;预&nbsp;&nbsp;览&nbsp;&nbsp;</sys:button>
			<sys:button onclick="location.href='${ctx}/zp/zpZpjh/list'" btnClass="layui-btn-radius layui-btn-primary">&nbsp;&nbsp;返&nbsp;&nbsp;回&nbsp;&nbsp;</sys:button>
		</center>
		<script>
			layui.use('element', function(){
			  var element = layui.element();
			  
			});
		</script>
	</body>
</html>