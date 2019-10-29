$(document).ready(function () {
	//如果不是修改页面则不加载基本信息
	var queryId=$("#queryForm #id").val();
	
	//
	var height = $(document).height();
	$("#leftMenu").css("height",height-40);
	$("#ryMainIframe").css("height",height-40);
});

var map = {
		ryJyjl : "/rygl/ryJyjl/list",		
		ryGzjl : "/rygl/ryGzjl/list",
		ryZcxx : "/rygl/ryZcxx/list",
		ryJtcy : "/rygl/ryJtcy/list",
		ryQtzl : "/rygl/ryQtzl/list"
			
};

function clickItem(itemId,id){
	if("ryJbxx"==itemId){
		$('#dialogFormDiv').show();
		$("#ryMainIframe").css("display","none");
	}else{
		var url_tmp = map[itemId];
		var url = ctx + url_tmp +"?ryjbxxId=";
		
		var ryjbxxId = $("#dialogForm #id").val();
		
		if(ryjbxxId !=null && ryjbxxId !=''){
			url += ryjbxxId;
			$('#dialogFormDiv').hide();
			$("#ryMainIframe").css("display","");
			$("#ryMainIframe").attr("src",url);
		}else{//如果没有基本信息ID，必须先填写基本信息并保存
			fdp.utils.alertWarn("请先填写人员基本信息并保存！");
		}
	}
	
}

function query(){
	$('#tt').datagrid("reload",$("#queryForm").serializeObject());
}

/**
 * 重置
 * @returns
 */
function resetRyjbxx(){
	$("#dialogForm").form('reset');
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
	//TODO
	parent.clikcMenu(ctx+'/zp/zpjlsxlc/initDbrw','新增人员')
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
//验证填写信息
function validateFormData(){
	var zgbh =  $("#zgbh").val();
	if($.trim(zgbh)==""){
		$("#zgbh").focus();
		fdp.utils.alertWarn("【职工编号】不能为空，请填写！")	;
		return false;
	}
	var name =  $("#name").val();
	if($.trim(name)==""){
		$("#name").focus();
		fdp.utils.alertWarn("【姓名】不能为空，请填写！")	;
		return false;
	}
	var bmmc = $("#orgId").combo("getValue");
	if($.trim(bmmc)==""){
		$("#orgId").focus();
		fdp.utils.alertWarn("【所属部门】不能为空，请填写！")	;
		return false;
	}
	return true;
}
/**
 * 新增
 */
function okFunction(){
	//验证填写信息
	if(validateFormData()){
		var varUrl = '';
		if($("#dialogForm #id").val() == ''){
			varUrl = ctx+'/rygl/ryJbxx/insert';
		}else{
			varUrl = ctx+'/rygl/ryJbxx/update';
		}
			var formData = $("#dialogForm").serializeObject();
			
			$.post(varUrl,formData,function(data){
				if(data.success){
					$("#dialogForm #id").val(data.id);
					fdp.utils.alertInfo("操作成功！");
					/*layer.closeAll();*/
				}else{
					fdp.utils.alertError("操作失败，请联系系统 管理员！");
				}
			},"json");
	}
	
}
