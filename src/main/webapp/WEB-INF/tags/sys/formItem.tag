<%@ tag language="java" pageEncoding="UTF-8" body-content="scriptless"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="lable" type="java.lang.String" required="false" description="btnClass" rtexprvalue="true"%>
<%@ attribute name="lableStyle" type="java.lang.String" required="false" description="btnClass" rtexprvalue="true"%>
<%@ attribute name="itemStyle" type="java.lang.String" required="false" description="btnClass" rtexprvalue="true"%>
<%@ attribute name="isRequired" type="java.lang.Boolean" required="false" description="isRequired" rtexprvalue="true"%>

<c:if test="${not empty lable and lable!='' }">
	<c:if test="${not empty lableStyle and lableStyle!='' }">
		<span class="layui-form-label" style="${lableStyle}">${lable}<c:if test="${isRequired}"><b style="color: red;">*</b></c:if>：</span>
	</c:if>
	<c:if test="${empty lableStyle or lableStyle=='' }">
		<span class="layui-form-label" style="width:100px;">${lable}<c:if test="${isRequired}"><b style="color: red;">*</b></c:if>：</span>
	</c:if>
</c:if>
<div class="layui-input-inline" style="${itemStyle}">
<jsp:doBody></jsp:doBody>
</div>
