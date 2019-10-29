$(document).ready(function () {
	$('#tt').datagrid({ 
	    url:ctx+'/htgl/htHtxx/query', 
	    queryParams : $("#queryForm").serializeObject(),
	    idField:'id', 
	    rownumbers:true,
		pagination:true
	});
});

function query(){
	$('#tt').datagrid("reload",$("#queryForm").serializeObject());
}

function formatHtzt(value,row, index){
	if (value == "1") {
		return "<span style=''>正常</span>";
	} else if (value == "0") {
		return "<span style=''>终止</span>";
	}
}
function formatSfgdqx(value,row, index){
	if (value == "1") {
		return "<span style=''>是</span>";
	} else if (value == "0") {
		return "<span style=''>否</span>";
	}
}
function formatXqFlag(value,row, index){
	if (value == "1") {
		return "<span style=''>新签</span>";
	} else if (value == "2") {
		return "<span style=''>续签</span>";
	}
}

/**
 * 终止或者还原按钮触发的事件
 */
function edit(htZt) {
	var rows = $("#tt").datagrid('getSelections');
	if (rows.length == 0) {
		fdp.utils.alertWarn("请选取一条数据进行操作！");
		return;
	}
	
	var ids = [];
	for(var i=0;i<rows.length;i++) {
		ids.push(rows[i].id);
	}
	var confirmMsg="确定要还原选中的合同吗?";
	if(htZt=='0'){
		confirmMsg="确定要终止选中的合同吗?";
	}
	fdp.utils.confirm(confirmMsg, function(r) {
		if (r) {
			$.post(ctx+"/htgl/htHtxx/updateHtzt?htZt="+htZt,
					{ids : ids.join('&') }, 
					function(result) {
						if (result.success) {
							fdp.utils.alertInfo("操作成功！", function(){
								layer.closeAll();
								query();
							});
						} else {
							fdp.utils.alertError("操作失败,请联系系统管理员");
						}
					}
				);
		}
	});		 
}

/**
 * dialog确定按钮
 */
function okFunction(){
	var varUrl = '';
	if($("#dialogForm #id").val() == ''){
		varUrl = ctx+'/htgl/htHtxx/insert';
	}else{
		varUrl = ctx+'/htgl/htHtxx/update';
	}
	
	var formData = $("#dialogForm").serializeObject();
	
	//TODO: 请根据实际情况编写
	if($.trim(formData.xm)==""){
		fdp.utils.alertWarn("姓名不能为空，请填写！");
		return false;
	}
	if($.trim(formData.zgbh)==""){
		fdp.utils.alertWarn("职工编号不能为空，请填写！");
		return false;
	}
	if($.trim(formData.ksRq)==""){
		fdp.utils.alertWarn("开始日期不能为空，请填写！");
		return false;
	}
	if($.trim(formData.dqRq)==""){
		fdp.utils.alertWarn("到期日期不能为空，请填写！");
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
