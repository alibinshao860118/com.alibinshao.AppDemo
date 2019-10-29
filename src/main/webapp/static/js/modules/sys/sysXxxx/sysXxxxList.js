var layedit ;
var index ;
layui.use('layedit', function(){
  layedit = layui.layedit;
  
  //构建一个默认的编辑器
  index = layedit.build('xxJs');
  
  //自定义工具栏
  layedit.build('LAY_demo2', {
    tool: ['face', 'link', 'unlink', '|', 'left', 'center', 'right']
    ,height: 100
  })
});
			
function resetData(){
	//TODO
	
}

/**
 * dialog确定按钮
 */
function okFunction(){
	var varUrl = '';
	if($("#dialogForm #id").val() == ''){
		varUrl = ctx+'/sys/sysXxxx/insert';
	}else{
		varUrl = ctx+'/sys/sysXxxx/update';
	}
	
	var formData = $("#dialogForm").serializeObject();
	var xxJs = layedit.getContent(index);
	formData.xxJs = xxJs;
	
	$.post(varUrl,formData,function(data){
		if(data.success){
			fdp.utils.alertInfo("操作成功！",function(){
				layer.closeAll();
			});
		}else{
			fdp.utils.alertError("操作失败,请联系系统管理员！");
		}
	},"json");

}
