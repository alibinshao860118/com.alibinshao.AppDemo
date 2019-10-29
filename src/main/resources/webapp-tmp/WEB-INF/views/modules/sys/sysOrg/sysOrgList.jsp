<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
	<head>
		<meta name="decorator" content="default" />
		<script type="text/javascript" src="${ctxStatic}/js/modules/sys/sysOrg/sysOrgList.js"></script>
	</head>
	<body>
		<sys:form id="queryForm">
		
		</sys:form>
		
		<sys:toolbar showExportExcel="true" exportFileName="组织机构列表"
			url="${ctx}/sys/sysOrg/query" formId="queryForm">
		</sys:toolbar>
		
		<table id="tt"  style="height:380px"> 
			<thead frozen="true"> 
		        <tr> 
		            <th data-options="field:'id',width:300,halign:'center'" align="center" formatter="formatOperation">操作</th> 
		        </tr>
		    </thead>
		    <thead> 
		        <tr> 
		            <th data-options="field:'orgName',width:200,halign:'center',align:'left'">组织名称</th> 
		            <th data-options="field:'orgCode',width:100,halign:'center',align:'center'">组织代码</th> 
		            <th data-options="field:'orgType',width:100,halign:'center',align:'center'" formatter="formatOrgType">组织类型</th> 
		            <th data-options="field:'bzlb',width:90,halign:'center',align:'center'">编制类别</th> 
		            <th data-options="field:'bzrs',width:90,halign:'center',align:'center'">编制人数</th> 
		            <th data-options="field:'leaderName',width:90,halign:'center'">负责人</th> 
		            <th data-options="field:'enableFlag',width:70,halign:'center'" align="center"  formatter="formatSatus">有效</th> 
		            <th data-options="field:'showOrder',width:60,halign:'center'"  align="center">排序</th> 
		            <th data-options="field:'remark',width:180,halign:'center',align:'left'">备注</th> 
		        </tr> 
		    </thead> 
		</table>
		
 		<blockquote class="layui-elem-quote" style="margin-top: 10px;">
			说明：组织机构列表默认是展示到部门类别这个层面，可点击前方“箭头”图标来展开显示部门或者岗位，同时也可对其进行维护。
		</blockquote> 
		
		<div id="zzjgRy"  style="padding-left: 5px;padding-right: 5px; display: none; " >
			<sys:form id="zzz">
				<input type="hidden" id="orgId" />
			</sys:form>
			<div class="layui-tab layui-tab-brief" lay-filter="demo">
				<ul class="layui-tab-title">
					<li class="layui-this">已选人员</li>
					<li>待选人员</li>
				</ul>
				<div class="layui-tab-content">
					<div class="layui-tab-item layui-show">
						<sys:toolbar showExportExcel="false" formId="queryForm">
				        	<div class="layui-btn-group">
								<sys:button onclick="removeOrgRy();" btnClass="layui-btn-small layui-btn-danger"><i class='layui-icon'>&#xe640;</i>移除人员</sys:button>
					       	</div>
						</sys:toolbar>
					
						<table id="ttt" style="height:232px;"> 
							<thead frozen="true"> 
						        <tr> 
						           <th data-options="field:'id',checkbox:true"">id</th>
									<th data-options="field:'zgbh',sortable:true,halign:'center',align:'left',width:90">职工编号</th>
									<th data-options="field:'name',sortable:true,halign:'center',align:'left',width:90">姓名</th>
						        </tr>
						    </thead>
						    <thead> 
						        <tr> 
									<th data-options="field:'xb',sortable:true,halign:'center',align:'center',width:55,formatter:formatXb">性别</th>
									<th data-options="field:'birthdateStr',sortable:true,halign:'center',align:'center',width:90">出生日期</th>
									<th data-options="field:'sfjh',sortable:true,halign:'center',align:'center',width:80,formatter:formatSfjhbz">婚否</th>
									<th data-options="field:'zjlx',sortable:true,halign:'center',align:'left',width:90">证件类型</th>
									<th data-options="field:'sfzjhm',sortable:true,halign:'center',align:'left',width:190">证件号码</th>
						        </tr> 
						    </thead> 
						</table>				
					</div>
					<div class="layui-tab-item">
						<sys:toolbar showExportExcel="false" formId="queryForm">
				        	<div class="layui-btn-group">
					        	<sys:button onclick="addOrgRy();" btnClass="layui-btn-small layui-btn-normal"><i class='layui-icon'>&#xe654;</i>添加人员</sys:button>
					       	</div>
						</sys:toolbar>
						
						<table id="tttt" style="height:232px;"> 
							<thead frozen="true"> 
						        <tr> 
						           <th data-options="field:'id',checkbox:true"">id</th>
									<th data-options="field:'zgbh',sortable:true,halign:'center',align:'left',width:90">职工编号</th>
									<th data-options="field:'name',sortable:true,halign:'center',align:'left',width:90">姓名</th>
						        </tr>
						    </thead>
						    <thead> 
						        <tr> 
									<th data-options="field:'xb',sortable:true,halign:'center',align:'center',width:55,formatter:formatXb">性别</th>
									<th data-options="field:'birthdateStr',sortable:true,halign:'center',align:'center',width:90">出生日期</th>
									<th data-options="field:'sfjh',sortable:true,halign:'center',align:'center',width:80,formatter:formatSfjhbz">婚否</th>
									<th data-options="field:'zjlx',sortable:true,halign:'center',align:'left',width:90">证件类型</th>
									<th data-options="field:'sfzjhm',sortable:true,halign:'center',align:'left',width:190">证件号码</th>
						        </tr> 
						    </thead> 
						</table>	
					</div>
				</div>
				<script>
				  //一些事件监听,用于加载表格
				layui.use('element', function(){
				  var element = layui.element();
				  element.on('tab(demo)', function(data){
					  findExistOrgUser();
					  findNotExistOrgUser();
				  });
				});
				</script>
			</div>
		</div>
		
		<div id="tjjg"  style="padding: 8px;padding-left: 15px; display: none; " >
			<sys:form id="addForm">
				<input type="hidden"  name="oldOrgId" id="oldOrgId"/>
				<input type="hidden"  name="oldOrgCode" id="oldOrgCode"/>
				<input type="hidden"  name="oldOrgName" id="oldOrgName"/>
				<input type="hidden"  name="oldOrgShortName" id="oldOrgShortName"/>
				<input type="hidden"  name="parentOrgId" id="parentOrgId"/>
				<input type="hidden"  name="parentOrgCode" id="parentOrgCode"/>
				<input type="hidden"  name="fullOrgIds" id="fullOrgIds"/>
				<input type="hidden"  name="fullOrgCodes" id="fullOrgCodes"/>
				<input type="hidden"  name="fullOrgNames" id="fullOrgNames"/>
				<input type="hidden"  name="oldFullOrgCodes" id="oldFullOrgCodes"/>
				<input type="hidden"  name="oldFullOrgNames" id="oldFullOrgNames"/>
				<input type="hidden"  name="id" id="id"/>
				
				<sys:formRow>
					<sys:formItem lable="组织类别" isRequired="true">
						 <input id="orgType1" style=" border: none;" name="orgType" checked="checked" 
						 	type="radio" value="1" title="部门"/>
		                 <input id="orgType2" style=" border: none;" name="orgType" 
		                 	type="radio" value="2" title="岗位"/>
					</sys:formItem>
					<sys:formItem lable="组织编码" isRequired="true">
	            		<sys:input id="orgCode" inputStyle="width:180px;" required="true" />
					</sys:formItem>
				</sys:formRow>
				<sys:formRow>
					<sys:formItem lable="组织名称" isRequired="true">
						<sys:input id="orgName" inputStyle="width:180px;" required="true" />
					</sys:formItem>
