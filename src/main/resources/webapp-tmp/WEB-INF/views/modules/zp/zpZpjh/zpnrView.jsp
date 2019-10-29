<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>招聘</title>
		<link href="${ctxStatic}/css/comon.css" rel="stylesheet" type="text/css" />
		<link href="${ctxStatic}/css/index.css" rel="stylesheet" type="text/css" />
		<link href="${ctxStatic}/css/font.css" rel="stylesheet" type="text/css" />
		<link href="${ctxStatic}/css/tab_css.css" rel="stylesheet" type="text/css" />
		<link href="${ctxStatic}/layui/css/layui.css" rel="stylesheet" type="text/css">
		
		<SCRIPT src="${ctxStatic}/easyui/jquery.min.js"></SCRIPT>
		<script src="${ctxStatic}/layer/layer.js"></script>
		<script src="${ctxStatic}/layui/layui.js"></script>
		<script src="${ctxStatic}/js/fdp.js"></script>
		<script src="${ctxStatic}/js/fdp-ui.js"></script>
		<script type="text/javascript">
			var ctx = '${ctx}';
		</script>
		<script src="${ctxStatic}/js/modules/zp/zpZpjh/zpnrView.js"></script>
	</head>

<body style="padding: 10px;">

<div style="background:#FFFFFF;padding: 10px; ">
	<!-- 头部说明区 -->
	<div class="TableBox" >
		<div>
			<center style="font-size: 23px;">${zpjh.jhBt}</center>
		</div>
		<div id="xxjs" style="font-size: 18px;margin-top: 10px;">
		</div>
		<script>
			var html = HtmlUtil.htmlDecodeByRegExp("${xxxx.xxJs}");
			$("#xxjs").html(html);
			$("#xxjs").find("p").css("font-size","18px");
		</script>
	</div>
	
	<!-- 主体数据区 -->
	<div class="TableBox">
		<div class="Tableh2">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="160px"><strong>招聘岗位需求</strong></td>
					<td align="left">
						<c:choose>
							<c:when test="${empty zpjlxq}">
								【<a class="layui-btn layui-btn-radius layui-btn-normal layui-btn-mini"href="javascript:void(0)" 
									onclick="openQueryWin()">输入身份证号</a>查询简历是否投递成功】
							</c:when>
							<c:otherwise>
								<c:if test="${not empty zpjlxq.ssbm}">
								【${zpjlxq.username}，您已应聘岗位：<a href="${ctx}/zpjlxq/toJlView?id=${zpjlxq.id}" style="color: blue;font-style: oblique;text-decoration: underline;">${zpjlxq.ssbm}${zpjlxq.rpzhiwei}</a>。<a class="layui-btn layui-btn-radius layui-btn-warn layui-btn-mini"href="javascript:void(0)" 
									onclick="clearSessionData()">安全退出</a>】
								</c:if>
								<c:if test="${empty zpjlxq.ssbm}">
								【${zpjlxq.username}，您当前没有应聘任何岗位。<a class="layui-btn layui-btn-radius layui-btn-warn layui-btn-mini"href="javascript:void(0)" 
									onclick="clearSessionData()">安全退出</a>】
								</c:if>
							</c:otherwise>
						</c:choose>
						
					</td>
				</tr>
			</table>
			<form id="sfzhmForm">
				<input id="zpjhid" name="zpjhid" type="hidden" value="${zpjh.id}" />
				<input id="username" name="username" type="hidden" value="${zpjlxq.username}" />
				<input id="sfzhm" name="sfzhm" type="hidden" value="${zpjlxq.sfzhm}"/>
			</form>
		</div>

		<div class="Table06">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" id="dataTable">
				<tr>
					<th style="text-align: center" width="10px">序号</th>
					<th align="center"  width="12%">部门</th>
					<th align="center">岗位</th>
					<th align="center" >招聘人数</th>
					<th align="center" width="25%">专业要求</th>
					<th align="center">学历学位要求</th>
					<th align="center" width="10%">其他要求</th>
					<th align="center">备注</th>
					<th align="center" width="55px">操作</th>
				</tr>
				<c:forEach var="item" items="${zpxqList}" varStatus="i">
					<tr id="dataTr1">
						<td align="center" >${i.count}</td>
						<td align="left" style="line-height: 20px;">${item.zpbmMc}</td>
						<td align="left" style="line-height: 20px;">${item.zpGw}</td>
						<td align="center" style="line-height: 20px;">${item.zpRs}</td>
						<td align="left" style="line-height: 20px;">${item.zyYq}</td>
						<td align="left" style="line-height: 20px;">${item.xlYq}</td>
						<td align="left" style="line-height: 20px;">${item.qtYq}</td>
						<td align="left" style="line-height: 20px;">${item.remarks}</td>
						<td align="center"><a class="btn1 btn_01" href="javascript:void(0)" 
							onclick="jianlitj('${item.id}')">应聘</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<br/>
	<blockquote class="layui-elem-quote">${zpjh.remarks}</blockquote>
	
	<div id="dialog"  style="display: none;padding: 10px 10px 0 20px; ">
		<sys:form id="dialogForm">
			<input id="zpjhid" name="zpjhid" type="hidden" value="${zpjh.id}" />
			<sys:formRow>
				<sys:formItem lable="姓名" isRequired="true">
					<sys:input id="username" inputStyle="width:180px;" value="${zpjlxq.username}"></sys:input>
				</sys:formItem>
			</sys:formRow>
			<sys:formRow>
				<sys:formItem lable="身份证号码" isRequired="true">
					<sys:input id="sfzhm" inputStyle="width:180px;" required="true" value="${zpjlxq.sfzhm}"></sys:input>
				</sys:formItem>
			</sys:formRow>
		</sys:form>
	</div>
</div>
</body>
</html>
