$(function(){
	//机构树控件
	$('#tt').treegrid({ 
	    url : ctx+'/sys/sysOrg/getOrgListByParentId', 
	    idField:'id', 
	    treeField:'orgName',
	    rownumbers:true,
	    animate:true
	});
	
});

/**
 * 格式化status字段
 */
function formatSatus(value){
    if (value=="1"){
        return "<span class='layui-icon'>&#xe618;</span>";
    } else {
    	return "<span class='layui-icon'>&#x1006;</span>";
    }
}

/**
 * 格式化status字段
 */
function formatOrgType(value){
    if (value=="1"){
        return "部门";
    } else if (value=="2"){
    	return "岗位";
    }
    return "";
}

/**
 * 树表格每行添加操作栏
 */
function formatOperation(value,row,index){
	if(value=="0"){
		return "<button class='layui-btn layui-btn-normal layui-btn-disabled layui-btn-mini'  )'>添加下级</button>"
		+"<button class='layui-btn layui-btn-normal layui-btn-disabled layui-btn-mini' >修改</button>"
		+"<button class='layui-btn layui-btn-danger layui-btn-disabled layui-btn-mini' )'>删除</button>"
		+"<button class='layui-btn layui-btn-normal layui-btn-disabled layui-btn-mini' )'>设置组织人员</button>";
	}else if(value.length==1){
		return "<button class='layui-btn layui-btn-normal layui-btn-mini'  onclick='add(\""+value+"\")'>添加下级</button>"
			+"<button class='layui-btn layui-btn-normal layui-btn-disabled layui-btn-mini' >修改</button>"
			+"<button class='layui-btn layui-btn-danger layui-btn-disabled layui-btn-mini' >删除</button>"
			+"<button class='layui-btn layui-btn-normal layui-btn-disabled layui-btn-mini' )'>设置组织人员</button>";
	}else{
		return "<button class='layui-btn layui-btn-normal layui-btn-mini'  onclick='add(\""+value+"\")'>添加下级</button>"
			+"<button class='layui-btn layui-btn-normal layui-btn-mini' onclick='edit(\""+value+"\")'>修改</button>"
			+"<button class='layui-btn layui-btn-danger layui-btn-mini' onclick='delete_(\""+value+"\")'>删除</button>"
			+"<button class='layui-btn layui-btn-normal layui-btn-mini' )' onclick='viewRy(\""+value+"\")'>设置组织人员</button>";
	}
}

//=========================================================
/**
 * 查看组织人员
 */
function viewRy(id){
	
	var row = $("#tt").treegrid('find',id);
	$("#zzz #orgId").val(id);
	
	layer.open({
		type : 1,
		closeBtn : 1,
		title : "设置组织人员",
		maxmin : true,
		area : [ '660px', '465px' ],
		content : $('#zzjgRy'), //这里content是一个DOM
		btn : [ '取消' ]
	});
	
	findExistOrgUser();
}

function findExistOrgUser(){
	var orgId = $("#zzz #orgId").val();
	
	//机构树控件
	$('#ttt').datagrid({ 
	    url : ctx+'/rygl/ryJbxx/findExistOrgUser', 
	    queryParams : {orgId:orgId},
	    idField:'id', 
	    rownumbers:true,
	    animate:true
	});
}


function findNotExistOrgUser(){
	var orgId = $("#zzz #orgId").val();
	
	//机构树控件
	$('#tttt').datagrid({ 
	    url : ctx+'/rygl/ryJbxx/findNotExistOrgUser', 
	    queryParams : {orgId:orgId},
	    idField:'id', 
	    rownumbers:true,
	    animate:true
	});
}

function addOrgRy(){
	var rows = $("#tttt").datagrid('getChecked');
	if (rows.length == 0) {
		fdp.utils.alertWarn("请选取一条数据进行操作！");
		return;
	}
	
	var orgId = $("#zzz #orgId").val();
	for(var i=0;i<rows.length;i++) {
		rows[i].orgId = orgId;
	}
	
	fdp.utils.confirm("确定要添加选中的人员吗?", function(r) {
		if (r) {
			$.ajax({
		        url:ctx+"/rygl/ryJbxx/insertOrgRy",
		        data: JSON.stringify(rows) ,
		        dataType:'json',
		        type:'post',
				 dataType:"json",  
				 contentType:"application/json",          
		        success:function(data){
		        	if(data.success){
		    			fdp.utils.alertInfo("操作成功！",function(index){
		    				layer.close(index);
		    				$('#ttt').datagrid("load",{orgId:orgId});
							$('#tttt').datagrid("load",{orgId:orgId});
							$("#tttt").datagrid('clearSelections');
		    			});
		    		}else{
		    			fdp.utils.alertError("操作失败,请联系系统管理员！");
		    		}
		        }

		    })
		}
	});		
}

