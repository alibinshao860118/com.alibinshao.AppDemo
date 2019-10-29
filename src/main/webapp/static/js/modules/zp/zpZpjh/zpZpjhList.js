$(document).ready(function () {
	$('#tt').datagrid({ 
	    url:ctx+'/zp/zpZpjh/query', 
	    queryParams : $("#queryForm").serializeObject(),
	    idField:'id', 
	    rownumbers:true,
		pagination:true
	});
});

function query(){
	$('#tt').datagrid("reload",$("#queryForm").serializeObject());
}

function formatenableFlag(value){
    if (value=="1"){
        return "<span style='color:green'>正常报名中</span>";
    } else {
    	return "<span style='color:red'>已停止报名</span>";
    }
}

/**
 * 新增
 */
function add(){
	location.href = ctx+"/zp/zpZpjh/toEdit";
}

/**
 * 修改
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
	
	location.href = ctx+"/zp/zpZpjh/toEdit?id="+rows[0].id;
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
			$.post(ctx+"/zp/zpZpjh/delete", {ids : ids.join('&') }, function(result) {
				if (result.success) {
					fdp.utils.alertInfo("操作成功！", function(){
						layer.closeAll();
						query();
					});
				} else {
					fdp.utils.alertError("操作失败,请联系系统管理员");
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
		varUrl = ctx+'/zp/zpZpjh/insert';
	}else{
		varUrl = ctx+'/zp/zpZpjh/update';
	}
	
	var formData = $("#dialogForm").serializeObject();
	
	//TODO: 请根据实际情况编写
	if($.trim(formData.type)==""){
		fdp.utils.alertWarn("类型不能为空，请填写！");
		return false;
	}
	
	$.post(varUrl,formData,function(data){
		if(data.success){
			fdp.utils.alertInfo("操作成功！",function(){
				layer.closeAll();
				query();
			});
		}else{
			fdp.utils.alertError("操作失败，请联系系统管理员！");
		}
	},"json");
}

/**
 * 终止报名
 * @returns
 */
function stop(){
	var rows = $("#tt").datagrid('getSelections');
	if (rows.length == 0) {
		fdp.utils.alertWarn("请选取一条数据进行操作！");
		return;
	}else if (rows.length > 1) {
		fdp.utils.alertWarn("只能选择一条数据进行操作！");
		return;
	}
	
	fdp.utils.confirm("确定要终止报名吗?", function(r) {
		if (r) {
			$.post(ctx+"/zp/zpZpjh/stop", {id : rows[0].id }, function(result) {
				if (result.success) {
					$("#tt").datagrid('clearSelections');
					
					fdp.utils.alertInfo("操作成功！", function(){
						layer.closeAll();
						query();
					});
				} else {
					fdp.utils.alertError("操作失败，请联系系统管理员");
				}
			});
		}
	});
}

/**
 * 恢复报名
 * @returns
 */
function active(){
	var rows = $("#tt").datagrid('getSelections');
	if (rows.length == 0) {
		fdp.utils.alertWarn("请选取一条数据进行操作！");
		return;
	}else if (rows.length > 1) {
		fdp.utils.alertWarn("只能选择一条数据进行操作！");
		return;
	}
	
	if(rows[0].enableFlag=='1'){
		fdp.utils.alertWarn("操作无效，该条计划的状态为：正常报名中！");
		return false;
	}
	
	fdp.utils.confirm("确定要恢复继续报名吗?", function(r) {
		if (r) {
			$.post(ctx+"/zp/zpZpjh/active", {id : rows[0].id }, function(result) {
				if (result.success) {
					$("#tt").datagrid('clearSelections');
					
					fdp.utils.alertInfo("操作成功！", function(){
						layer.closeAll();
						query();
					});
				} else {
					fdp.utils.alertError("操作失败，请联系系统管理员");
				}
			});
		}
	});
}
