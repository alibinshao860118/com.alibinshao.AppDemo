$(document).ready(function () {
	$('#tt').datagrid({ 
	    url:ctx+'/kq/kqBsxx/query', 
	    queryParams : $("#queryForm").serializeObject(),
	    idField:'id', 
	    rownumbers:true,
		pagination:true
	});
	
});

function query(){
	$('#tt').datagrid("reload",$("#queryForm").serializeObject());
}

function onSelect(){
	var orgId = $("#dialogForm #orgId").combo("getValue");

	//加载考勤人员
	var data = $("#dialogForm").serializeObject();
	data.orgId = orgId;
	$('#ttt').datagrid("reload",data);
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
		title : "新增考勤报送信息",
		maxmin : true,
		area : [ '750px', '450px' ],
		content : $('#dialog'), //这里content是一个DOM
		btn : [ '确定', '取消' ],
		btn1 : function() {
			okFunction();
		}
	});
	
	$('#ttt').edatagrid({ 
	    url:ctx+'/kq/kqBsxx/getBsmxBy', 
	    queryParams : $("#dialogForm").serializeObject(),
	    idField:'id', 
	    rownumbers:true,
		pagination:false,
		autoSave:true,
		onSave:function(index,row){
			//TODO:
			
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
	$("#dialogForm #orgId").combo("setValue",rows[0].orgId);
	$("#dialogForm #orgId").combo("setText",rows[0].orgName);

	layer.open({
		type : 1,
		closeBtn : 1,
		title : "修改考勤报送信息",
		maxmin : true,
		area : [ '750px', '450px' ],
		content : $('#dialog'), //这里content是一个DOM
		btn : [ '确定', '取消' ],
		btn1 : function() {
			okFunction();
		}
	});
	
	//加载考勤人员
	var data = $("#dialogForm").serializeObject();
	data.orgId = rows[0].orgId;
	
	$('#ttt').edatagrid({ 
	    url:ctx+'/kq/kqBsxx/getBsmxBy', 
	    queryParams : data,
	    idField:'id', 
	    rownumbers:true,
		pagination:false,
		autoSave:true,
		onSave:function(index,row){
			//TODO:
			
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
			$.post(ctx+"/kq/kqBsxx/delete", {ids : ids.join('&') }, function(result) {
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
		varUrl = ctx+'/kq/kqBsxx/insert';
	}else{
		varUrl = ctx+'/kq/kqBsxx/update';
	}
	
	var formData = $("#dialogForm").serializeObject();
	var orgId = $("#dialogForm #orgId").combo("getValue");
	formData.orgId = orgId;
	
	if($.trim(formData.orgId)==""){
		fdp.utils.alertWarn("考勤部门不能为空，请填写！");
		return false;
	}
	if($.trim(formData.kqYf)==""){
		fdp.utils.alertWarn("考勤年份不能为空，请填写！");
		return false;
	}
	if($.trim(formData.kqMf)==""){
		fdp.utils.alertWarn("考勤月份不能为空，请填写！");
		return false;
	}
	
	formData.bsmxList =  $("#ttt").datagrid('getRows');
	
	$.ajax({
        url:varUrl,
        data: JSON.stringify(formData) ,
        dataType:'json',
        type:'post',
		 dataType:"json",  
		 contentType:"application/json",          
        success:function(data){
        	console.log(data);
        	if(data.success){
    			fdp.utils.alertInfo("操作成功！",function(){
    				layer.closeAll();
    				query();
    			});
    		}else{
    			fdp.utils.alertError("操作失败,请联系系统管理员！");
    		}
        }

    })

}
