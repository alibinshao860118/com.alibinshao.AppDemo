<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String ctx = request.getContextPath();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>应聘简历打印</title>
<script>
	var ppage = 1;
	function doPrint() {
		document.getElementById("printmenu").style.display = "none";
		window.print();
		document.getElementById("printmenu").style.display = "";
		//dolook(++ppage);
	}
	function closef() {
		var userAgent = navigator.userAgent;
		if (userAgent.indexOf("Firefox") != -1
				|| userAgent.indexOf("Presto") != -1) {
			window.location.replace("about:blank");
		} else {
			window.opener = null;
			window.open("", "_self");
			window.close();
		}
	}
</script>
</head>
<STYLE>
.printTable {
	border: 0 solid black;
	border-collapse: collapse;
	width: 620
}

.printTable th {
	height: 150;
	width: 78;
}

.printTable td {
	border-bottom: 1 solid black;
	border-left: 1 solid black;
	border-right: 1 solid black;
	border-top: 1 solid black;
	text-align: center;
	height: 39;
	empty-cells: show;
}

.noBorderTable {
	border: 0;
}

.noBorderTable td {
	border: 0;
	height: 30
}

.noTopRightTd {
	border-bottom: 1 solid black;
	border-left: 1 solid black;
	border-right: 0 solid black;
	border-top: 0 solid black;
	empty-cells: show;
}

.noTopTd {
	border-bottom: 1 solid black;
	border-left: 1 solid black;
	border-right: 1 solid black;
	border-top: 0 solid black;
	empty-cells: show;
}

.noRightTd {
	border-bottom: 1 solid black;
	border-left: 1 solid black;
	border-right: 0 solid black;
	border-top: 0 solid black;
	empty-cells: show;
}

.rightTd {
	border-bottom: 0 solid black;
	border-left: 0 solid black;
	border-right: 1 solid black;
	border-top: 0 solid black;
	empty-cells: show;
}

.noHeightTd {
	border-bottom: 1 solid black;
	border-left: 1 solid black;
	border-right: 1 solid black;
	border-top: 0 solid black;
	empty-cells: show;
}

.nestTable {
	border: 1 solid black;
	border-collapse: collapse;
}

.nestTable td {
	border-bottom: 1 solid black;
	border-left: 1 solid black;
	border-right: 1 solid black;
	border-top: 1 solid black;
	align: center;
	height: 30;
	empty-cells: show;
}

.toptd {
	border-bottom: 0 solid black;
	border-left: 1 solid black;
	border-right: 0 solid black;
	border-top: 1 solid black;
}

p {
	FONT-SIZE: 15px;
	COLOR: #333333;
	FONT-FAMILY: "楷体_GB2312", Arial, Helvetica, sans-serif
}

pageFormatClass {
	size: 12px;
	COLOR: #333333;
	FONT-FAMILY: "宋体", Arial, Helvetica, sans-serif
}
</STYLE>
<BODY>
	<!--打印的内容开始-->
	<!--table width=580 border=0 align=center>
 <tr align="center" height="10">
	<td>-->
	<div id="printmenu" align="center">
		<input type="button" class="editBottomButton" value="打印" onClick="doPrint(ppage)"> 
		<input type="button" class="editBottomButton" value="关闭" onClick="closef()">
	</div>
	<!--</td>
 </TR>
</table-->
	<div id="data1">
		<p align=center>
			<font SIZE="6" face="宋体"><B>湖南省事业单位公开招聘人员报名表
		</p>
		</B>
		</p>
		<table class="printTable" border="0" cellspacing="0" cellpadding="0"
			align=center>
			<tr>
				<td style="text-align: left;">应聘单位：${vo.ssbm }</td>
				<td style="text-align: left;">应聘岗位: ${vo.rpzhiwei }</td>
				<td style="text-align: right;">报名序号： ${vo.id }</td>
			</tr>
		</table>
		<TABLE class="printTable" border="1" cellspacing="0" cellpadding="0"
			align=center>
			<tr>
				<td colspan="2" style="width: 90px;">姓 名</td>
				<td style="width: 80px;"> ${vo.username }</td>
				<td style="width: 60px;">性 别</td>
				<td style="width: 50px;">${vo.xb }</td>
				<td style="width: 80px;">民 族</td>
				<td style="width: 80px;">${vo.mzMc }</td>
				<td rowspan="5" style="width: 120px;"></td>
			</tr>
			<tr>
				<td colspan="2">出生年月</td>
				<td>${vo.csrq }</td>
				<td>政治面貌</td>
				<td>${vo.zzmmMc }</td>
				<td>学历学位</td>
				<td>${vo.zgxlMc }</td>
			</tr>
			<tr>
				<td colspan="2">毕业院校</td>
				<td colspan="3">${vo.zgxlxx }</td>
				<td>所学专业</td>
				<td>${vo.sxzy }</td>
			</tr>
			<tr>
				<td colspan="3">职称、执（职）业资格</td>
				<td colspan="2">${vo.zyzg }</td>
				<td>取得时间</td>
				<td>${vo.zyzgsj }</td>
			</tr>
			<tr>
				<td colspan="2">户 籍<br>所在地
				</td>
				<td>${vo.jg }</td>
				<td>婚姻状况</td>
				<td>${vo.hyzk }</td>
				<td>档案保<br>管单位
				</td>
				<td>${vo.rsdadw }</td>
			</tr>
			<tr>
				<td colspan="2">身份证号</td>
				<td colspan="3">${vo.sfzhm }</td>
				<td>有何特长</td>
				<td colspan="2">${vo.tc }</td>
			</tr>
			<tr>
				<td colspan="2">通讯地址</td>
				<td colspan="4">${vo.txdz }</td>
				<td>邮政编码</td>
				<td>${vo.youbian }</td>
			</tr>
			<tr>
				<td colspan="2">联系电话</td>
				<td colspan="3">${vo.sj }</td>
				<td>EMAIL</td>
				<td colspan="2">${vo.yx }</td>
			</tr>
			<tr>
				<td colspan="2" style="height: 160px;">简历</td>
				<td colspan="6">${vo.jianli }</td>
			</tr>
			<tr>
				<td colspan="2" style="height: 160px;">与应聘岗位<br>相关的实践<br>经历或取得<br>的成绩
				</td>
				<td colspan="6">${vo.chengji }</td>
			</tr>
			<tr>
				<td style="width: 30px;">应<br>聘<br>人<br>员<br>承<br>诺
				</td>
				<td colspan="3">本人承诺所提供的材料真实有效，符合应聘岗位所需的资格条件。如有弄虚作假，承诺自动放弃考试和聘用资格。<br>应聘人签名：<br>
					年 月 日
				</td>
				<td>资<br>格<br>审<br>查<br>意<br>见
				</td>
				<td colspan="3">经审查，符合应聘资格条件。<br>
				<br>审查人签名： 单位（盖章）<br>年 月 日
				</td>
			</tr>
			<tr>
				<td>备注</td>
				<td colspan="7"></td>
			</tr>
		</table>
		<br>
		<div align="center">
			<font size="2">第1页/共1页</font>
		</div>
	</div>
</BODY>
</html>