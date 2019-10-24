<%@ tag language="java" pageEncoding="UTF-8" body-content="scriptless"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="onclick" type="java.lang.String" required="true" description="onclick"%>
<%@ attribute name="btnClass" type="java.lang.String" required="false" description="btnClass"%>
<c:if test="${not empty btnClass and btnClass!='' }">
<button class="layui-btn ${btnClass}" onclick="${onclick};return false;"><jsp:doBody></jsp:doBody></button>
</c:if>
<c:if test="${empty btnClass or btnClass=='' }">
<button class="layui-btn layui-btn-normal" onclick="${onclick};return false;"><jsp:doBody></jsp:doBody></button>
</c:if>
