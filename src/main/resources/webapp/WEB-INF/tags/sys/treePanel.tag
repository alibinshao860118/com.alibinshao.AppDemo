<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="onClick" type="java.lang.String" required="true" description="点击事件"%>
<%@ attribute name="checkEnable" type="java.lang.Boolean" required="false" description="id"%>
<%@ attribute name="style" type="java.lang.String" required="false"  description="style"%>
<%@ attribute name="type" type="java.lang.String" required="true"  description="type"%>
<%@ attribute name="title" type="java.lang.String" required="true" description="title"%>
<%@ attribute name="id" type="java.lang.String" required="true" description="id"%>
<%@ attribute name="panelHeight" type="java.lang.String" required="true" description="panelHeight"%>
<%@ attribute name="chkStyle" type="java.lang.String" required="false" description="chkStyle"%>
<%@ attribute name="async" type="java.lang.Boolean" required="true" description="async"%>
<%@ attribute name="value" type="java.lang.String" required="false" description="value"%>

<div class="layui-collapse"  style="height:{panelHeight}px;${style};">
  <div class="layui-colla-item">
    <h2 class="layui-colla-title"><span id="layui-colla-title_${id}">${title}</span></h2>
    <div style="overflow: auto;width:230px;"  
    	class="layui-colla-content layui-show">
		<ul id="${id}_treex" class="ztree" style="height:${panelHeight-145}px;">
		</ul>
		<jsp:doBody></jsp:doBody>
	</div>
  </div>
</div>

<script>
$(function(){
	var f = null;
	if("${onClick}"!="" && "${onClick}"!="null"){ 
		f = eval("(${onClick})");
	}
	
	var treeSetting = {
		check: {
			<c:if test="${not empty chkStyle}">
			chkStyle : '${chkStyle}' ,
			radioType : "all",
			</c:if>
			<c:if test="${empty chkStyle}">
			chkStyle : "checkbox" ,
			</c:if>
            enable: ${checkEnable?true:false}
        },
		data: {
			simpleData: {
				enable: true
			}
		},
		<c:if test="${async}">
		async:{
			enable:true,
			url:ctx+"/common/tree/loadChildren/${type}",
			autoParam:['id']
		},
		</c:if>
		callback:{
			onClick : f,
			onNodeCreated : function(e,treeId,treeNode){
				if("${value}"!='' && treeNode.id == "${value}"){
					$.fn.zTree.getZTreeObj(treeId).selectNode(treeNode);
				}
			},
			beforeClick : function(treeId,treeNode){
				if(treeNode.otherParam.canSelect=='true'){
					return true;
				}
				return false;
			}
		}
	};
	<c:if test="${async}">
	$.fn.zTree.init($("#${id}_treex"), treeSetting);
	</c:if>
	<c:if test="${!async}">
		$.post(ctx+"/common/tree/loadChildren/${type}",function(nodes){
			var zTreeObj = $.fn.zTree.init($("#${id}_treex"), treeSetting, nodes);
		});
	</c:if>
	
	
});
function updateTitle_${id}(title){
	$("#layui-colla-title_${id}").text(title);
}

function reload_${id}(){
	var treeObj = $.fn.zTree.getZTreeObj("${id}_treex");
	treeObj.reAsyncChildNodes(null, "refresh");
}

function reload4SelectedNodes_${id}(){
	var treeObj = $.fn.zTree.getZTreeObj("${id}_treex");
	var nodes = treeObj.getSelectedNodes();
	if (nodes.length>0) {
		treeObj.reAsyncChildNodes(nodes[0], "refresh");
	}
}

layui.use(['element'], function(){
	var element = layui.element();
});
</script>