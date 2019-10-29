$(document).ready(function () {
	$('#tt').datagrid({ 
	    url:ctx+'/rygl/ryQtzl/query', 
	    queryParams : $("#queryForm").serializeObject(),
	    idField:'id', 
	    rownumbers:true,
		pagination:true
	});
	//附件上传
/*	$("#dialogForm").form({    
		  url:ctx+'/rygl/ryQtzl/save',   
		  onSubmit:function(){
			var isValid = $(this).form("validate");
			if(isValid){
				//验证
				var formData = $("#dialogForm").serializeObject();
				//表单验证
				if($.trim(formData.zlmc)==""){
					fdp.utils.alertWarn("【资料名称】不能为空，请填写！");
					return false;
				}
				if($.trim(formData.zlsm)==""){
					fdp.utils.alertWarn("【资料说明】不能为空，请填写！");
					return false;
				}
			}
			return true;
		  },
	      success:function(data){    
	    	  if(data==null || data ==''){
	    		  layer.alert("提交失败，请按要求填写信息，特别需要注意附件累计大小不允许通过20M！", {
					  icon: 2,
					  skin: 'layer-ext-moon' //该皮肤由layer.seaning.com友情扩展。关于皮肤的扩展规则，去这里查阅
					})	;
	    		  return false;
	    	  }
	    	  
	    	  var data = eval("("+data+")");
	    	  if(data.success){
	    		  fdp.utils.alertInfo("操作成功！",function(){
	  				layer.closeAll();
	  				query();
	  				});										
	    	  }else{
				layer.alert(data.msg, {
					  icon: 2,
					  skin: 'layer-ext-moon' 
				})		    		  
	    	  }
	     }    
	});*/
	
});

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
		title : "新增",
		maxmin : true,
		area : [ '650px', '250px' ],
		content : $('#dialog'), //这里content是一个DOM
		btn : [ '确定', '取消' ],
		btn1 : function() {
			okFunction();
		}
	});
}

function fileChangeFj(){
	var value = $("#file").filebox('getValue');
	if(value!=null && value!=""){
		var name = value.replace(/.{0,}\\/, "");
		var outer = "<li></li>"
		var str = "<a href='javascript:void(0);' class='fjName'>"+name+"</a>";
		str += "<a href='javascript:void(0);' class='delete'><img src=\"${ctxStatic}/images/dot02.jpg\" /></a>";
		
		var $outer = $(outer);
		var $td = $("#fileTd"); 
		
		$td.attr("id","")
		$td.css("display", "none");
		jQuery($td).appendTo($outer);
		
		jQuery(str).appendTo($outer);
		
		$outer.appendTo(".info_list");
		
		var tdObj = $("<td></td>");
		tdObj.attr("id","fileTd")
		tdObj.attr("colspan","2");
		
		var inputObj = $("<input class='easyui-filebox' id='file' name='sourceFile' style='width:250px' data-options='buttonText:\"浏览\",multiple:false,onChange:fileChangeFj' />");
		$(inputObj).appendTo(tdObj);
		
		$(tdObj).appendTo("#fileTr");
		$.parser.parse('#fileTr');
	}
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
		title : "修改",
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
			$.post(ctx+"/rygl/ryQtzl/delete", {ids : ids.join('&') }, function(result) {
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
		varUrl = ctx+'/rygl/ryQtzl/insert';
	}else{
		varUrl = ctx+'/rygl/ryQtzl/update';
	}
	
	var formData = $("#dialogForm").serializeObject();
	
	//表单验证
	if($.trim(formData.zlmc)==""){
		fdp.utils.alertWarn("【资料名称】不能为空，请填写！");
		return false;
	}
	if($.trim(formData.zlsm)==""){
		fdp.utils.alertWarn("【资料说明】不能为空，请填写！");
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
