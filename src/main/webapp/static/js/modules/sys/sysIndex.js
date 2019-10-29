function openPwdWin(userId){
	layer.open({
		type : 1,
		closeBtn : 1,
		title : "修改用户密码",
		maxmin : true,
		area : [ '380px', '355px' ],
		content : $('#resetPwdWin'), //这里content是一个DOM
		btn : [ '确定', '取消' ],
		btn1 : function() {
			var formData = $("#resetPwdForm").serializeObject();
			if($.trim(formData.passwd)==""){
				fdp.utils.alertWarn("旧密码不能为空，请填写！");
				return false;
			}
			if($.trim(formData.newPasswd)==""){
				fdp.utils.alertWarn("新密码不能为空，请填写！");
				return false;
			}
			if($.trim(formData.newPassword2)==""){
				fdp.utils.alertWarn("确认密码不能为空，请填写！");
				return false;
			}
			if(formData.newPasswd!=formData.newPassword2){
				fdp.utils.alertWarn("新密码二次输入不一致，请确认！");
				return false;
			}
			
			//验证旧密码输入是否正确
			fdp.utils.confirm("确定要修改密码吗?", function(r) {
				if (r) {
					$.post(ctx+"/sys/sysUser/checkPassword",formData,function(data){
						if(data){
							$.post(ctx+"/sys/sysUser/resetPwd",formData,function(result){
								fdp.utils.alertInfo("操作成功！",function(){
									layer.closeAll();
								});
							});
						}else{
							fdp.utils.alertError("旧密码输入不正确，请修改！");
						}
					});
				}
			});
			
		}
	});
	
	$.post(ctx+"/sys/sysUser/get",{id:userId},function(data){
		$('#resetPwdForm').form('load',data);
		$('#resetPwdForm #passwd').val(null);
	});
}
    
function openUserInfoWin(userId){
	layer.open({
		type : 1,
		closeBtn : 1,
		title : "查看用户信息",
		maxmin : true,
		area : [ '660px', '295px' ],
		content : $('#userInfoWin'), //这里content是一个DOM
		btn : [  '取消' ]
	});
	
	$.post(ctx+"/sys/sysUser/get",{id:userId},function(data){
		$('#userInfoForm').form('load',data);
	});
}
    
layui.use('form', function(){
	var form = layui.form();
	  
});