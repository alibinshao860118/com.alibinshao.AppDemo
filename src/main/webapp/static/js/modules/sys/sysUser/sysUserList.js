$(document).ready(function () {
	//菜单树控件
	$('#tt').datagrid({ 
	    url:ctx+'/sys/sysUser/query', 
	    queryParams : $("#queryForm").serializeObject(),
	    idField:'id', 
	    rownumbers:true,
		pagination:true
	});

});

function query(){
	$('#tt').datagrid("reload",$("#queryForm").serializeObject());
}

/**
 * 添加用户
 */
function add(){
	$("#addForm").form("reset");
	$("#addForm #loginid").attr("readonly",false);
	$("#addForm #name").attr("readonly",false);
	setDefaultValue_orgId();
	
	layer.open({
		type : 1,
		closeBtn : 1,
		title : "新增用户",
		maxmin : true,
		area : [ '660px', '475px' ],
		content : $('#tjyh'), //这里content是一个DOM
		btn : [ '确定', '取消' ],
		btn1 : function() {
			okFunction();
		}
	});
}

/**
 * 修改按钮
 */
function edit(){
	var rows = $("#tt").datagrid('getSelections');
	if (rows.length == 0) {
		fdp.utils.alertWarn("请选取一条数据进行操作！");
		return;
	}else if (rows.length > 1) {
		fdp.utils.alertWarn("只能选择一条数据进行操作！");
		return;
	}
	
	$("#addForm")[0].reset();
	$('#addForm').form('load',rows[0]);
	$('#addForm #orgId').combo("clear");
	$('#addForm #orgId').combo("setValue",rows[0].orgId).combo("setText",rows[0].fullOrgNames);
	$("#addForm #oldLoginId").val(rows[0].loginId);

	layer.open({
		type : 1,
		closeBtn : 1,
		title : "修改用户",
		maxmin : true,
		area : [ '660px', '475px' ],
		content : $('#tjyh'), //这里content是一个DOM
		btn : [ '确定', '取消' ],
		btn1 : function() {
			okFunction();
		}
	});
}

/**
 * 删除按钮触发的事件
 */
function delete_() {
	var rows = $("#tt").datagrid('getSelections');
	if (rows.length == 0) {
		fdp.utils.alertWarn("请选取一条数据进行操作！");
		return;
	}
	
	var ids = [];
	for(var i=0;i<rows.length;i++) {
		ids.push(rows[i].id);
	}
	
	fdp.utils.confirm("确定要删除选中的数据吗?", function(r) {
		if (r) {
			$.post(ctx+"/sys/sysUser/delete", {ids : ids.join('&') }, function(result) {
				if (result.success) {
					fdp.utils.alertInfo("操作成功！",function(){
						layer.closeAll();
						query();
					});
				} else {
					fdp.utils.alertError("操作失败,请联系系统管理员！");
				}
			});
		}
	});		 
}

/**
 * dialog确定按钮
 */
function okFunction(){
	var varUrl = '';
	if($("#addForm #id").val() == '' ){
		varUrl = ctx+'/sys/sysUser/insert';
	}else{
		varUrl = ctx+'/sys/sysUser/update';
	}
	
	var formData = $("#tjyh #addForm").serializeObject();
	if(formData.enableFlag==null){
		formData.enableFlag = "0";
	}
	if($.trim(formData.loginId)==""){
		fdp.utils.alertWarn("登录账号不能为空，请填写！");
		return false;
	}
	if($.trim(formData.name)==""){
		fdp.utils.alertWarn("用户名称不能为空，请填写！");
		return false;
	}
	if($.trim(formData.orgId)==""){
		fdp.utils.alertWarn("所属机构不能为空，请选择！");
		return false;
	}
	if($.trim(formData.showOrder)==""){
		fdp.utils.alertWarn("排列顺序不能为空，请填写！");
		return false;
	}
	
	//验证登录账号是否唯一
	if($.trim(formData.loginId)!=$.trim(formData.oldLoginId)){
		$.post(ctx+"/sys/sysUser/checkExsit4LoginId",formData,function(data){
			if(data){
				fdp.utils.alertWarn("登陆账号已经存在，请修改！");
			}else{
				saveData(varUrl,formData);
			}
		});
	}else{
		saveData(varUrl,formData);
	}
}

