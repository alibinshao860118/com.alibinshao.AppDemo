$(document).ready(function () {
	$('#tt').datagrid({ 
	    url:ctx+'/rygl/ryJbxx/query', 
	    queryParams : $("#queryForm").serializeObject(),
	    idField:'id', 
	    rownumbers:true,
		pagination:true
	});
});

function treeNodeClick(e,treeId,treeNode){
	$("#queryForm #fullOrgCodes").val(treeNode.otherParam.fullOrgCodes);
	query();
}

function formatSfjhbz(value,row, index){
	if (value == "1") {
		return "<span style=''>已婚</span>";
	} else if (value == "0") {
		return "<span style=''>未婚</span>";
	}
}

function formatXb(value,row, index){
	if (value == "1") {
		return "<span style=''>男</span>";
	} else if (value == "0") {
		return "<span style=''>女</span>";
	}
}

function query(){
	$('#tt').datagrid("reload",$("#queryForm").serializeObject());
}

/**
 * 新增
 */
function add(){
	//TODO
	parent.clikcMenu(ctx+'/rygl/ryJbxx/toAdd','新增人员信息');
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
	
	parent.clikcMenu(ctx+'/rygl/ryJbxx/toUpdate?id='+rows[0].id,'修改人员信息')
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
			$.post(ctx+"/rygl/ryJbxx/delete", {ids : ids.join('&') }, function(result) {
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
		varUrl = ctx+'/rygl/ryJbxx/insert';
	}else{
		varUrl = ctx+'/rygl/ryJbxx/update';
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
			fdp.utils.alertError("操作失败,请联系系统管理员！");
		}
	},"json");

}
