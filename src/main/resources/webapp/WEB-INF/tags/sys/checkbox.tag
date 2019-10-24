<%@ tag language="java" pageEncoding="UTF-8" body-content="scriptless"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="id" type="java.lang.String" required="true" %>
<%@ attribute name="text" type="java.lang.String" required="true" %>
<%@ attribute name="checked" type="java.lang.Boolean" required="true" %>
<input type="checkbox" name="${id}" id="${id}"  ${checked?'checked':''} lay-skin="switch" lay-text="${text}" 
	value="1">