<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
	<head>
		<meta name="decorator" content="default" />
		<script type="text/javascript" src="${ctxStatic}/js/modules/cxtj/sysRsxxzhtj/sysRsxxzhtjList.js"></script>
		<script type="text/javascript" >
		$(document).ready(function () {
			//性别树控件
			$('#xbTable').treegrid({ 
			    url : ctx+'/sys/sysOrg/getOrgListByParentId', 
			    idField:'id', 
			    treeField:'orgName',
			    rownumbers:true,
			    animate:true
			});
			
		});
		
			  //一些事件监听,用于加载表格
			layui.use('element', function(){
			  var element = layui.element();
			  element.on('tab(demo)', function(data){
				  $('#xbTable').treegrid({ 
					    url : ctx+'/sys/sysOrg/getOrgListByParentId', 
					    idField:'id', 
					    treeField:'orgName',
					    rownumbers:true,
					    animate:true
					});
				  $('#xlTable').treegrid({ 
					    url : ctx+'/sys/sysOrg/getOrgListByParentId', 
					    idField:'id', 
					    treeField:'orgName',
					    rownumbers:true,
					    animate:true
					});
				  $('#nlTable').treegrid({ 
					    url : ctx+'/sys/sysOrg/getOrgListByParentId', 
					    idField:'id', 
					    treeField:'orgName',
					    rownumbers:true,
					    animate:true
					});
			  });
			});
		</script>
	</head>
	<body>
		<div style="font-size: 20px;text-align: center">人事信息综合情况统计</div>
		<div class="layui-tab layui-tab-brief" lay-filter="demo">
			<ul class="layui-tab-title">
				<li class="layui-this">性别</li>
				<li>学历</li>
				<li>年龄</li>
			</ul>
			<div class="layui-tab-content" >
				<div class="layui-tab-item layui-show" >
					<table id="xbTable" style="height: 450px">
						<thead frozen="true">
							<tr>
								<!--  <th data-options="field:'id',width:200,halign:'center'" align="center" formatter="formatOperation">操作</th>  -->
								<th
									data-options="field:'orgName',width:200,halign:'center',align:'left'">部门名称</th>
							</tr>
						</thead>
						<thead>
							<tr>
								<!-- <th data-options="field:'orgShortName',width:200,halign:'center',align:'left'" >简称</th> 
			            <th data-options="field:'orgCode',width:100,halign:'center',align:'center'">机构代码</th> 
			             -->
								<th data-options="field:'bzlb',width:90,halign:'center'">男</th>
								<th data-options="field:'bzrs',width:90,halign:'center'">女</th>
								
							</tr>
						</thead>
					</table>
			</div>
				<div class="layui-tab-item " id="xlDiv">
					<table id="xlTable" style="height: 450px">
						<thead frozen="true">
							<tr>
								<!--  <th data-options="field:'id',width:200,halign:'center'" align="center" formatter="formatOperation">操作</th>  -->
								<th
									data-options="field:'orgName',width:200,halign:'center',align:'left'">部门名称</th>
							</tr>
						</thead>
						<thead>
							<tr>
								<th data-options="field:'bzlb',width:90,halign:'center'">博士</th>
								<th data-options="field:'bzrs',width:90,halign:'center'">硕士</th>
								<th data-options="field:'leaderName',width:90,halign:'center'">本科</th>
								<th data-options="field:'remark',width:90,halign:'center'">专科及以下</th>
							</tr>
						</thead>
					</table>
				</div>
				<div class="layui-tab-item ">
				   <table id="nlTable" style="height: 450px">
						<thead frozen="true">
							<tr>
								<!--  <th data-options="field:'id',width:200,halign:'center'" align="center" formatter="formatOperation">操作</th>  -->
								<th
									data-options="field:'orgName',width:200,halign:'center',align:'left'">部门名称</th>
							</tr>
						</thead>
						<thead>
							<tr>
								<th data-options="field:'bzrs',width:90,halign:'center'">30岁以下</th>
								<th data-options="field:'bzrs',width:90,halign:'center'">31-40(岁)</th>
								<th data-options="field:'bzrs',width:90,halign:'center'">41-50(岁)</th>
								<th data-options="field:'bzrs',width:90,halign:'center'">51-60(岁)</th>
								<th data-options="field:'bzrs',width:90,halign:'center'">60岁以上</th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
		</div>
	
	
		<!-- <table id="tt" > 
		   	<thead frozen="true">
				<tr>
					<th data-options="field:'id',checkbox:true">id</th>
				</tr>
			</thead>
			<thead>
				<tr>
					<th data-options="field:'nls',sortable:true,halign:'center',align:'left',width:90">年龄数</th>
					<th data-options="field:'xls',sortable:true,halign:'center',align:'left',width:90">学历数</th>
					<th data-options="field:'xbs',sortable:true,halign:'center',align:'left',width:90">性别数</th>
				</tr>
			</thead>
		</table> -->
		
		<div id="dialog"  style="display: none;padding: 10px 10px 0 40px; ">
			<sys:form id="dialogForm">
				<input type="hidden" id="id" name="id" />
				<sys:formRow>
					<sys:formItem lable="年龄数" lableStyle="width:85px">
						<sys:input id="nls" inputStyle="width:150px;"></sys:input>
			   		</sys:formItem>
					<sys:formItem lable="学历数" lableStyle="width:85px">
						<sys:input id="xls" inputStyle="width:150px;"></sys:input>
			   		</sys:formItem>
			   </sys:formRow>
			   <sys:formRow>
					<sys:formItem lable="性别数" lableStyle="width:85px">
						<sys:input id="xbs" inputStyle="width:150px;"></sys:input>
			   		</sys:formItem>
			  </sys:formRow>
			</sys:form>
		</div>
	</body>
</html>