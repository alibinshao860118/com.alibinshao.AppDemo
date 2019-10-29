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
 * 新增
 */
function add(){
	$("#dialog #dialogForm")[0].reset();
	$("#dialog #dialogForm #id").val(null);
	
	layer.open({
		type : 1,
		closeBtn : 1,
		title : "新增合同信息",
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
 * 修改续签合同
 */
function edit(){
	var rows = $("#tt").datagrid('getSelections');
	if (rows.length == 0) {
		fdp.utils.alertWarn("请选取一条合同信息进行操作！");
		return;
	}else if (rows.length > 1) {
		fdp.utils.alertWarn("只能选择一条合同信息进行操作！");
		return;
	}
	
	$("#dialog #dialogForm")[0].reset();
	$('#dialog #dialogForm').form('load',rows[0]);

	layer.open({
		type : 1,
		closeBtn : 1,
		title : "续签合同信息",
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
 * 终止按钮触发的事件
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
	var htZt="0";//终止合同状态
	fdp.utils.confirm("确定要终止选中的合同吗?", function(r) {
		if (r) {
			$.post(ctx+"/htgl/htHtxx/updateHtzt", {htZt:htZt,ids : ids.join('&') }, function(result) {
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
	var varUrl = ctx+'/htgl/htHtxx/insert';
	$("#dialogForm #xqFlag").val("2");
	var formData = $("#dialogForm").serializeObject();
	//验证
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