function saveData(varUrl,formData){
	fdp.utils.confirm("确定要提交数据吗?", function(r) {
		if (r) {
			$.post(varUrl,formData,function(data){
				if(data.success){
					fdp.utils.alertInfo("操作成功！", function(){
						layer.closeAll();
						query();
					});
				}else{
					fdp.utils.alertError("操作失败,请联系系统管理员！");
				} 
			},"json");
		}
	});
}

function formatSatus(value){
    if (value=="1"){
        return "<span class='layui-icon'>&#xe618;</span>";
    } else {
    	return "<span class='layui-icon'>&#x1006;</span>";
    }
}

function treeNodeClick(e,treeId,treeNode){
	$("#queryForm #fullOrgCodes").val(treeNode.otherParam.fullOrgCodes);
	query();
}

//===============指定角色=================
/**
 * 指点角色
 */
function zdjs(){
	var rows = $("#tt").datagrid('getSelections');
	if (rows.length == 0) {
		fdp.utils.alertWarn("请选取一条数据进行操作！");
		return;
	}else if (rows.length > 1) {
		fdp.utils.alertWarn("只能选择一条数据进行操作！");
		return;
	}
	
	$('#roleForm #userId').val(rows[0].id);
	
	$("#kxjslb").datagrid("options").url = ctx+'/sys/sysUser/queryNotGrantRoleById';
	$("#kxjslb").datagrid("load",{userId : rows[0].id });
	
	$("#yxjslb").datagrid("options").url = ctx+'/sys/sysUser/queryGrantRoleById';
	$("#yxjslb").datagrid("load",{userId : rows[0].id });
	
	layer.open({
		type : 1,
		closeBtn : 1,
		title : "指定角色【登录账号："+rows[0].loginId+"】",
		maxmin : true,
		area : [ '800px', '467px' ],
		content : $('#roleWin'), //这里content是一个DOM
		btn : [ '取消' ],
	});
}

//===============指定授权机构=================
/**
 * 指点授权机构
 */
function zdscjg(){
	
	var rows = $("#tt").datagrid('getSelections');
	if (rows.length == 0) {
		fdp.utils.alertWarn("请选取一条数据进行操作！");
		return;
	}else if (rows.length > 1) {
		fdp.utils.alertWarn("只能选择一条数据进行操作！");
		return;
	}
	
	$('#grantOrgForm #userId').val(rows[0].id);
	
	$("#yxGrantOrg").datagrid("options").url = ctx+'/sys/sysUser/queryGrantOrgById';
	$("#yxGrantOrg").datagrid("load",{userId : rows[0].id });
	
	layer.open({
		type : 1,
		closeBtn : 1,
		title : "指定授权机构【登录账号："+rows[0].loginId+"】",
		maxmin : true,
		area : [ '800px', '467px' ],
		content : $('#grantOrgWin'), //这里content是一个DOM
		btn : ['取消' ]
	});
}
//==========================
/**
 * 重置密码
 */
function czmm(){
	var rows = $("#tt").datagrid('getSelections');
	if (rows.length == 0) {
		fdp.utils.alertWarn("请选取一条数据进行操作！");
		return;
	}else if (rows.length > 1) {
		fdp.utils.alertWarn("只能选择一条数据进行操作！");
		return;
	}
	
	$("#resetPwdForm")[0].reset();
	$('#resetPwdForm').form('load',rows[0]);
	
	layer.open({
		type : 1,
		closeBtn : 1,
		title : "重置用户密码",
		maxmin : true,
		area : [ '400px', '310px' ],
		content : $('#resetPwdWin'), //这里content是一个DOM
		btn : [ '确定', '取消' ],
		btn1 : function() {
			var formData = $("#resetPwdWin #resetPwdForm").serializeObject();
			if($.trim(formData.newPasswd)==""){
				fdp.utils.alertWarn("新密码不能为空，请填写！");
				return false;
			}
			if($.trim(formData.confirmNewPwd)==""){
				fdp.utils.alertWarn("确认密码不能为空，请填写！");
				return false;
			}
			if(formData.newPasswd != formData.confirmNewPwd){
				fdp.utils.alertWarn("两次输入的密码不一致，请确认！");
				return false;
			}

			var varUrl = ctx+'/sys/sysUser/resetPwd';
			$.post(varUrl,formData,function(data){
				if(data.success){
					fdp.utils.alertInfo("操作成功！", function(){
						layer.closeAll();
					});
				}else{
					fdp.utils.alertError("操作失败,请联系系统管理员！");
				}
			},"json");
			
		}
	});
}

//==========================
/**
 * 打开过滤条件框
 */
