<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="${ctxStatic}/css/comon.css" rel="stylesheet" type="text/css" />
<link href="${ctxStatic}/css/index.css" rel="stylesheet" type="text/css" />
<link href="${ctxStatic}/css/font.css" rel="stylesheet" type="text/css" />
<link href="${ctxStatic}/css/tab_css.css" rel="stylesheet" type="text/css" />
<link href="${ctxStatic}/layui/css/layui.css" rel="stylesheet" type="text/css">

<SCRIPT language=JavaScript src="${ctxStatic}/easyui/jquery.min.js"></SCRIPT>
<script src="${ctxStatic}/layer/layer.js"></script>
<script src="${ctxStatic}/layui/layui.js"></script>
<script src="${ctxStatic}/js/fdp.js"></script>
<script src="${ctxStatic}/js/fdp-ui.js"></script>
<script type="text/javascript">
	var ctx = '${ctx}';
</script>
<script src="${ctxStatic}/js/modules/zp/zpZpjh/zpnrView.js"></script>
<title>招聘</title>
</head>

<body style="padding: 10px;">
	<!-- 头部说明区 -->
	<div class="TableBox">
		<div>
			<center style="font-size: 23px;">湖南工学院2017年专任教师招聘</center>
		</div>
		
		<div>
			<p style="padding: 10px; font-size: 18px; text-indent: 2em;">湖南工学院是 2007 年经教育部批准的省属公办普通本科院校，学校立足湖南，重点面向工业企业，为区域经济建设和社会发展服务，以工为主，理、管、经、文、艺等多学科协调发展，具有较强的科技服务能力，培养基础实、技术精、能力强、具有创新精神和社会责任感的高素质应用型专门人才的本科院校。 
