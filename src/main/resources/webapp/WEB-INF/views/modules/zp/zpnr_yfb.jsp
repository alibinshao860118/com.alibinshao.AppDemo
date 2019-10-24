<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	String ctx = request.getContextPath();
%>
<meta charset="utf-8">
<link href="../../css/comon.css" rel="stylesheet" type="text/css" />
<link href="../../css/index.css" rel="stylesheet" type="text/css" />
<link href="../../css/font.css" rel="stylesheet" type="text/css" />
<link href="../../css/tab_css.css" rel="stylesheet" type="text/css" />

<SCRIPT language=JavaScript src="../../js/jquery.js"></SCRIPT>
<SCRIPT language=JavaScript src="../../js/js.js"></SCRIPT>
<script src="../../js/Njs.js" type="text/jscript"></script>
<style type="text/css">
</style>
<title>应聘简历管理</title>
</head>

<body>
	<div class="TableBox">
		<div class="TableBox" style="padding: 10px;">
			您现在的位置：<a href="http://www.hnpu.edu.cn/">返回首页</a>><a href="#">招聘信息</a>
		</div>
		<div class="Table03">
			<table width="100%">
				<tr>
					<td align="center"><h1>大学2017年专职教师招聘</h1></td>
				</tr>
				<tr>
					<td align="center" style="padding: 10px;">发布日期：2017-02-06</td>
				</tr>
			</table>

		</div>

		<div>
			<p style="padding: 10px; font-size: 18px; text-indent: 2em;">本次会议由：湖南工学院、衡阳市环境保护志愿者协会举办,衡阳地源评估咨询有限公司丶惠州浩林工艺有限公司承办，湖南精科检测有限公司丶衡阳永清环保能源有限公司丶湘江节能环保协作平台、中山大智天骄广告有限公司协办,旨在聚焦"绿色湖南”，保护生态湘江。本次会议由：湖南工学院、衡阳市环境保护志愿者协会举办,衡阳地源评估咨询有限公司丶惠州浩林工艺有限公司承办，湖南精科检测有限公司丶衡阳永清环保能源有限公司丶湘江节能环保协作平台、中山大智天骄广告有限公司协办,旨在聚焦"绿色湖南”，保护生态湘江。</p>
		</div>
	</div>
	<div class="TableBox">
		<div class="Tableh2">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td><strong>招聘岗位需求</strong></td>
					<td>
						<table border="0" align="right" cellpadding="0" cellspacing="2">
							<tr>

							</tr>
						</table></td>
				</tr>
			</table>
		</div>

		<div class="Table06">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" id="dataTable">
				<tr>
					<th style="text-align: center" width="10px">序号</th>
					<th align="center">招聘岗位</th>
					<th align="center">任职部门</th>
					<th align="center" style="display: none;">任职部门ID</th>
					<th align="center">招聘人数</th>
					<th align="center">专业要求</th>
					<th align="center">学历学位要求</th>
					<th align="center">其他要求</th>
					<th align="center" width="160px">应聘操作</th>
				</tr>
				<tr id="dataTr1">
					<td align="center">1</td>
					<td id="rpzhiwei1">专职人事干事</td>
					<td id="ssbm1" align="center">人事处</td>
					<td id="ssbmid1" align="center" style="display: none;">1</td>
					<td align="center">2</td>
					<td align="center">人力资源</td>
					<td align="center">本科以上</td>
					<td align="center">无</td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(1)">补录简历</a>
					    <a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlick(1)">简历查看</a></td>
				</tr>
				<tr id="dataTr2">
					<td align="center">2</td>
					<td id="rpzhiwei2">专职老师</td>
					<td id="ssbm2" align="center">计算机学院</td>
					<td id="ssbmid2" align="center" style="display: none;">2</td>
					<td align="center">2</td>
					<td align="center">计算机相关专业</td>
					<td align="center">硕士以上</td>
					<td align="center">无</td>
					<td><a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlitj(2)">补录简历</a>
					    <a class="btn1 btn_01" href="javascript:void(0)" onclick="jianlick(2)">简历查看</a></td>
				</tr>
				<script type="text/javascript">
					function jianlitj(id) {
						var rpzhiwei = $('#rpzhiwei'+id).get(0).innerHTML;  
						var ssbm = $('#ssbm'+id).get(0).innerHTML;
						var ssbmid = $("#ssbmid"+id).get(0).innerText;
						//TODO:暂时写死
						//window.location.href = "<%=ctx%>/zpjlxq/jianlitjList.do?zpjhid=1&gwlx=B01&rpzhiwei="+rpzhiwei+"&ssbm="+ssbm+"&ssbmid="+ssbmid ;
						//参数是汉字，用360浏览器会自动转码，用ie传给服务端就是乱码，因此要encodeURI
						window.location.href = "<%=ctx%>/zpjlxq/jianlitjList.do?zpjhid=1&gwlx=B01&rpzhiwei="+encodeURI(rpzhiwei)+"&ssbm="+encodeURI(ssbm)+"&ssbmid="+ssbmid ;
					}
					
					function jianlick(id) {
						//参数是汉字，用360浏览器会自动转码，用ie传给服务端就是乱码，因此要encodeURI
						window.location.href = "<%=ctx%>/zp/zprn/jianligl.do";
					}					
				</script>
			</table>
		</div>
	</div>
</body>
</html>