function cktj(){
	var rows = $("#tt").datagrid('getSelections');
	
	$('#cktjForm #userId').val($('#roleForm #userId').val());
	
	layer.open({
		type : 1,
		closeBtn : 1,
		title : "过滤角色",
		maxmin : true,
		area : [ '400px', '220px' ],
		content : $('#cktjWin'), //这里content是一个DOM
		btn : [ '确定', '取消' ],
		btn1 : function(index) {
			$('#kxjslb').datagrid("reload",$("#cktjForm").serializeObject());
			$('#cktjForm')[0].reset();
			layer.close(index);
		}
	});
}

function addRole(){
	var rows = $("#kxjslb").datagrid('getSelections');
	if (rows.length == 0) {
		fdp.utils.alertWarn("请在左侧选择要添加的角色！");
		return;
	}
	
	var ids = [];
	for(var i=0;i<rows.length;i++) {
		ids.push(rows[i].id);
	}
	
	fdp.utils.confirm("确定要添加选中的角色吗?", function(r) {
		if (r) {
			var userId = $('#roleForm #userId').val();
			$.post(ctx+"/sys/sysUser/addUserRoles", {userId : userId, ids : ids.join('&') }, function(result) {
				if (result.success) {
					$('#kxjslb').datagrid("reload",$("#roleForm").serializeObject());
					$('#yxjslb').datagrid("reload",$("#roleForm").serializeObject());
					fdp.utils.alertInfo("操作成功！");
				} else {
					fdp.utils.alertError("操作失败,请联系系统管理员！");
				}
			});
		}
	});		 
}

function removeRole(){
	var rows = $("#yxjslb").datagrid('getSelections');
	if (rows.length == 0) {
		fdp.utils.alertWarn("请在右侧选择要移除的角色！");
		return;
	}
	
	var ids = [];
	for(var i=0;i<rows.length;i++) {
		ids.push(rows[i].id);
	}
	
	fdp.utils.confirm("确定要移除选中的角色吗?", function(r) {
		if (r) {
			var userId = $('#roleForm #userId').val();
			$.post(ctx+"/sys/sysUser/removeUserRoles", {userId : userId, ids : ids.join('&') }, function(result) {
				if (result.success) {
					$('#kxjslb').datagrid("reload",$("#roleForm").serializeObject());
					$('#yxjslb').datagrid("reload",$("#roleForm").serializeObject());
					fdp.utils.alertInfo("操作成功！");
				} else {
					fdp.utils.alertError("操作失败,请联系系统管理员！");
				}
			});
		}
	});		
}

//========================================================
function addGrantOrg(){
	var treeObj = $.fn.zTree.getZTreeObj("org2_treex");
	var nodes = treeObj.getCheckedNodes();
	
	if (nodes.length == 0) {
		fdp.utils.alertWarn("请在左侧选择要授权的组织机构！");
		return;
	}
	
	var ids = [];
	for(var i=0;i<nodes.length;i++) {
		ids.push(nodes[i].id);
	}
	
	fdp.utils.confirm("确定要添加选中的组织机构吗?", function(r) {
		if (r) {
			var userId = $('#grantOrgForm #userId').val();
			$.post(ctx+"/sys/sysUser/addGrantOrg", {userId : userId, ids : ids.join('&') }, function(result) {
				if (result.success) {
					$('#yxGrantOrg').datagrid("reload",$("#roleForm").serializeObject());
					fdp.utils.alertInfo("操作成功！");
				} else {
					fdp.utils.alertError("操作失败,请联系系统管理员！");
				}
			});
		}
	});		
	
}

function removeGrantOrg(){
	var rows = $("#yxGrantOrg").datagrid('getSelections');
	if (rows.length == 0) {
		fdp.utils.alertWarn("请在右侧选择要移除的组织机构！");
		return;
	}
	
	var ids = [];
	for(var i=0;i<rows.length;i++) {
		ids.push(rows[i].id);
	}
	
	fdp.utils.confirm("确定要移除选中的组织机构吗?", function(r) {
		if (r) {
			var userId = $('#grantOrgForm #userId').val();
			$.post(ctx+"/sys/sysUser/removeGrantOrg", {userId : userId, ids : ids.join('&') }, function(result) {
				if (result.success) {
					$('#yxGrantOrg').datagrid("reload",$("#roleForm").serializeObject());
					fdp.utils.alertInfo("操作成功！");
				} else {
					fdp.utils.alertError("操作失败,请联系系统管理员！");
				}
			});
		}
	});		
}