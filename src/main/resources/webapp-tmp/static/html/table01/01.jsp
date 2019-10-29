<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<link href="../../css/comon.css" rel="stylesheet" type="text/css" />
<link href="../../css/index.css" rel="stylesheet" type="text/css" />
<link href="../../css/font.css" rel="stylesheet" type="text/css" />
<link href="../../css/tab_css.css" rel="stylesheet" type="text/css" />
<style type="text/css" >
.btn_success,.btn_qx{ border:1px solid #1e42a3;text-shadow:0px -1px 0px #11258b;
box-shadow:inset 1px 1px 0px #3e8acb,inset -1px -1px 0px #295aae,1px 2px 2px #ccc;
	background: -moz-linear-gradient(TOP, #3371bf 0%, #2651a8 100%); /* FF3.6+ */
				background: -webkit-gradient(top, color-stop(0%,#3371bf), color-stop(100%,#2651a8)); /* Chrome,Safari4+ */
				background: -webkit-linear-gradient(TOP, #3371bf 0%,#2651a8 100%); /* Chrome10+,Safari5.1+ */
				background: -o-linear-gradient(TOP, #3371bf 0%,#2651a8 100%); /* Opera11.10+ */
				background: -ms-linear-gradient(TOP, #3371bf 0%,#2651a8 100%); /* IE10+ */
				filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#3371bf', endColorstr='#2651a8',GradientType=0 ); /* IE6-9 */
				background: linear-gradient(TOP, #3371bf 0%,#2651a8 100%); /* W3C */
	}
	.btn:hover{ opacity:0.9;}
	.btn {
display: inline-block; letter-spacing:1px; border-radius:2px; 
border: 1px solid transparent;white-space: nowrap;

font-weight: 400;
text-align: center;
vertical-align: middle;
cursor: pointer; line-height:27px;
padding: 0px 20px; color:#fff;
}
.download:link{color: red;}
.download:visited{color: blue;}
.download{text-decoration: underline;}

</style>
<SCRIPT language=JavaScript src="../../js/jquery.js"></SCRIPT>
<SCRIPT language=JavaScript src="../../js/js.js"></SCRIPT>
<script src="../../js/Njs.js" type="text/jscript"></script>
<script language=JavaScript >

$(document).ready(function() {
	
	
	//模拟从服务端取数
	$("body").append("<div class='bg'>"
			 +'<iframe src="load.html" frameborder="none"  style="width:100%; height:100%;"></iframe>'
			 +"</div>");
	//$("body").css({overflow:'hidden'})//定义滚动条不滚动
	 $(".bg").animate({opacity:'0.6'},500)
	 
	 setTimeout("removeLoad()",500);
	
	//document.getElementById("dataTr1").style.display ="";
});

	function removeLoad(){
		//todo 加载数据
		document.getElementById("dataTr1").style.display ="";
		 if(<%=application.getAttribute("tjzt")%>==1){
			document.getElementById("dataTr1").style.display ="none";
			$("#dataTr3 td").eq(0).text("1");
			$("#dataTr4 td").eq(0).text("2");
	//		$("#dataTr5 td").eq(0).text("4");
	//		$("#dataTr6 td").eq(0).text("5");
	//		$("#dataTr7 td").eq(0).text("6");
		 }else{
		//	 document.getElementById("dataTr2").style.display ="";
			 $("#dataTr3 td").eq(0).text("2");
			 $("#dataTr4 td").eq(0).text("3");
		//	 $("#dataTr5 td").eq(0).text("5");
		//	 $("#dataTr6 td").eq(0).text("6");
		//	 $("#dataTr7 td").eq(0).text("7");
		 }
		document.getElementById("dataTr3").style.display ="";
		document.getElementById("dataTr4").style.display ="";
	//	document.getElementById("dataTr5").style.display ="";
	//	document.getElementById("dataTr6").style.display ="";
	//	document.getElementById("dataTr7").style.display ="";
		$(".bg").remove();
	}

	function clikcNsrsbh(url){
		/* var tc_width=$(".tc").width()/2;
		 var tc_height=$(".tc").height()/2;
		 $(".tc").animate({marginTop:-(tc_height+20),marginLeft:-tc_width})
		 $("body").append("<div class='bg'></div>");
		//$("body").css({overflow:'hidden'})//定义滚动条不滚动
		 $(".bg").animate({opacity:'0.9'},500);
		 $("#surfaceFrame").attr("src",url);
		 $(".tc").fadeIn();*/
		 //window.open(url);
		 
		/*$('#tablis', parent.document).children().removeClass("unlike");
		//alert($("#tablis").children("li:last-child").html());
		$('#tablis', parent.document).children("li:last-child").after("<li class='unlike'><span onClick='onClickTabNavi();'>纳税人基础信息</span><span class='close'>×</span></li>");
		
		$("#divTabs", parent.document).children().css('display','none');
		var divID = 'divFrame'+top.index;
		var iframeID = 'workingFrame'+top.index;
		$("#divTabs", parent.document).children("div:last-child").after('<div id='+divID+'><table width="100%" border="0" cellspacing="0" cellpadding="0">'
        +'<tr>'
        +'<td>'
        +'<iframe src="'+url+'" frameborder="none" class="iframe1" style="width:100%;" name="workingFrame" id="'+iframeID+'" ></iframe>'
        +'</td>'
        +'</tr>'
        +'</table></div>');
	
		$("#"+iframeID, parent.document).css({height:$(window).height()-85});*/
		
		window.parent.clikcMenu(url,"纳税人基础信息");
	}
	
	function jk(){
		//进入缴款页面
		window.parent.clikcMenu("table01/gd_789-1.html?ysbqc='true'","清缴税款");
	}

</script>
<title>申报缴款</title>
</head>

<body >
<div class="TableBox ">
  <div class="Tableh2"><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><strong>纳税人基本信息</strong></td>
    <td><table border="0" align="right" cellpadding="0" cellspacing="2">
      <tr>
        <td><a class="btn01 down">智慧申报订阅</a>
        <div class="tc" style="display:none; width:70%;">
        <div class="tc_tit">申报表智慧订阅设置</div>
        <a  class="close_btn" >×</a>
      		   
<iframe src="P05-1.html" frameborder="none"  style="width:100%; height:390px;" name="surfaceFrame" id="surfaceFrame" ></iframe>
      </div>
        </td>
     
      </tr>
    </table></td>
  </tr>
</table>
</div>
  <div class="Table01 ">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
     <td><strong>纳税人类型:</strong> 增值税一般纳税人</td>
     <td><strong>法定代表人:</strong>负责人</td>
     <td><strong>经营范围:</strong>经营范围</td>
    </tr>
    <tr>
    <td><strong>纳税人状态:</strong> <span class="zt00 zt01">●</span>&nbsp;&nbsp;&nbsp;&nbsp;（正常）</td>
    <td><strong>批准设立机关:</strong> 广东省广州市荔湾区国家税务局</td>
    <td><strong>地址:</strong> 广东省广州市荔湾区荔湾路1号</td>
     
    </tr>
    </table>
 
  </div>
  <div class="Tableh2"><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><strong>应申报清册</strong></td>
    <td><!--<table border="0" align="right" cellpadding="0" cellspacing="2">
      <tr>
        <td><a href="#" class="btn01">扫描</a></td>
        <td><a href="#" class="btn01">打印</a></td>
      </tr>
    </table>--></td>
  </tr>
</table>
</div>
  <div class="Table02">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="dataTable">
  <tr>
  	<th style="text-align:center" width="10px">序号</th>
    <th align="center">申报表</th>
    <th align="center">PDF报表</th>
    <th align="center">申报情况 </th>
    <th align="center">税款所属期起 </th>
    <th align="center">税款所属期止</th>
    <th align="center">申报截止日期</th>
    <th align="center">申报期限</th>
    </tr>
  <tr style="display:none" id="dataTr1">
  		<td align="center">1</td>
	    <td style="color:red">增值税一般纳税人申报</td>
	    <td align="center" ><a href="http://localhost:8080/etax/bizfront/pdfsb33.do"  align="center"  class="download">下载 </a></td>
	    <td style="color:red" align="center">未申报 </td>
	    <td align="center" style="color:red" >2015-10-01</td>
	    <td align="center" style="color:red" >2015-10-31</td>
	    <td align="center" style="color:red" >2015-11-16</td>
	    <td style="color:red" align="center">按月</td>
	    <!-- <td><a class="btn1 btn_02" href="#">查看</a> <a class="btn1 btn_02" href="#">作废</a> <a class="btn1 btn_02" href="#" onClick="jk();">缴款</a> <a class="btn1 btn_02" href="#">更正</a></td> -->
	 
    </tr>
    <!-- 
  <tr>
  <td align="center">2</td>
  <td >烟类应税消费品消费税申报</td>
    <td><a href="http://localhost:8080/etax/bizfront/pdfsb33.do" >下载 </a></td>
   <td >已申报 </td>
    <td align="center" >2015-09-01</td>
    <td align="center" >2015-09-30</td>
    <td align="center" >2015-10-20</td>
    <td >按月</td>
    <td><a class="btn1 btn_01" href="#">查看</a> <a class="btn1 btn_01" href="#">作废</a> <a class="btn1 btn_01" href="#" onClick="jk();">缴款</a> <a class="btn1 btn_01" href="#">更正</a></td> 
    </tr>
    -->
  <tr style="display:none;" id="dataTr2">
  		<td  align="center">2</td>
	    <td class="tjzt00">增值税一般纳税人申报</td>
	    <td align="center" ><a href="http://localhost:8080/gdgs/bizfront/pdfsb33.do"  class="tjzt00" align="center" >下载 </a></td>
	    <td class="tjzt00" align="center" >未申报 </td>
	    <td class="tjzt00" align="center" >2015-10-01</td>
	    <td class="tjzt00" align="center" >2015-10-30</td>
	    <td class="tjzt00" align="center" >2015-11-16</td>
	    <td class="tjzt00"  align="center" >按月</td>
	    <!--<td class="tjzt02"><a class="btn1 btn_02" href="#">查看</a> <a class="btn1 btn_02" href="#">作废</a> <a class="btn1 btn_02" href="#" onClick="jk();">缴款</a> <a class="btn1 btn_02" href="#">更正</a></td> -->
	 
    </tr>
    <tr style="display:none" id="dataTr3">    
    <td align="center">3</td>
  <td style="color:red">酒及酒精消费税申报</td>
    <td align="center"  ><a  href="http://localhost:8080/etax/bizfront/pdfsb33.do"  class="tjzt01 download" align="center"  >下载 </a></td>
	    <td class="tjzt01" align="center"  style="color:red">未申报 </td>
	    <td class="tjzt01" align="center"  style="color:red">2015-10-01</td>
	    <td class="tjzt01" align="center"  style="color:red">2015-10-31</td>
	    <td class="tjzt01" align="center"  style="color:red">2015-11-16</td>
	    <td class="tjzt01"  align="center"  style="color:red">按月</td>
    <!--<td><a class="btn1 btn_02" href="#">查看</a> <a class="btn1 btn_02" href="#">作废</a> <a class="btn1 btn_02" href="#" onClick="jk();">缴款</a> <a class="btn1 btn_02" href="#">更正</a></td> -->
    </tr>
    <tr style="display:none" id="dataTr4">
    <td align="center">4</td>
  <td style="color:red">居民企业所得税月(季)度预缴纳税申报(适用查账征收)</td>
      <td align="center" ><a  href="http://localhost:8080/etax/bizfront/pdfsb33.do"  class="tjzt01 download" align="center"  >下载 </a></td>
	    <td class="tjzt01" align="center" style="color:red">未申报 </td>
	    <td class="tjzt01" align="center" style="color:red">2015-10-01</td>
	    <td class="tjzt01" align="center" style="color:red">2015-10-31</td>
	    <td class="tjzt01" align="center" style="color:red">2015-11-16</td>
	    <td class="tjzt01"  align="center" style="color:red">按月</td>
    <!--<td><a class="btn1 btn_02" href="#">查看</a> <a class="btn1 btn_02" href="#">作废</a> <a class="btn1 btn_02" href="#" onClick="jk();">缴款</a> <a class="btn1 btn_02" href="#">更正</a></td> -->
    </tr>
    <tr style="display:none" id="dataTr5">
    <td align="center">5</td>
  <td>文化事业建设费申报</td>
    <td align="center" ><a href="http://localhost:8080/etax/bizfront/pdfsb33.do"  class="tjzt01" align="center"  style="text-decoration:underline;">下载 </a></td>
	    <td class="tjzt01" align="center" >未申报 </td>
	    <td class="tjzt01" align="center" >2015-09-01</td>
	    <td class="tjzt01" align="center" >2015-09-30</td>
	    <td class="tjzt01" align="center" >2015-10-20</td>
	    <td class="tjzt01"  align="center" >按月</td>
    <!--<td><a class="btn1 btn_02" href="#">查看</a> <a class="btn1 btn_02" href="#">作废</a> <a class="btn1 btn_02" href="#" onClick="jk();">缴款</a> <a class="btn1 btn_02" href="#">更正</a></td> -->
    </tr>
  
    <tr style="display:none" id="dataTr6">
    <td align="center">6</td>
  <td>教育费附加申报</td>
     <td align="center" ><a href="http://localhost:8080/etax/bizfront/pdfsb33.do"  class="tjzt01" align="center"  style="text-decoration:underline;">下载 </a></td>
	    <td class="tjzt01" align="center" >未申报 </td>
	    <td class="tjzt01" align="center" >2015-09-01</td>
	    <td class="tjzt01" align="center" >2015-09-30</td>
	    <td class="tjzt01" align="center" >2015-10-20</td>
	    <td class="tjzt01"  align="center" >按月</td>
    <!--<td><a class="btn1 btn_02" href="#">查看</a> <a class="btn1 btn_02" href="#">作废</a> <a class="btn1 btn_02" href="#" onClick="jk();">缴款</a> <a class="btn1 btn_02" href="#">更正</a></td> -->
    </tr>
    <tr style="display:none" id="dataTr7">
    <td align="center">7</td>
  <td>废弃电器电子产品处理基金申报</td>
     <td align="center" ><a href="http://localhost:8080/etax/bizfront/pdfsb33.do"  class="tjzt01" align="center" style="text-decoration:underline;">下载 </a></td>
	    <td class="tjzt01" align="center" >未申报 </td>
	    <td class="tjzt01" align="center" >2015-09-01</td>
	    <td class="tjzt01" align="center" >2015-09-30</td>
	    <td class="tjzt01" align="center" >2015-10-20</td>
	    <td class="tjzt01"  align="center" >按月</td>
    <!--<td><a class="btn1 btn_02" href="#">查看</a> <a class="btn1 btn_02" href="#">作废</a> <a class="btn1 btn_02" href="#" onClick="jk();">缴款</a> <a class="btn1 btn_02" href="#">更正</a></td> -->
    </tr>
  
    </table>

 
  </div>
  <div class="page">
       <table width="100%" border="0" cellspacing="0" cellpadding="0">

</table>

  </div>
</div>
</body>
</html>
