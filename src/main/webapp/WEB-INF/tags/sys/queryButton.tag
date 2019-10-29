<%@ tag language="java" pageEncoding="UTF-8" body-content="scriptless"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="formId" type="java.lang.String" required="true" description="formId" rtexprvalue="true" %>
<%@ attribute name="queryMethod" type="java.lang.String" required="true" description="queryMethod"%>
<%@ attribute name="showMore" type="java.lang.Boolean" required="false" description="queryMethod"%>
<%@ attribute name="moreMethod" type="java.lang.String" required="false" description="queryMethod"%>
<div class="layui-btn-group">
	<button class="layui-btn layui-btn-normal" onclick="${queryMethod};return false;"><i class='layui-icon'>&#xe615;</i>查询</button>
	<button type="submit" class="layui-btn layui-btn-primary" onclick="$('#${formId}')[0].reset();${queryMethod};return false;"><i class='icon iconfont'>&#xe68b;</i>重置</button>
	<c:if test="${showMore}">
		<button class="layui-btn layui-btn-primary" onclick="${moreMethod};return false;"><i class='layui-icon'>&#xe636;</i>更多</button>
	</c:if>
</div>