</p><p style="padding: 10px; font-size: 18px; text-indent: 2em;">学校现有10个二级学院，2个教学部（中心），另有汽车零部件技术研究院。</p>
		</div>
	</div>
	
	<!-- 主体数据区 -->
	<div class="TableBox">
		<div class="Tableh2">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="160px"><strong>招聘岗位需求</strong></td>
					<td>
						<c:choose>
							<c:when test="${empty zpjlxq}">
								【<a class="layui-btn layui-btn-radius layui-btn-normal layui-btn-mini"href="javascript:void(0)" 
									onclick="openQueryWin()">输入身份证号</a>查询简历是否投递成功】
							</c:when>
							<c:otherwise>
								<c:if test="${not empty zpjlxq.ssbm}">
								【${zpjlxq.username}，您已应聘岗位：<a href="${ctx}/zpjlxq/toJlView?id=${zpjlxq.id}&src=zpnr" style="color: blue;font-style: oblique;text-decoration: underline;">${zpjlxq.ssbm}${zpjlxq.rpzhiwei}</a><%-- ，可在截止报名前<a class="layui-btn layui-btn-radius layui-btn-normal layui-btn-mini"href="javascript:void(0)" 
									onclick="updateJianli('${zpjlxq.id}')">修改</a>简历 --%>。<a class="layui-btn layui-btn-radius layui-btn-warn layui-btn-mini"href="javascript:void(0)" 
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
		</div>

		<div class="Table06">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" id="dataTable">
				<tr>
					<th style="text-align: center" width="10px">序号</th>
					<th align="center">招聘部门</th>
					<th align="center">岗位</th>
					<th align="center" style="display: none;">任职部门ID</th>
					<th align="center">招聘人数</th>
					<th align="center" width="20%">专业要求</th>
					<th align="center">学历学位要求</th>
					<th align="center" width="20%">其他要求</th>
					<th align="center">备注</th>
					<th align="center">联系人</th>
					<th align="center" width="80px">应聘操作</th>
				</tr>
				<tr id="dataTr1">
					<td align="center" rowspan ="8">1</td>
					<td id="rpzhiwei1" rowspan ="8">机械工程学院</td>
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">4</td>
					<td align="center" class="aaa">机械工程</td>
					<td align="center">博士研究生</td>
					<td align="center"></td>
					<td align="center"></td>
					<td align="center" rowspan ="8">刘吉兆<br>电话：13974795392<br>邮箱：987374198@qq.com</td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(1,201,0,'机械工程')">应聘职位</a></td>
				</tr>
				<tr id="dataTr2">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">机械电子工程</td>
					<td align="center">博士研究生</td>
					<td align="center"></td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(1,201,0,'机械电子工程')">应聘职位</a></td>
				</tr>
				<tr id="dataTr3">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">车辆工程、汽车服务工程</td>
					<td align="center">博士研究生</td>
					<td align="center"></td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(1,201,0,'车辆工程、汽车服务工程')">应聘职位</a></td>
				</tr>
				<tr id="dataTr4">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">材料成型及控制工程</td>
					<td align="center">博士研究生</td>
					<td align="center"></td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(1,201,0,'材料成型及控制工程')">应聘职位</a></td>
				</tr>
				<tr id="dataTr5">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">材料学、材料科学与工程</td>
					<td align="center">博士研究生</td>
					<td align="center"></td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(1,201,0,'材料学、材料科学与工程')">应聘职位</a></td>
				</tr>
				<tr id="dataTr6">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">机械工程</td>
					<td align="center">硕士研究生及以上</td>
					<td align="center">本科为机械设计制造及自动化专业</td>
					<td align="center">实训教师</td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(1,201,1,'机械工程')">应聘职位</a></td>
				</tr>
				<tr id="dataTr7">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">机械电子工程</td>
					<td align="center">硕士研究生及以上</td>
					<td align="center"></td>
					<td align="center">实训教师</td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(1,201,1,'机械电子工程')">应聘职位</a></td>
				</tr>
				<tr id="dataTr8">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">车辆工程、汽车服务工程</td>
					<td align="center">硕士研究生及以上</td>
					<td align="center"></td>
					<td align="center">实训教师</td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(1,201,1,'车辆工程、汽车服务工程')">应聘职位</a></td>
				</tr>
				<tr id="dataTr1">
					<td align="center" rowspan ="6">2</td>
					<td id="rpzhiwei2" rowspan ="6">汽车零部件技术研究院</td>
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">2</td>
					<td align="center">车辆工程、机械工程</td>
					<td align="center">博士研究生</td>
					<td align="center">符合学校学科带头人条件</td>
					<td align="center"></td>
					<td align="center" rowspan ="6">刘安民<br>电话：13873401550<br>邮箱：liuanmin63@163.com</td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(2,214,0,'车辆工程、机械工程')">应聘职位</a></td>
				</tr>
				<tr id="dataTr2">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">2</td>
					<td align="center">车辆工程、能源与动力工程</td>
					<td align="center">博士研究生</td>
					<td align="center"></td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(2,214,0,'车辆工程、能源与动力工程')">应聘职位</a></td>
				</tr>
				<tr id="dataTr3">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">控制科学与工程</td>
					<td align="center">博士研究生</td>
					<td align="center"></td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(2,214,0,'控制科学与工程')">应聘职位</a></td>
				</tr>
				<tr id="dataTr4">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">机械工程</td>
					<td align="center">博士研究生</td>
					<td align="center"></td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(2,214,0,'机械工程')">应聘职位</a></td>
				</tr>
				<tr id="dataTr5">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">车辆工程、能源与动力工程</td>
					<td align="center">硕士研究生及以上</td>
					<td align="center"></td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(2,214,0,'车辆工程、能源与动力工程')">应聘职位</a></td>
				</tr>
				<tr id="dataTr6">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">机电类</td>
					<td align="center">硕士研究生及以上</td>
					<td align="center"></td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(2,214,0,'机电类')">应聘职位</a></td>
				</tr>
				<tr id="dataTr1">
					<td align="center" rowspan ="12">3</td>
					<td id="rpzhiwei3" rowspan ="12">电气与信息工程学院</td>
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">控制科学与工程</td>
					<td align="center">博士研究生</td>
					<td align="center"></td>
					<td align="center"></td>
					<td align="center" rowspan ="12">姚胜兴<br>电话：13974799859<br>邮箱：1125436363@qq.com</td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(3,203,0,'控制科学与工程')">应聘职位</a></td>
				</tr>
				<tr id="dataTr2">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">电气工程</td>
					<td align="center">博士研究生</td>
					<td align="center"></td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(3,203,0,'电气工程')">应聘职位</a></td>
				</tr>
				<tr id="dataTr3">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">电子科学与技术</td>
					<td align="center">博士研究生</td>
					<td align="center"></td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(3,203,0,'电子科学与技术')">应聘职位</a></td>
				</tr>
				<tr id="dataTr4">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">信息与通信工程</td>
					<td align="center">博士研究生</td>
					<td align="center"></td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(3,203,0,'信息与通信工程')">应聘职位</a></td>
				</tr>
				<tr id="dataTr5">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">控制科学与工程</td>
					<td align="center">硕士研究生及以上</td>
					<td align="center"></td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(3,203,0,'控制科学与工程')">应聘职位</a></td>
				</tr>
				<tr id="dataTr6">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">控制科学与工程</td>
					<td align="center">硕士研究生及以上</td>
					<td align="center"></td>
					<td align="center">实训教师</td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(3,203,1,'控制科学与工程')">应聘职位</a></td>
				</tr>
				<tr id="dataTr7">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">电气工程</td>
					<td align="center">硕士研究生及以上</td>
					<td align="center"></td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(3,203,0,'电气工程')">应聘职位</a></td>
				</tr>
				<tr id="dataTr8">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">电气工程</td>
					<td align="center">硕士研究生及以上</td>
					<td align="center"></td>
					<td align="center">实训教师</td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(3,203,1,'电气工程')">应聘职位</a></td>
				</tr>
				<tr id="dataTr9">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">电子科学与技术/信息与通信工程</td>
					<td align="center">硕士研究生及以上</td>
					<td align="center"></td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(3,203,0,'电子科学与技术/信息与通信工程')">应聘职位</a></td>
				</tr>
				<tr id="dataTr10">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">电子科学与技术/信息与通信工程</td>
					<td align="center">硕士研究生及以上</td>
					<td align="center"></td>
					<td align="center">实训教师</td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(3,203,1,'电子科学与技术/信息与通信工程')">应聘职位</a></td>
				</tr>
				<tr id="dataTr11">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">信息与通信工程</td>
					<td align="center">硕士研究生及以上</td>
					<td align="center"></td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(3,203,0,'信息与通信工程')">应聘职位</a></td>
				</tr>
				<tr id="dataTr12">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">信息与通信工程</td>
					<td align="center">硕士研究生及以上</td>
					<td align="center"></td>
					<td align="center">实训教师</td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(3,203,1,'信息与通信工程')">应聘职位</a></td>
				</tr>
				<tr id="dataTr1">
					<td align="center" rowspan ="12">4</td>
					<td id="rpzhiwei4" rowspan ="12">计算机与信息科学学院</td>
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">计算机科学与技术</td>
					<td align="center">博士研究生</td>
					<td align="center"></td>
					<td align="center"></td>
					<td align="center" rowspan ="12">方小勇<br>电话：15197496976<br>邮箱：43728902@qq.com</td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(4,202,0,'计算机科学与技术')">应聘职位</a></td>
				</tr>
				<tr id="dataTr2">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">网络工程</td>
					<td align="center">博士研究生</td>
					<td align="center"></td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(4,202,0,'网络工程')">应聘职位</a></td>
				</tr>
				<tr id="dataTr3">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">软件工程</td>
					<td align="center">博士研究生</td>
					<td align="center"></td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(4,202,0,'软件工程')">应聘职位</a></td>
				</tr>
				<tr id="dataTr4">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">2</td>
					<td align="center">物联网工程、通信工程</td>
					<td align="center">博士研究生</td>
					<td align="center"></td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(4,202,0,'物联网工程、通信工程')">应聘职位</a></td>
				</tr>
				<tr id="dataTr5">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">计算机应用技术</td>
					<td align="center">博士研究生</td>
					<td align="center"></td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(4,202,0,'计算机应用技术')">应聘职位</a></td>
				</tr>
				<tr id="dataTr6">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">计算机科学与技术</td>
					<td align="center">硕士研究生及以上</td>
					<td align="center"></td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(4,202,0,'计算机科学与技术')">应聘职位</a></td>
				</tr>
				<tr id="dataTr7">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">网络工程</td>
					<td align="center">硕士研究生及以上</td>
					<td align="center"></td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(4,202,0,'网络工程')">应聘职位</a></td>
				</tr>
				<tr id="dataTr8">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">信息与计算科学</td>
					<td align="center">硕士研究生及以上</td>
					<td align="center"></td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(4,202,0,'信息与计算科学')">应聘职位</a></td>
				</tr>
				<tr id="dataTr9">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">软件工程</td>
					<td align="center">硕士研究生及以上</td>
					<td align="center"></td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(4,202,0,'软件工程')">应聘职位</a></td>
				</tr>
				<tr id="dataTr10">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">物联网工程、通信工程</td>
					<td align="center">硕士研究生及以上</td>
					<td align="center"></td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(4,202,0,'物联网工程、通信工程')">应聘职位</a></td>
				</tr>
				<tr id="dataTr11">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">计算机应用技术</td>
					<td align="center">硕士研究生及以上</td>
					<td align="center"></td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(4,202,0,'计算机应用技术')">应聘职位</a></td>
				</tr>
				<tr id="dataTr12">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">计算机科学与技术、计算机软件与理论</td>
					<td align="center">硕士研究生及以上</td>
					<td align="center"></td>
					<td align="center">实训教师</td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(4,202,1,'计算机科学与技术、计算机软件与理论')">应聘职位</a></td>
				</tr>
				<tr id="dataTr1">
					<td align="center" rowspan ="8">5</td>
					<td id="rpzhiwei5" rowspan ="8">安全与环境工程学院</td>
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">2</td>
					<td align="center">安全工程、采矿工程、土木工程</td>
					<td align="center">博士研究生</td>
					<td align="center">本科、硕士学历中至少有一个为安全工程专业</td>
					<td align="center"></td>
					<td align="center" rowspan ="8">廖可兵<br>电话：13575271967<br>邮箱：136696685@qq.com</td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(5,205,0,'安全工程、采矿工程、土木工程')">应聘职位</a></td>
				</tr>
				<tr id="dataTr2">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">5</td>
					<td align="center">安全工程（组织行为、事故预防、矿山、建筑与电气安全方向优先）、工业工程、管理科学与工程、组织管理、人因工程、系统工程/系统可靠性工程、机械工程、电气工程、机电一体化、图形/像处理、核技术工程、工程（应用）心理学、计算机科学（软件工程）、应用数学，等</td>
					<td align="center">博士研究生</td>
					<td align="center">从事人因工程或可靠性工程研究满3年，取得一定业绩，具有硕士及以上学历的专业不限，且年龄可放宽到40岁；有海外留学经历或相关企业工作经验者优先；具有副高及以上职称或有企业相关工作经历的年龄放宽到45岁；具有教授职称的人员年龄可放宽到50岁。</td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(5,205,0,'安全工程（组织行为、事故预防、矿山、建筑与电气安全方向优先）、工业工程、管理科学与工程、组织管理、人因工程、系统工程/系统可靠性工程、机械工程、电气工程、机电一体化、图形/像处理、核技术工程、工程（应用）心理学、计算机科学（软件工程）、应用数学，等')">应聘职位</a></td>
				</tr>
				<tr id="dataTr3">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">工业工程、机械制造及其自动化</td>
					<td align="center">博士研究生</td>
					<td align="center"></td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(5,205,0,'工业工程、机械制造及其自动化')">应聘职位</a></td>
				</tr>
				<tr id="dataTr4">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">2</td>
					<td align="center">物流工程、物流管理、交通运输工程</td>
					<td align="center">博士研究生</td>
					<td align="center"></td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(5,205,0,'物流工程、物流管理、交通运输工程')">应聘职位</a></td>
				</tr>
				<tr id="dataTr5">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">软件工程、工业设计</td>
					<td align="center">硕士研究生及以上</td>
					<td align="center"></td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(5,205,0,'软件工程、工业设计')">应聘职位</a></td>
				</tr>
				<tr id="dataTr6">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">工业工程/管理科学与工程</td>
					<td align="center">硕士研究生及以上</td>
					<td align="center"></td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(5,205,0,'工业工程/管理科学与工程')">应聘职位</a></td>
				</tr>
				<tr id="dataTr7">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">物流工程、管理科学与工程（物流管理方向）、交通运输工程</td>
					<td align="center">硕士研究生及以上</td>
					<td align="center"></td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(5,205,0,'物流工程、管理科学与工程（物流管理方向）、交通运输工程')">应聘职位</a></td>
				</tr>
				<tr id="dataTr8">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">物流工程、管理科学与工程（物流管理）、工业工程、安全工程、计算机科学与技术</td>
					<td align="center">硕士研究生及以上</td>
					<td align="center"></td>
					<td align="center">实训教师</td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(5,205,1,'物流工程、管理科学与工程（物流管理）、工业工程、安全工程、计算机科学与技术')">应聘职位</a></td>
				</tr>
				<tr id="dataTr1">
					<td align="center" rowspan ="12">6</td>
					<td id="rpzhiwei6" rowspan ="12">建筑工程与艺术设计学院</td>
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">2</td>
					<td align="center">土木工程</td>
					<td align="center">博士研究生</td>
					<td align="center"></td>
					<td align="center"></td>
					<td align="center" rowspan ="12">甘英明<br>电话：13974756785<br>邮箱：184644621@qq.com</td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(6,200,0,'土木工程')">应聘职位</a></td>
				</tr>
				<tr id="dataTr2">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">2</td>
					<td align="center">工程力学</td>
					<td align="center">博士研究生</td>
					<td align="center"></td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(6,200,0,'工程力学')">应聘职位</a></td>
				</tr>
				<tr id="dataTr3">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">工程管理</td>
					<td align="center">博士研究生</td>
					<td align="center"></td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(6,200,0,'工程管理')">应聘职位</a></td>
				</tr>
				<tr id="dataTr4">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">建筑学</td>
					<td align="center">博士研究生</td>
					<td align="center"></td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(6,200,0,'建筑学')">应聘职位</a></td>
				</tr>
				<tr id="dataTr5">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">设计艺术、机械制造及其自动化</td>
					<td align="center">博士研究生</td>
					<td align="center">本科为工业设计专业</td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(6,200,0,'设计艺术、机械制造及其自动化')">应聘职位</a></td>
				</tr>
				<tr id="dataTr6">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">结构工程/土木工程</td>
					<td align="center">硕士研究生及以上</td>
					<td align="center"></td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(6,200,0,'结构工程/土木工程')">应聘职位</a></td>
				</tr>
				<tr id="dataTr7">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">土木工程</td>
					<td align="center">硕士研究生及以上</td>
					<td align="center"></td>
					<td align="center">实训教师</td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(6,200,1,'土木工程')">应聘职位</a></td>
				</tr>
				<tr id="dataTr8">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">管理科学与工程/工程造价</td>
					<td align="center">硕士研究生及以上</td>
					<td align="center"></td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(6,200,0,'管理科学与工程/工程造价')">应聘职位</a></td>
				</tr>
				<tr id="dataTr9">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">建筑设计及理论</td>
					<td align="center">硕士研究生及以上</td>
					<td align="center"></td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(6,200,0,'建筑设计及理论')">应聘职位</a></td>
				</tr>
				<tr id="dataTr10">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">风景园林规划与设计</td>
					<td align="center">硕士研究生及以上</td>
					<td align="center"></td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(6,200,0,'风景园林规划与设计')">应聘职位</a></td>
				</tr>
				<tr id="dataTr11">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">设计艺术、机械制造及其自动化</td>
					<td align="center">硕士研究生及以上</td>
					<td align="center">本科为工业设计专业</td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(6,200,0,'设计艺术、机械制造及其自动化')">应聘职位</a></td>
				</tr>
				<tr id="dataTr12">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">设计艺术、机械制造及其自动化</td>
					<td align="center">硕士研究生及以上</td>
					<td align="center">本科为工业设计专业</td>
					<td align="center">实训教师</td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(6,200,1,'设计艺术、机械制造及其自动化')">应聘职位</a></td>
				</tr>
				<tr id="dataTr1">
					<td align="center" rowspan ="12">7</td>
					<td id="rpzhiwei7" rowspan ="12">经济与管理学院</td>
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">会计学</td>
					<td align="center">博士研究生</td>
					<td align="center"></td>
					<td align="center"></td>
					<td align="center" rowspan ="12">杨凤鸣<br>电话：13974777966<br>邮箱：867935478@qq.com</td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(7,204,0,'会计学')">应聘职位</a></td>
				</tr>
				<tr id="dataTr2">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">2</td>
					<td align="center">管理科学与工程</td>
					<td align="center">博士研究生</td>
					<td align="center"></td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(7,204,0,'管理科学与工程')">应聘职位</a></td>
				</tr>
				<tr id="dataTr3">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">管理科学与工程（物流管理方向）</td>
					<td align="center">博士研究生</td>
					<td align="center"></td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(7,204,0,'管理科学与工程（物流管理方向）')">应聘职位</a></td>
				</tr>
				<tr id="dataTr4">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">企业管理</td>
					<td align="center">博士研究生</td>
					<td align="center"></td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(7,204,0,'企业管理')">应聘职位</a></td>
				</tr>
				<tr id="dataTr5">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">旅游管理</td>
					<td align="center">博士研究生</td>
					<td align="center"></td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(7,204,0,'旅游管理')">应聘职位</a></td>
				</tr>
				<tr id="dataTr6">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">金融学</td>
					<td align="center">博士研究生</td>
					<td align="center"></td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(7,204,0,'金融学')">应聘职位</a></td>
				</tr>
				<tr id="dataTr7">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">国际贸易学</td>
					<td align="center">博士研究生</td>
					<td align="center"></td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(7,204,0,'国际贸易学')">应聘职位</a></td>
				</tr>
				<tr id="dataTr8">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">会计学</td>
					<td align="center">硕士研究生及以上</td>
					<td align="center"></td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(7,204,0,'会计学')">应聘职位</a></td>
				</tr>
				<tr id="dataTr9">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">管理科学与工程（物流管理方向）</td>
					<td align="center">硕士研究生及以上</td>
					<td align="center"></td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(7,204,0,'管理科学与工程（物流管理方向）')">应聘职位</a></td>
				</tr>
				<tr id="dataTr10">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">教育经济与管理</td>
					<td align="center">硕士研究生及以上</td>
					<td align="center"></td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(7,204,0,'教育经济与管理')">应聘职位</a></td>
				</tr>
				<tr id="dataTr11">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">国际管理</td>
					<td align="center">硕士研究生及以上</td>
					<td align="center"></td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(7,204,0,'国际管理')">应聘职位</a></td>
				</tr>
				<tr id="dataTr12">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">计算机科学与技术</td>
					<td align="center">硕士研究生及以上</td>
					<td align="center"></td>
					<td align="center">实训教师</td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(7,204,1,'计算机科学与技术')">应聘职位</a></td>
				</tr>
				<tr id="dataTr1">
					<td align="center" rowspan ="6">8</td>
					<td id="rpzhiwei8" rowspan ="6">材料与化学工程学院</td>
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">化学工程与技术</td>
					<td align="center">博士研究生</td>
					<td align="center"></td>
					<td align="center"></td>
					<td align="center" rowspan ="6">胡汉祥<br>电话：15073472366<br>邮箱：842857405@qq.com</td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(8,206,0,'化学工程与技术')">应聘职位</a></td>
				</tr>
				<tr id="dataTr2">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">3</td>
					<td align="center">分析化学、无机化学</td>
					<td align="center">博士研究生</td>
					<td align="center"></td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(8,206,0,'分析化学、无机化学')">应聘职位</a></td>
				</tr>
				<tr id="dataTr3">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">2</td>
					<td align="center">材料学</td>
					<td align="center">博士研究生</td>
					<td align="center"></td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(8,206,0,'材料学')">应聘职位</a></td>
				</tr>
				<tr id="dataTr4">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">3</td>
					<td align="center">高分子化学与物理、材料学、材料加工工程</td>
					<td align="center">博士研究生</td>
					<td align="center"></td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(8,206,0,'高分子化学与物理、材料学、材料加工工程')">应聘职位</a></td>
				</tr>
				<tr id="dataTr5">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">2</td>
					<td align="center">材料物理与化学</td>
					<td align="center">博士研究生</td>
					<td align="center"></td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(8,206,0,'材料物理与化学')">应聘职位</a></td>
				</tr>
				<tr id="dataTr6">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">高分子化学与物理、材料学、材料加工工程</td>
					<td align="center">硕士研究生及以上</td>
					<td align="center">第一学历为高分子材料或复合材料相关专业方向</td>
					<td align="center">实训教师</td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(8,206,1,'高分子化学与物理、材料学、材料加工工程')">应聘职位</a></td>
				</tr>
				<tr id="dataTr1">
					<td align="center" rowspan ="5">9</td>
					<td id="rpzhiwei9" rowspan ="5">外国语学院</td>
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">翻译(口译)</td>
					<td align="center">硕士研究生及以上</td>
					<td align="center"></td>
					<td align="center"></td>
					<td align="center" rowspan ="5">张平<br>电话：15973456658<br>邮箱：762080339@qq.com</td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(9,209,0,'翻译(口译)')">应聘职位</a></td>
				</tr>
				<tr id="dataTr2">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">中国语言文学（古汉语翻译）</td>
					<td align="center">硕士研究生及以上</td>
					<td align="center"></td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(9,209,0,'中国语言文学（古汉语翻译）')">应聘职位</a></td>
				</tr>
				<tr id="dataTr3">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">日语</td>
					<td align="center">硕士研究生及以上</td>
					<td align="center"></td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(9,209,0,'日语')">应聘职位</a></td>
				</tr>
				<tr id="dataTr4">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">商务英语</td>
					<td align="center">硕士研究生及以上</td>
					<td align="center"></td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(9,209,0,'商务英语')">应聘职位</a></td>
				</tr>
				<tr id="dataTr5">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">英语</td>
					<td align="center">硕士研究生及以上</td>
					<td align="center"></td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(9,209,0,'英语')">应聘职位</a></td>
				</tr>
				<tr id="dataTr1">
					<td align="center" rowspan ="4">10</td>
					<td id="rpzhiwei10" rowspan ="4">数理科学与能源工程学院</td>
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">计算数学</td>
					<td align="center">博士研究生</td>
					<td align="center"></td>
					<td align="center"></td>
					<td align="center" rowspan ="4">刘璟忠<br>电话：13575297063<br>邮箱：hnhyls@126.com</td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(10,207,0,'计算数学')">应聘职位</a></td>
				</tr>
				<tr id="dataTr2">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">计算数学</td>
					<td align="center">硕士研究生及以上</td>
					<td align="center"></td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(10,207,0,'计算数学')">应聘职位</a></td>
				</tr>
				<tr id="dataTr3">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">统计学</td>
					<td align="center">硕士研究生及以上</td>
					<td align="center"></td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(10,207,0,'统计学')">应聘职位</a></td>
				</tr>
				<tr id="dataTr4">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">物理</td>
					<td align="center">硕士研究生及以上</td>
					<td align="center"></td>
					<td align="center">实训教师</td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(10,207,1,'物理')">应聘职位</a></td>
				</tr>
				<tr id="dataTr1">
					<td align="center" rowspan ="3">11</td>
					<td id="rpzhiwei11" rowspan ="3">马克思主义学院</td>
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">伦理学</td>
					<td align="center">博士研究生</td>
					<td align="center"></td>
					<td align="center"></td>
					<td align="center" rowspan ="3">李春生<br>电话：13974788418<br>邮箱：lcs660119@163.com</td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(11,211,0,'伦理学')">应聘职位</a></td>
				</tr>
				<tr id="dataTr2">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">2</td>
					<td align="center">马克思主义中国化研究</td>
					<td align="center">博士研究生</td>
					<td align="center"></td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(11,211,0,'马克思主义中国化研究')">应聘职位</a></td>
				</tr>
				<tr id="dataTr3">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">马克思主义理论</td>
					<td align="center">硕士研究生及以上</td>
					<td align="center"></td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(11,211,0,'马克思主义理论')">应聘职位</a></td>
				</tr>
				<tr id="dataTr1">
					<td align="center" rowspan ="3">12</td>
					<td id="rpzhiwei12" rowspan ="3">体育教学部</td>
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">体育教育训练学（羽毛球方向）</td>
					<td align="center">硕士研究生及以上</td>
					<td align="center">省级比赛前6名</td>
					<td align="center"></td>
					<td align="center" rowspan ="3">蒋纯金<br>电话：13787719393<br>邮箱：780938742@qq.com</td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(12,210,0,'体育教育训练学（羽毛球方向）')">应聘职位</a></td>
				</tr>
				<tr id="dataTr2">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">2</td>
					<td align="center">体育教育训练学（田径-定向越野方向）</td>
					<td align="center">硕士研究生及以上</td>
					<td align="center">省级比赛前6名</td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(12,210,0,'体育教育训练学（田径-定向越野方向）')">应聘职位</a></td>
				</tr>
				<tr id="dataTr3">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">体育教育训练学（乒乓球方向）</td>
					<td align="center">硕士研究生及以上</td>
					<td align="center">省级比赛前6名</td>
					<td align="center"></td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(12,210,0,'体育教育训练学（乒乓球方向）')">应聘职位</a></td>
				</tr>
				<tr id="dataTr1">
					<td align="center">13</td>
					<td id="rpzhiwei13">国际教育学院</td>
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">教育学</td>
					<td align="center">硕士研究生及以上</td>
					<td align="center">获得海外大学学历学位</td>
					<td align="center"></td>
					<td align="center">杨朗<br>电话：13907344706<br>邮箱：9981975@qq.com</td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(13,212,0,'教育学')">应聘职位</a></td>
				</tr>
				<tr id="dataTr1">
					<td align="center" rowspan ="2">14</td>
					<td id="rpzhiwei14" rowspan ="2">工程训练中心</td>
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">机械工程</td>
					<td align="center">硕士研究生及以上</td>
					<td align="center">熟练操作数控机床</td>
					<td align="center">实训教师</td>
					<td align="center" rowspan ="2">陈敏<br>电话：13575286866<br>邮箱：9918428@qq.com</td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(14,213,1,'机械工程')">应聘职位</a></td>
				</tr>
				<tr id="dataTr2">
					<td id="ssbm1" align="center">专任教师</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">1</td>
					<td align="center">电气工程、电子科学与技术、信息与通信工程</td>
					<td align="center">硕士研究生及以上</td>
					<td align="center">熟悉专业实验操作</td>
					<td align="center">实训教师</td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(14,213,1,'电气工程、电子科学与技术、信息与通信工程')">应聘职位</a></td>
				</tr>
				<script type="text/javascript">
					/**
					 * 投递简历前验证身份证号是否之前已有投递
					 */
					function jianlitj(id,ssbmid,isSxjs,zyYq){
						var formData = $("#dialog #dialogForm").serializeObject();
						//验证
						$.post(ctx+"/zp/zpZpjh/checkStop",formData,function(data){
							if(data.isExsits){
								layer.alert(data.msg,{icon:2});
							}else{
								$("#dialog #dialogForm")[0].reset();
								layer.open({
									type : 1,
									closeBtn : 1,
									title : "投递简历前录入身份信息",
									maxmin : false,
									area : [ '360px', '200px' ],
									content : $('#dialog'), //这里content是一个DOM
									btn : [ '确定', '取消' ],
									btn1 : function() {
										var formData = $("#dialog #dialogForm").serializeObject();
										if($.trim(formData.username)==null || $.trim(formData.username)==''){
											//layer.alert("姓名不能为空，请填写！",{icon:2});
											layer.tips("姓名不能为空","#dialogForm #username", {
												  tips: [3, '#FF5722'],
												  time: 2000
											});
											$("#dialogForm #username").focus();
											return false;
										}
										if($.trim(formData.sfzhm)==null || $.trim(formData.sfzhm)==''){
											//layer.alert("身份证号码不能为空，请填写！",{icon:2});
											layer.tips("身份证号码不能为空","#dialogForm #sfzhm", {
												  tips: [3, '#FF5722'],
												  time: 2000
											});
											$("#dialogForm #sfzhm").focus();
											return false;
										}
										
										//验证
										$.post(ctx+"/zp/zpZpjh/checkSfzhm",formData,function(data){
											if(data.isExsits){
												layer.alert(data.msg,{icon:2},function(){
													window.location.reload();
												});
											}else{
												var rpzhiwei =  "专任教师";
												if(isSxjs==1){
													rpzhiwei += "（实训教师）"
												}
												var ssbm = $('#rpzhiwei'+id).get(0).innerHTML; 
												
												$("#rpzhiwei").val(rpzhiwei);
												$("#ssbm").val(ssbm);
												$("#ssbmid").val(ssbmid);
												$("#zyYq").val(zyYq);
												
												$("#mybtn").click();
											}
										},"json");
									}
								});
							}
						},"json");
					}
				</script>
			</table>
		</div>
	</div>
	
	<form id="myform" action="${ctx}/zpjlxq/jianlitjList2" style="display:none;"
		method="post">
		<input type="hidden" name="zpjhid" id="zpjhid" value="1" />
		<input type="hidden" name="gwlx" id="gwlx" value="B01" />
		<input type="hidden" name="rpzhiwei" id="rpzhiwei"/>
		<input type="hidden" name="ssbm" id="ssbm"/>
		<input type="hidden" name="ssbmid" id="ssbmid"/>
		<input type="hidden" name="zyYq" id="zyYq"/>
		<input type="hidden" name="src" id="src" value="zp/zprn/init.do"/>
		<button id="mybtn" type="submit"></button>
	</form>
	
	<div id="dialog"  style="display: none;padding: 10px 10px 0 20px; ">
		<sys:form id="dialogForm">
			<input id="zpjhid" name="zpjhid" type="hidden" value="1" />
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
	<br/>
	<!-- 尾部说明区 -->
	<blockquote class="layui-elem-quote">
		<div>
		    <p style="padding: 10px; font-size: 18px; text-indent: 2em;">说明：</p>
			<p style="padding: 10px; font-size: 18px; text-indent: 2em;">1、如未作特别说明，学历要求博士指双证博士研究生，硕士即指双证硕士研究生，本科指全日制统招本科。 
</p><p style="padding: 10px; font-size: 18px; text-indent: 2em;">2、年龄要求：博士研究生40岁以下（即1977年1月1日后出生），有3年以本专业工作经历者可放宽至45岁以下（即1972年1月1日后出生）。硕士研究生35岁以下（即1982年1月1日后出生），有3年以上本专业工作经历或有获得海外大学学历学位者可放宽至38岁以下（即1979年1月1日后出生）。全日制本科生28岁以下（即1989年1月1日后出生）。</p>
		<br>
		</div>
	</blockquote>
</body>

</html>