<%-- 					<sys:formItem lable="组织简称" isRequired="true">
						<sys:input id="orgShortName" inputStyle="width:180px;" required="true" />
					</sys:formItem> --%>
					<sys:formItem lable="上级组织">
						<sys:input id="parentOrgName" inputStyle="width:180px;" readOnly="true"></sys:input>
					</sys:formItem>
				</sys:formRow>
				<sys:formRow>
					<sys:formItem lable="编制类别">
	            		<sys:input id="bzlb" inputStyle="width:180px;" />
					</sys:formItem>
					<sys:formItem lable="编制人数">
	            		<sys:input id="bzrs" inputStyle="width:180px;" />
					</sys:formItem>
				</sys:formRow>
				<sys:formRow>
					<sys:formItem lable="负责人">
	            		<sys:input id="leaderId" inputStyle="width:180px;" />
					</sys:formItem>
					<sys:formItem lable="办公室电话">
	            		<sys:input id="phone" inputStyle="width:180px;" />
					</sys:formItem>
				</sys:formRow>
<%-- 				<sys:formRow>
					<sys:formItem lable="办公地址">
						<sys:input id="address" inputStyle="width:180px;"  />
					</sys:formItem>
				</sys:formRow> --%>
				<sys:formRow>
					<sys:formItem lable="是否启用">
						<sys:checkbox id="enableFlag" checked="true" text="是|否" />
					</sys:formItem>
					<sys:formItem lable="排列顺序" isRequired="true">
						<sys:input id="showOrder" inputStyle="width:180px;"  />
					</sys:formItem>
				</sys:formRow>
				<sys:formRow>
					<sys:formItem lable="备注" >
						<sys:textarea id="remarks" inputStyle="width:490px;height:30px;"  />
					</sys:formItem>
				</sys:formRow>
			</sys:form>
		</div>
	</body>
</html>