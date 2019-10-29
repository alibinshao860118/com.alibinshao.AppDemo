$(document).ready(function () {
	
});

/**
 * 打开简历投递情况查询窗口
 */
function openQueryWin(){
	$("#dialog #dialogForm")[0].reset();
	$("#dialog #dialogForm #id").val(null);
	
	layer.open({
		type : 1,
		closeBtn : 1,
		title : "查询简历投递情况",
		maxmin : false,
		area : [ '360px', '200px' ],
		content : $('#dialog'), //这里content是一个DOM
		btn : [ '查询', '取消' ],
		btn1 : function() {
			var formData = $("#dialog #dialogForm").serializeObject();
			if($.trim(formData.username)==null || $.trim(formData.username)==''){
				//layer.alert("姓名不能为空，请填写！",{icon:2});
				layer.tips("姓名不能为空","#dialogForm #username", {
					  tips: [3, '#FF5722'],
					  time: 2000
				});
				$("#dialogForm #username").focus();
				return false;
			}
			if($.trim(formData.sfzhm)==null || $.trim(formData.sfzhm)==''){
				//layer.alert("身份证号码不能为空，请填写！",{icon:2});
				layer.tips("身份证号码不能为空","#dialogForm #sfzhm", {
					  tips: [3, '#FF5722'],
					  time: 2000
				});
				$("#dialogForm #sfzhm").focus();
				return false;
			}
			
			//验证
			$.post(ctx+"/zp/zpZpjh/checkSfzhm",formData,function(data){
				window.location.reload();
			},"json");
			
		}
	});
}

/**
 * 投递简历前验证身份证号是否之前已有投递
 */
function jianlitj(id){
	var formData = $("#dialog #dialogForm").serializeObject();
	//验证
	$.post(ctx+"/zp/zpZpjh/checkStop",formData,function(data){
		if(data.isExsits){
			layer.alert(data.msg,{icon:2});
		}else{
			$("#dialog #dialogForm")[0].reset();
			layer.open({
				type : 1,
				closeBtn : 1,
				title : "投递简历前录入身份信息",
				maxmin : false,
				area : [ '360px', '200px' ],
				content : $('#dialog'), //这里content是一个DOM
				btn : [ '确定', '取消' ],
				btn1 : function() {
					var formData = $("#dialog #dialogForm").serializeObject();
					if($.trim(formData.username)==null || $.trim(formData.username)==''){
						//layer.alert("姓名不能为空，请填写！",{icon:2});
						layer.tips("姓名不能为空","#dialogForm #username", {
							  tips: [3, '#FF5722'],
							  time: 2000
						});
						$("#dialogForm #username").focus();
						return false;
					}
					if($.trim(formData.sfzhm)==null || $.trim(formData.sfzhm)==''){
						//layer.alert("身份证号码不能为空，请填写！",{icon:2});
						layer.tips("身份证号码不能为空","#dialogForm #sfzhm", {
							  tips: [3, '#FF5722'],
							  time: 2000
						});
						$("#dialogForm #sfzhm").focus();
						return false;
					}
					
					//验证
					$.post(ctx+"/zp/zpZpjh/checkSfzhm",formData,function(data){
						if(data.isExsits){
							layer.alert(data.msg,{icon:2},function(){
								window.location.reload();
							});
						}else{
							location.href = ctx+"/zpjlxq/jianlitjList?id="+id;
						}
					},"json");
				}
			});
		}
	},"json");
}



function updateJianli(id){
	var formData = $("#dialog #dialogForm").serializeObject();
	//验证
	$.post(ctx+"/zp/zpZpjh/checkStop",formData,function(data){
		if(data.isExsits){
			layer.alert(data.msg,{icon:2});
		}else{
			location.href = ctx+"/zpjlxq/jianlitjList?id="+id;
		}
	});
	
}

function clearSessionData(){
	//验证
	$.post(ctx+"/zp/zpZpjh/clearSessionData",function(data){
		window.location.reload();
	},"json");
}