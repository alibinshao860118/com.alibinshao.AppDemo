<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
	<head>
		<meta name="decorator" content="default" />
	</head>
	<body>
		<sys:form id="dialogForm">
			<input type="hidden" id="id" name="id" value="${sysXxxx.xxJs}"/>
			<textarea class="layui-textarea" id="xxJs" style="display: none">${sysXxxx.xxJs}</textarea>
		</sys:form>
		<div class="site-demo-button" style="margin-top: 10px;">
			<sys:button onclick="okFunction();">保存</sys:button>
			<sys:button onclick="resetData();">重置</sys:button>
		</div>
		<script type="text/javascript" src="${ctxStatic}/js/modules/sys/sysXxxx/sysXxxxList.js"></script>
	</body>
</html>