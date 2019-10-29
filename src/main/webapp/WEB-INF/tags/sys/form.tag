<%@ tag language="java" pageEncoding="UTF-8" body-content="scriptless"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="id" type="java.lang.String" required="true" description="id" rtexprvalue="true" %>
<%@ attribute name="formClass" type="java.lang.String" required="false" description="true" rtexprvalue="true" %>
<form id="${id}" class="layui-form ${formClass}">
	 <jsp:doBody></jsp:doBody>
</form>
<script>
	layui.use(['form'], function(){
		  var form = layui.form();
		  
		  form.on("reset",function(){
			  alert();
		  });
	  
	});
</script>