function removeOrgRy(){
	var rows = $("#ttt").datagrid('getSelections');
	if (rows.length == 0) {
		fdp.utils.alertWarn("请选取一条数据进行操作！");
		return;
	}
	
	var ids = [];
	for(var i=0;i<rows.length;i++) {
		ids.push(rows[i].id);
	}
	var orgId = $("#zzz #orgId").val();
	
	fdp.utils.confirm("确定要移除选中的人员吗?", function(r) {
		if (r) {
			$.post(ctx+"/rygl/ryJbxx/deleteOrgRy", {ids : ids.join('&') }, function(result) {
				if (result.success) {
					fdp.utils.alertInfo("操作成功！",function(index){
						layer.close(index);
						$('#ttt').datagrid("load",{orgId:orgId});
						$('#tttt').datagrid("load",{orgId:orgId});
						$("#ttt").datagrid('clearSelections');
					});
				} else {
					fdp.utils.alertError("操作失败,请联系系统管理员！");
				}
			});
		}
	});		
}

//=========================================================

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

/**
 * 添加下级机构按钮
 */
function add(id){
	$("#tjjg #addForm")[0].reset();
	
	 var row = $("#tt").treegrid('find',id);
	
	$("#tjjg #addForm #parentOrgName").val(row.orgName);
	$("#tjjg #addForm #parentOrgCode").val(row.orgCode);
	$("#tjjg #addForm #parentOrgId").val(row.id);
	$("#tjjg #addForm #fullOrgIds").val(row.fullOrgIds);
	$("#tjjg #addForm #fullOrgCodes").val(row.fullOrgCodes);
	$("#tjjg #addForm #fullOrgNames").val(row.fullOrgNames);
	$("#tjjg #addForm #id").val(null);
	
	layer.open({
		type : 1,
		closeBtn : 1,
		title : "新增组织机构",
		maxmin : true,
		area : [ '660px', '405px' ],
		content : $('#tjjg'), //这里content是一个DOM
		btn : [ '确定', '取消' ],
		btn1 : function() {
			okFunction();
		}
	});
}

/**
 * 修改按钮
 */
 function edit(orgId){
	 $("#tjjg #addForm")[0].reset();
	 
	 var row = $("#tt").treegrid('find',orgId);
	 $("#tjjg #addForm").form('load',row);
	 $("#addForm #oldOrgCode").val(row.orgCode);
	 
	 layer.open({
		type : 1,
		closeBtn : 1,
		title : "修改组织机构",
		maxmin : true,
		area : [ '660px', '405px' ],
		content : $('#tjjg'), //这里content是一个DOM
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
	if($("#addForm #id").val() == ''){
		varUrl = ctx+'/sys/sysOrg/insert';
	}else{
		varUrl = ctx+'/sys/sysOrg/update';
	}


	var formData = $("#addForm").serializeObject();
	if(formData.enableFlag==null){
		formData.enableFlag = "0";
	}
	if($.trim(formData.orgCode)==""){
		fdp.utils.alertWarn("机构编码不能为空，请填写！");
		return false;
	}
	if($.trim(formData.orgName)==""){
		fdp.utils.alertWarn("机构名称不能为空，请填写！");
		return false;
	}
	if($.trim(formData.showOrder)==""){
		fdp.utils.alertWarn("排列顺序不能为空，请填写！");
		return false;
	}
	
	//需要验证编码是否重复
	if($.trim(formData.orgCode)!=$.trim(formData.oldOrgCode)){
		$.post(ctx+"/sys/sysOrg/checkExsit4OrgCode",formData,function(data){
			if(data){
				fdp.utils.alertWarn("机构编码已经存在，请修改！");
			}else{
				saveData(varUrl,formData)
			}
		});
	}else{
		saveData(varUrl,formData);
	}
}

function saveData(varUrl,formData){
	fdp.utils.confirm("确定要提交数据吗?", function(r) {
		if (r) {
			$.post(varUrl,formData,function(data){
				if(data.success){
					fdp.utils.alertInfo("操作成功！",function(){
						layer.closeAll();
						
						var row = $('#tt').treegrid('find',formData.parentOrgId);
						if(row.state == 'open' && row.children.length == 0 ){
							var parent = $("#tt").treegrid('getParent',formData.parentOrgId);
							$("#tt").treegrid('reload',parent.id);
						}else{
							$("#tt").treegrid('reload',formData.parentOrgId);
						}
						
						/*if(formData.id!=null && formData.id!=''){
							var row = $('#tt').treegrid('find',formData.id);
							row
							$("#tt").treegrid('reload',formData.id);
						}*/
						
					});
				}else{
					fdp.utils.alertError("操作失败,请联系系统管理员！");
				}
			},"json");
		}
	});
}

/**
 * 删除按钮
 */
function delete_(orgId){
	var child = $('#tt').treegrid('getChildren',orgId);
	var row = $('#tt').treegrid('find',orgId);
	if(row.state != 'open' || child.length >0 ){
		fdp.utils.alertWarn("包含子机构，不允许删除！");
	}else{
		fdp.utils.confirm("确定要删除选中的数据吗?", function(r) {
			if (r) {
				$.post(ctx+"/sys/sysOrg/delete",{id:orgId},function(data){
					if(data.success){
						fdp.utils.alertInfo("删除机构成功！");
						
						var parent = $("#tt").treegrid('getParent',orgId);
						$("#tt").treegrid('reload',parent.id);
					}else{
						fdp.utils.alertError("操作失败，请联系系统管理员！");
					}
				});
			 }
		});
	}
}