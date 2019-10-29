<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<!DOCTYPE html> 
<html>
	<head>
		<title>
			<sitemesh:title/>
		</title>
		<%@include file="/WEB-INF/views/include/head.jsp" %>		
		<sitemesh:head/>
	</head>
	<body class="default" >
		<div style="background:#FFFFFF;">
			<sitemesh:body/>
		</div>
	</body>
</html>
<script>
	/**
	 * 工具方法
	 */
	$.fn.serializeObject = function(){
		var o= {};
		var a = this.serializeArray();
		$.each(a, function(){
			if(o[this.name]){
				if(!o[this.name].push){
					o[this.name] = [o[this.name]];
				}
				o[this.name].push(this.value || '');
			}else{
				o[this.name] = this.value || '';
			}
		
		});
		return o;
	};
	layui.use('element', function(){
	  var element = layui.element(); //导航的hover效果、二级菜单等功能，需要依赖element模块
	  
	});
</script>