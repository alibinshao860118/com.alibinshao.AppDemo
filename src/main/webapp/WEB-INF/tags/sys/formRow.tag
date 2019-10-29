<%@ tag language="java" pageEncoding="UTF-8" body-content="scriptless"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="id" type="java.lang.String" required="false" description="id"%>
<%@ attribute name="style" type="java.lang.String" required="false" description="style"%>
<div class="layui-form-item" style="${style}" id="${id}">
	<jsp:doBody></jsp:doBody>
</div>
