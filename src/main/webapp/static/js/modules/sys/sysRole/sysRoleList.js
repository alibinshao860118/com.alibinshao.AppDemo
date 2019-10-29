$(document).ready(function () {
	$('#tt').datagrid({ 
	    url:ctx+'/sys/sysRole/query', 
	    queryParams : $("#queryForm").serializeObject(),
	    idField:'id', 
	    rownumbers:true,
		pagination:true,
		singleSelect:false,
		onClickRow:function(index,row){
			//更改右侧面板标题
			updateTitle_menuTree("角色【"+row.name+"】拥有的功能权限");
			$("#roleId").val(row.id);
			
			//加载右侧功能树
			var zTreeObj = $.fn.zTree.getZTreeObj("menuTree_treex");
			zTreeObj.setting.async.otherParam = {roleId : row.id};
			zTreeObj.reAsyncChildNodes(null, "refresh");
			zTreeObj.expandAll(true);
		}
	});
});

function query(){
	$('#tt').datagrid("reload",$("#queryForm").serializeObject());
}

/**
 * 新增角色
 */
function add(){
	$("#dialog #dialogForm")[0].reset();
	$("#dialog #dialogForm #id").val(null);
	setDefaultValue_orgId();
	
	layer.open({
		type : 1,
		closeBtn : 1,
		title : "新增角色",
		maxmin : true,
		area : [ '650px', '310px' ],
		content : $('#dialog'), //这里content是一个DOM
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
	
	$("#dialog #dialogForm")[0].reset();
	$('#dialog #dialogForm').form('load',rows[0]);
	$('#dialogForm #orgId').combo("clear");
	$('#dialogForm #orgId').combo("setValue",rows[0].orgId).combo("setText",rows[0].fullOrgNames);
	
	layer.open({
		type : 1,
		closeBtn : 1,
		title : "修改字典",
		maxmin : true,
		area : [ '650px', '310px' ],
		content : $('#dialog'), //这里content是一个DOM
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
			$.post(ctx+"/sys/sysRole/delete", {ids : ids.join('&') }, function(result) {
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
	if($("#dialogForm #id").val() == ''){
		varUrl = ctx+'/sys/sysRole/insert';
	}else{
		varUrl = ctx+'/sys/sysRole/update';
	}
	
	var formData = $("#dialogForm").serializeObject();
	if(formData.enableFlag==null){
		formData.enableFlag = "0";
	}
	if($.trim(formData.code)==""){
		fdp.utils.alertWarn("角色编码不能为空，请填写！");
		return false;
	}
	if($.trim(formData.name)==""){
		fdp.utils.alertWarn("角色名称不能为空，请填写！");
		return false;
	}
	if($.trim(formData.orgId)==""){
		fdp.utils.alertWarn("所属机构不能为空，请填写！");
		return false;
	}
	if($.trim(formData.showOrder)==""){
		fdp.utils.alertWarn("排列顺序不能为空，请填写！");
		return false;
	}
	
	//TODO:需要验证编码是否重复
	
	
	$.post(varUrl,formData,function(data){
		if(data.success){
			fdp.utils.alertInfo("操作成功！",function(){
				layer.closeAll();
				query();
			});
		}else{
			fdp.utils.alertError("操作失败,请联系系统管理员！");
		}
	},"json");

}

function treeNodeClick(e,treeId,treeNode){
	
}

function formatenableFlag(value){
    if (value=="1"){
        return "<span class='layui-icon'>&#xe618;</span>";
    } else {
    	return "<span class='layui-icon'>&#x1006;</span>";
    }
}

function saveRoleMenu(){
	var roleId = $("#roleId").val();
	
	var zTreeObj = $.fn.zTree.getZTreeObj("menuTree_treex");
	var nodes = zTreeObj.getCheckedNodes(true);
	
	var msg = "确定要执行此操作吗?";
	if(nodes.length==0){
		msg = "您未选择要授权的功能，" + msg;
	}
	
	var menuIds = new Array();
	$.each(nodes,function(index,node){
		menuIds.push(node.id);
	});
	
	fdp.utils.confirm(msg, function(r) {
		if (r) {
			var url = ctx + '/sys/sysRole/saveRoleMenu';
			$.post(url,{roleId:roleId,menuIds:menuIds.join('&')},function(data){
				if(data.success){
					fdp.utils.alertInfo("操作成功！",function(){
						layer.closeAll();
					});
				}else{
					fdp.utils.alertError("操作失败,请联系系统管理员！");
				}
			});
		}
	});
}

function resetRoleMenu(){
	var roleId = $("#roleId").val();
	
	//加载右侧功能树
	var zTreeObj = $.fn.zTree.getZTreeObj("menuTree_treex");
	zTreeObj.setting.async.otherParam = {roleId : roleId};
	zTreeObj.reAsyncChildNodes(null, "refresh");
}
