//树控件
var zTreeObj;
//选择环节所对应的部门
function showBm(value){
	 $("#tree").show();
	 if(value=='1'){//部门内审核
		 $.get(ctx+"/zp/initBjDeptTree.do",{bmid:bmid},
					function(data){
						if(data.length==0){
							return;
						}
						$.fn.zTree.init($("#tree"), setting, data);
			});
	 }else if(value=='2'){
		 $.get(ctx+"/zp/initDeptTree.do",{id:''},
					function(data){
						if(data.length==0){
							return;
						}
						$.fn.zTree.init($("#tree"), setting, data);
				});
	 }else{
		 $("#tree").hide();
	 }
}

//点击选择联系checkBox事件
function cylxr_chckbox_click(t){
	if(t.checked==true){
		if(jc_yxrylb(t.value)==false){
			var template = '<A title="'+t.value+'">'+t.title+'&nbsp;</A>';
			var td = $('#yxrylb_td');
			/* var h = td.html(); */
			td.html(/* h+ */template);
			//添加到办理人
			$('#blr').val(t.id);
		}else{
			/* del_yxrylb(t.value); */
			alert('['+t.title+']已经选择！');
		}
	}
	/* count_yxrylb(); */
}
//检查人员是否已经选择
function jc_yxrylb(id){
	var n = $('#yxrylb_td A');
	for(var i=0;i<n.length;i++){
		if(n[i].title==id){
			return true;
		}
	}
	return false;
}

var setting = {
		data: {
			simpleData: {
				enable: true
			}
		},
		async:{
			enable:true,
			url:ctx+'/zp/initDeptTree.do',
			autoParam:['id']
		},
		callback:{
			onClick:function(a,b,node){
					var t={id:node.id,title:node.name,value:node.id,checked:node.isLastNode};
					/* if(t.checked==true&&jc_yxrylb(t.id)==true){
						alert('['+t.title+']已经选择！');
						node.checked=false;
						return false ;
					} */
					cylxr_chckbox_click(t);
			}
		}
		
};