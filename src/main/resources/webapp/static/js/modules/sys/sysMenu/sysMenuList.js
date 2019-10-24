$(document).ready(function () {
	//菜单树控件
	$('#tt').treegrid({ 
	    url:ctx+'/sys/sysMenu/getMenuListByParentId', 
	    idField:'id', 
	    treeField:'name',
	    animate:true,
	    rownumbers:true
	});
	
});

/**
 * 格式化visible字段
 */
function formatVisible(value){
    if (value=="1"){
        return "<span class='layui-icon'>&#xe618;</span>";
    } else if(value == '0'){
    	return "<span class='layui-icon'>&#x1006;</span>";
    }else{
    	return "";
    }
}
/**
 * 格式化图标字段
 */
function formatIocn(value){
	if (value!=null && value!=''){
		return "<span class='iconfont'>"+ value +"</span>";
	} else{
		return "";
	}
}

/**
 * 格式化menuType字段
 */
function formatMenuType(value){
    if (value=="1"){
        return "菜单";
    } else if(value=="2") {
    	return "按钮";
    } else {
    	return "";
    }
}

/**
 * 树表格每行添加操作栏
 */
function formatOperation(value,row,index){
	if(value=='0'){
		return "<button class='layui-btn layui-btn-normal layui-btn-mini' title='添加下级' onclick='add(\""+value+"\")'>添加下级</button>"
					+"<button class='layui-btn layui-btn-disabled layui-btn-mini'>修改</button>"
					+"<button class='layui-btn layui-btn-disabled layui-btn-mini'>删除</button>";
	}else {
		if(row.menuType == "2"){
			return  "<button class='layui-btn layui-btn-disabled layui-btn-mini' title='添加下级' >添加下级</button>"
				   +"<button class='layui-btn layui-btn-normal layui-btn-mini' onclick='edit(\""+value+"\")'>修改</button>"
				   +"<button class='layui-btn layui-btn-danger layui-btn-mini' onclick='deleteMenu(\""+value+"\")'>删除</button>";
		}else{
			return  "<button class='layui-btn layui-btn-normal layui-btn-mini' title='添加下级' onclick='add(\""+value+"\")'>添加下级</button>"
				   +"<button class='layui-btn layui-btn-normal layui-btn-mini' onclick='edit(\""+value+"\")'>修改</button>"
				   +"<button class='layui-btn layui-btn-danger layui-btn-mini' onclick='deleteMenu(\""+value+"\")'>删除</button>" ;
		}
	}
}

/**
 * 添加下级菜单按钮
 */
function add(menuId){
	$("#dialog #dialogForm").form('reset');
	$("#dialog #dialogForm #parentId").val(menuId);
	$("#dialog #dialogForm #currentId").val(null);
	
	var selectM = $("#tt").treegrid('find',menuId);
	$("#dialog #dialogForm #higher").val(selectM.name);
	
	layer.open({
		type : 1,
		closeBtn : 1,
		title : "新增菜单",
		maxmin : true,
		area : [ '500px', '460px' ],
		content : $('#dialog'), //这里content是一个DOM
		btn : [ '确定', '取消' ],
		btn1 : function() {
			okFunction();
		}
	});
	
}

/**
 * dialog确定按钮
 */
function okFunction(){
	var varUrl = '';
	if($("#dialogForm #currentId").val() == '' ){
		varUrl = ctx+'/sys/sysMenu/insert';
	}else {
		varUrl = ctx+'/sys/sysMenu/update';
	}
	
	var formData = $("#dialogForm").serializeObject();
	if(formData.visible==null){
		formData.visible = "0";
	}
	if($.trim(formData.name)==""){
		fdp.utils.alertWarn("菜单名称不能为空，请填写！");
		return false;
	}
	
	$.post(varUrl,formData,function(data){
		if(data.success){
			fdp.utils.alertInfo("操作成功！",function(){
				layer.closeAll();
				
				var parentId = $("#dialog #dialogForm #parentId").val();
				if(parentId =="0"){
					$("#tt").treegrid('reload',parentId);
				}else{
					var parent = $("#tt").treegrid('getParent',parentId);
					$("#tt").treegrid('reload',parent.id);
				}
			});
		}else{
			fdp.utils.alertError("操作失败,请联系系统管理员！");
		}
	},"json");
	
}

///===================================
/**
 * 修改按钮
 */
function edit(menuId){
	$("#dialog #dialogForm").form('reset');
	var selectM = $("#tt").treegrid('find',menuId);
	var parent = $("#tt").treegrid('getParent',selectM.id);
	$("#dialog #dialogForm #higher").val(parent.name);
	
	$.extend(selectM, {parentId: parent.id, currentId:menuId});
	
	$('#dialog #dialogForm').form('load',selectM);

	var selectMType = document.getElementsByName("menuType");
	if(selectM.menuType == "1"){         	
		selectMType[0].checked = true;
	}else{
		selectMType[1].checked = true;
	}
	
/*	if(selectM.visible == "1"){	
		$("#dialog #dialogForm #visible").attr('checked',"checked");
	}else{
		$("#dialog #dialogForm #visible").attr('checked',false);
	}*/
	
	layer.open({
		type : 1,
		closeBtn : 1,
		title : "修改菜单",
		maxmin : true,
		area : [ '500px', '460px' ],
		content : $('#dialog'), //这里content是一个DOM
		btn : [ '确定', '取消' ],
		btn1 : function() {
			okFunction();
		}
	});
}

//========================================================
/**
 * 删除按钮
 */
function deleteMenu(menuId){
	var child = $('#tt').treegrid('getChildren',menuId);
	var row = $('#tt').treegrid('find',menuId);
	if(row.state != 'open' || child.length >0 ){
		fdp.utils.alertWarn("包含子菜单，不允许删除！");
	}else{
		fdp.utils.confirm("确定要删除选中的菜单吗？", function(r){	
			 if(r){
					$.post(ctx+"/sys/sysMenu/delete",{id:menuId},function(data){
						if(data.success){
							fdp.utils.alertInfo("操作成功！", function(){
								var parent = $("#tt").treegrid('getParent',menuId);
								if(parent.id == "0"){
									$("#tt").treegrid('reload',parent.id);
								}else{
									var grandP = $("#tt").treegrid('getParent',parent.id);
									$("#tt").treegrid('reload',grandP.id);
								}
								layer.closeAll();
							});
							
						}else{
							fdp.utils.alertError("操作失败,请联系系统管理员！");
						}
					},"json");
			 }
		});
	}
}
//==============================

/**
 * 修改按钮
 */
function openIconWin(){
	layer.open({
		type : 1,
		closeBtn : 1,
		title : "选择图标",
		maxmin : false,
		area : [ '650px', '360px' ],
		content : $('#iconWin'), //这里content是一个DOM
		btn : ['取消' ]
	});
}

function setIconTxt(value){
	$("#dialogForm #imageUrl").textbox("setText",value);
	$("#dialogForm #imageUrl").textbox("setValue",value);
	
	layer.close(layer.index);
}