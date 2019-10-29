$(document).ready(function () {
	var formData = $("#dialogForm").serializeObject();
	if(formData.id!=null && formData.id!=''){
		$('#tt').datagrid({ 
			url:ctx+'/zp/zpZpjh/queryZpxqByZpjh', 
			queryParams : formData,
			idField:'id', 
			rownumbers:true,
			pagination:false
		});
	}else{
		$('#tt').datagrid({ 
			idField:'id', 
			rownumbers:true,
			pagination:false
		});
	}
});

function query(){
	$('#tt').datagrid("reload",$("#dialogForm").serializeObject());
}

/**
 * 新增
 */
function add(){
	$("#dialog #dialogForm")[0].reset();
	$("#dialog #dialogForm #id").val(null);
	
	layer.open({
		type : 1,
		closeBtn : 1,
		title : "新增招聘计划",
		maxmin : true,
		area : [ '650px', '350px' ],
		content : $('#dialog'), //这里content是一个DOM
		btn : [ '确定', '取消' ],
		btn1 : function() {
			okFunction();
		}
	});
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
	
	$("#dialog #dialogForm")[0].reset();
	$('#dialog #dialogForm').form('load',rows[0]);

	layer.open({
		type : 1,
		closeBtn : 1,
		title : "修改招聘计划",
		maxmin : true,
		area : [ '650px', '350px' ],
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
	if($.trim(formData.jhBh)==""){
		fdp.utils.alertWarn("计划编号不能为空，请填写！");
		return false;
	}
	if($.trim(formData.jhBt)==""){
		fdp.utils.alertWarn("计划标题不能为空，请填写！");
		return false;
	}
	if($.trim(formData.jhNd)==""){
		fdp.utils.alertWarn("所属年度不能为空，请填写！");
		return false;
	}
	
	$.post(varUrl,formData,function(data){
		if(data.success){
			$("#dialogForm #id").val(data.id);
			fdp.utils.alertInfo("操作成功！",function(){
				layer.closeAll();
				query();
			});
		}else{
			fdp.utils.alertError("操作失败,请联系系统管理员！");
		}
	},"json");

}


function preview(){
	fdp.utils.confirm("预览前需要先保存，确认已经保存了吗?", function(r) {
		if(r){
			var formData = $("#dialogForm").serializeObject();
			parent.clikcMenu(ctx+"/zp/zpZpjh/preview?jhBh="+formData.jhBh,'招聘计划预览');
			layer.closeAll();
		}
	});
}
