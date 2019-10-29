$(document).ready(function () {
	var ryjbxxId=$("#queryForm #ryjbxxId").val();
	$('#tt').datagrid({ 
	    url:ctx+'/rygl/ryJyjl/query', 
	    queryParams : $("#queryForm").serializeObject(),
	    idField:'id', 
	    rownumbers:true,
		pagination:true
	});
	
	//表单各种基于事件的操作
	layui.use('form', function(){
		  var form = layui.form();
		  //学历、学位名称的下拉
		  //得到文本并赋值到mc
		  form.on('select(xl)', function(data){
				$("#dialogForm #xlMc").val(this.innerText);
		  }); 
		  form.on('select(xw)', function(data){
				$("#dialogForm #xwMc").val(this.innerText);
		  });
	});
});

function formatYxbz(value,row, index){
	if (value == "0") {
		return "<span style=''>否</span>";
	} else if (value == "1") {
		return "<span style='color:green;'>是</span>";
	}
}
//改变下拉框的名称值并传入后台
function changeXlmc(text){
	alert(text);
}
function query(){
	$('#tt').datagrid("reload",$("#queryForm").serializeObject());
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
		title : "新增教育经历",
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
		title : "修改教育经历",
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
			$.post(ctx+"/rygl/ryJyjl/delete", {ids : ids.join('&') }, function(result) {
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
		varUrl = ctx+'/rygl/ryJyjl/insert';
	}else{
		varUrl = ctx+'/rygl/ryJyjl/update';
	}
	
	var formData = $("#dialogForm").serializeObject();
	
	//验证表单
	if($.trim(formData.xw)==""){
		fdp.utils.alertWarn("【学位】不能为空，请填写！");
		return false;
	}
	if($.trim(formData.xl)==""){
		fdp.utils.alertWarn("【学历】不能为空，请填写！");
		return false;
	}
	if($.trim(formData.kssj)==""){
		fdp.utils.alertWarn("【开始时间】不能为空，请填写！");
		return false;
	}
	if($.trim(formData.bysj)==""){
		fdp.utils.alertWarn("【毕业时间】不能为空，请填写！");
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
