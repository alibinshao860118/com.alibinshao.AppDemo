<%@ tag language="java" pageEncoding="UTF-8" body-content="scriptless"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="id" type="java.lang.String" required="true" %>
<%@ attribute name="inputStyle" type="java.lang.String" required="false" description="inputStyle"%>
<%@ attribute name="readOnly" type="java.lang.Boolean" required="false" description="readOnly"%>
<%@ attribute name="required" type="java.lang.Boolean" required="false" description="required"%>
<%@ attribute name="value" type="java.lang.String" required="false" description="required"%>
<c:if test="${not empty readOnly and readOnly!='' }">
<input type="text" id="${id}" name="${id}" autocomplete="off" value="${value}"
	style="background-color:#E3E3E3;${inputStyle}"   readonly="readonly" class="layui-input"
	lay-verify="${required?'required':''}" >
</c:if>
<c:if test="${empty readOnly or readOnly=='' }">
<input type="text" id="${id}" name="${id}" autocomplete="off" value="${value}"
	style="${inputStyle}" class="layui-input"
	lay-verify="${required?'required':''}" >
</c:if>