<%@page import="com.sun.org.apache.xalan.internal.xsltc.compiler.sym"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<link href="../../css/comon.css" rel="stylesheet" type="text/css" />
<link href="../../css/index.css" rel="stylesheet" type="text/css" />
<link href="../../css/font.css" rel="stylesheet" type="text/css" />
<link href="../../css/tab_css.css" rel="stylesheet" type="text/css" />

<SCRIPT language=JavaScript src="../../js/jquery.js"></SCRIPT>
<SCRIPT language=JavaScript src="../../js/js.js"></SCRIPT>
<script language="javascript" type="text/javascript" src="../../js/My97DatePicker/WdatePicker.js"></script>
<script src="../../js/Njs.js" type="text/jscript"></script>
<style type="text/css">
	 .sb{height: 26px;
	 margin-top: 2px
	} 
	
	#sbjg,#sb01{height: 28px}
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
</style>
<script language=JavaScript >

$(document).ready(function() {
	setDate(1); 

	$(".Table06").hide();
	
	//模拟从服务端取数
	$("body").append("<div class='bg'>"
			 +'<iframe src="load.html" frameborder="none"  style="width:100%; height:100%;"></iframe>'
			 +"</div>");
	//$("body").css({overflow:'hidden'})//定义滚动条不滚动
	 $(".bg").animate({opacity:'0.6'},500)
	 
	 setTimeout("removeLoad()",500);
	
});

function removeLoad(){
	//todo 加载数据
	document.getElementById("dataTr1").style.display ="";
	var myDate = new Date()
	var year= myDate.getFullYear();    
	var month= myDate.getMonth() + 1
	var date= myDate.getDate() ; 
	$("#sbsjTd1").text(year+"-"+month+"-"+date);
	/*document.getElementById("dataTr2").style.display ="";
	document.getElementById("dataTr3").style.display ="";
	document.getElementById("dataTr4").style.display ="";
	document.getElementById("dataTr5").style.display ="";
	document.getElementById("dataTr6").style.display ="";*/
	
	document.getElementById("pageTable").style.display ="";
	$(".bg").remove();
}

	function checkFormAjax(){
		 $("body").append("<div class='bg'>"
				 +'<iframe src="load.html" frameborder="none"  style="width:100%; height:100%;"></iframe>'
				 +"</div>");
		//$("body").css({overflow:'hidden'})//定义滚动条不滚动
		 $(".bg").animate({opacity:'0.6'},500)
		 document.getElementById("pageTable").style.display ="none";
		
		 setTimeout("removeLoad1()",500);
	}
	
	function removeLoad1(){
		//todo 加载数据
	
	 	if($("#sbjg option:selected").text()=="未申报"){
			$(".Table02").hide();
			$(".Table06").show();
			if(<%=application.getAttribute("tjzt")%>==1){
				$(".Table06 #dataTr1").hide();
				$(".Table06 #dataTr3 td").eq(0).text("1");
				$(".Table06 #dataTr4 td").eq(0).text("2");
		//		$(".Table06 #dataTr5 td").eq(0).text("4");
		//		$(".Table06 #dataTr6 td").eq(0).text("5");
		//		$(".Table06 #dataTr7 td").eq(0).text("6");
				$(".font01").text("2");
			 }else{
				 $(".Table06 #dataTr1").show();
				 $(".Table06 #dataTr3 td").eq(0).text("2");
				 $(".Table06 #dataTr4 td").eq(0).text("3");
		//		 $(".Table06 #dataTr5 td").eq(0).text("5");
			//	 $(".Table06 #dataTr6 td").eq(0).text("6");
		//		 $(".Table06 #dataTr7 td").eq(0).text("7");
				 $(".font01").text("3");
			 }
		}else{
			$(".Table06").hide();
			$(".Table02").show();
			$(".font01").text("1");
		}
	 	document.getElementById("pageTable").style.display =""; 
		$(".bg").remove();
	}
	
	
	function clickBd(url){
			
		window.parent.clikcMenu(url,"申报补打");
	}
	
	function selectSBJG(){
		if($("#sbjg option:selected").text()=="未申报"){
			$(".sb").attr("disabled","true");
			$("#sb01").attr("disabled","true");
			$("#sb02").attr("disabled","true");
			$("#sb03").attr("disabled","true");
		}else{
			$(".sb").removeAttr("disabled");
			$("#sb01").removeAttr("disabled");
			$("#sb02").removeAttr("disabled");
			$("#sb03").removeAttr("disabled");
		}
	}
	
	function setDate(num){
		var date=new Date();
		var day=date.getDate();
		var temp="";
		if(day<10){
			temp="0";
		}
		if(num==1&&$("#sb1").is(":checked")){
			$("#sb02").val("2015-10-"+temp+day);
			$("#sb03").val("2015-11-"+temp+day);
			$("#sb12").val("2015-10-01");
			$("#sb13").val("2015-10-31");
			$("#sb2").attr("checked",false);
		}else if(num==2&&$("#sb2").is(":checked")){
			$("#sb02").val("2015-09-"+temp+day);
			$("#sb03").val("2015-11-"+temp+day);
			$("#sb1").attr("checked",false);
		}
	}
</script>
<title>申报结果查询</title>
</head>

<body>
<div class="TableBox">
 
   <div class="Tableh2">
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="10%"><strong>查询条件</strong></td>
    <td><table border="0" align="right" cellpadding="0" cellspacing="2">
      <tr>
        <td><a style='cursor:default' class="btn01 more_search">更多></a>
        <script>
        $(document).ready(function(e) {
          $(".more_search").click(function(){
			  $(".last_line").fadeToggle()
			  })  
        });
        </script>
        </td>
        <td></td>
      </tr>
    </table></td>
  </tr>
</table>
  </div>
   <div class="Table03">
     <table width="100%" border="0" cellspacing="6" cellpadding="0">
           <tr>
             <td><div class="inputbox inputbox2">
               <table width="100%" border="0" cellspacing="0" cellpadding="0">
                 <tr>
                   <td width="1" class="inputtxt">纳税人识别号:</td>
                   <td><input type="text" class="input02 "  style="width:100%" value="440100123456789"></td>
                 </tr>
               </table>
             </div></td>
          
             
              <td colspan="2"><div class="inputbox inputbox2">
               <table width="100%" border="0" cellspacing="0" cellpadding="0">
                 <tr>
                   <td width="1" class="inputtxt">纳税人名称:</td>
                   <td><input type="text" class="input02" style="width:100%" value="广东省国家税务局电子税务局测试用户"></td>
                 </tr>
               </table>
             </div></td>
             <!-- <td><div class="inputbox">
               <table width="100%" border="0" cellspacing="0" cellpadding="0">
                 <tr>
                   <td width="1" class="inputtxt">税款所属期起:</td>
                   <td><input type="text" class="input02" style="width:100%"></td>
                 </tr>
               </table>
             </div></td> -->
             
             <td></td>
           </tr>
           
           <tr>
             <td width="30%" ><div class="inputbox">
               <table width="100%" border="0" cellspacing="0" cellpadding="0">
                 <tr>
                   <td width="1" class="inputtxt">申报时间:</td>
                   <td align="center"><table  border="0" height="27" cellspacing="0"cellpadding="0">
                         <tr>
                         <td width="6"></td>
                           <td valign="middle" ><input  class="sb" type="radio"   id="sb1" checked="checked" onclick="setDate(1)" ></td>
                           <td>&nbsp;&nbsp;最近一个月 </td>
                           <td width="6"></td>
                           <td valign="middle"><input   class="sb" type="radio"   id="sb2" onclick="setDate(2)" ></td>
                           <td>&nbsp;&nbsp;最近二个月</td>
                         </tr>
                       </table></td>
                 </tr>
               </table>
             </div></td>
             
             
              <td width="30%"><div class="inputbox">
               <table width="100%" border="0" cellspacing="0" cellpadding="0">
                 <tr>
                   <td width="1" class="inputtxt">申报税种:</td>
                   <td><select class="select01" name=""  id="sb01">
                   			<option>---请选择---</option>
                   				<option>增值税</option>
                   				<option>消费税</option>
                   				<option>企业所得税</option>
                   			</select></td>
                 </tr>
               </table>
             </div></td>
             <td width="20%"><div class="inputbox">
               <table width="100%" border="0" cellspacing="0" cellpadding="0">
                 <tr>
                   <td width="1" class="inputtxt">申报结果:</td>
                   <td><select class="select01" name=""  id="sbjg" onchange="selectSBJG()">
                   				<option >已申报</option>
                   				<option >未申报</option>
                   			</select>
                   </td>
                 </tr>
               </table>
             </div></td>
             
             <td width="20%"> <div class="btnbox" style="float:center">
         <button type="button" class="btn btn_success" onclick="checkFormAjax();">查 询</button>
    <button type="button" class="btn btn_qx">重 置</button>
    
      </div></td>
           </tr> 
           
          <tr class="last_line" style="display:none">
             <td><div class="inputbox">
               <table width="100%" border="0" cellspacing="0" cellpadding="0">
                 <tr>
                   <td width="1" class="inputtxt">申报时间起:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                   <td><input type="text" class="Wdate input02" style="width:100%" id="sb02"  onClick="WdatePicker()" ></td>
                 </tr>
               </table>
             </div></td>
             
             
              <td><div class="inputbox">
               
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                 <tr>
                   <td width="1" class="inputtxt">申报时间止:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                   <td><input type="text" class="Wdate input02" style="width:100%" id="sb03" onClick="WdatePicker()" ></td>
                </tr>
               </table>
             </div></td>
             <td></td>
             
             <td width="160">&nbsp;</td>
           </tr> 
           <tr class="last_line" style="display:none">
             <td><div class="inputbox">
               
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                 <tr>
                   <td width="1" class="inputtxt">税款所属期起:&nbsp;&nbsp;</td>
                   <td><input type="text" class="Wdate input02" style="width:100%" onClick="WdatePicker()" id="sb12"</td>
                 </tr>
               </table>
             </div></td>
             
             
              <td><div class="inputbox">
               
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                 <tr>
                   <td width="1" class="inputtxt">税款所属期止:&nbsp;&nbsp;</td>
                   <td><input type="text" class="Wdate input02" style="width:100%" onClick="WdatePicker()" id="sb13"></td>
                 </tr>
               </table>
             </div></td>
             <td>&nbsp;</td>
             
             <td></td>
           </tr>
         </table>
         
     
  </div>
  <div class="Tableh2"><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><strong>查询结果</strong></td>
    <td><table border="0" align="right" cellpadding="0" cellspacing="2">
      <tr>
        
      </tr>
    </table></td>
  </tr>
</table>
</div>
  <div class="Table02">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <th style="text-align:center" width="10px">序号</th>
    <th align="left">税（费）种</th>
    <th align="left">凭证种类</th>
    <th align="left">应征凭证序号</th>
    <th align="left">税款所属期起 </th>
    <th align="left">税款所属期止</th>
    <th align="left">计税依据</th>
    <th align="left">应纳税额</th>
    <th align="left">应补退税额</th>
    <th align="left">申报时间 </th>
    <th align="left">操作</th>
    
  </tr>
  <tr style="display:none" id="dataTr1">
  <td align="center">1</td>
    <td>增值税</td>
    <td width="180px">《增值税纳税申报表（一般纳税人适用）》</td>
    <td align="center">10015215000003681650</td>
    <td align="center">2015-10-01</td>
    <td align="center">2015-10-31</td>
    <td align="right">80,000.00</td>
    <td align="right">1100.00</td>
    <td align="right">1100.00</td>
     <td align="center" id="sbsjTd1"></td>
    <td style="background-position: center;"><a class="btn1 btn_01" onclick="clickBd('table01/bd.jsp');" href="#">补打</a> </td>
  </tr>
   <tr style="display:none" id="dataTr2">
   <td align="center">2</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
     <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td><a class="btn1 btn_01" href="#">补打</a> </td>
  </tr>
   <tr style="display:none" id="dataTr3">
   <td align="center">3</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
     <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td><a class="btn1 btn_01" href="#">补打</a> </td>
  </tr> 
  <tr style="display:none" id="dataTr4">
  <td align="center">4</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td><a class="btn1 btn_01" href="#">补打</a> </td>
  </tr>
   <tr style="display:none" id="dataTr5">
  <td align="center">5</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td><a class="btn1 btn_01" href="#">补打</a> </td>
  </tr>
   <tr style="display:none" id="dataTr6">
  <td align="center">6</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td><a class="btn1 btn_01" href="#">补打</a> </td>
  </tr>
    </table>

 
  </div>
  <div class="Table06">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="dataTable">
  <tr>
  	<th style="text-align:center" width="10px">序号</th>
    <th align="center">申报表</th>
    <th align="center">申报情况 </th>
    <th align="center">税款所属期起 </th>
    <th align="center">税款所属期止</th>
    <th align="center">申报截止日期</th>
    <th align="center">申报期限</th>
    </tr>
  <tr  id="dataTr1">
  		<td align="center">1</td>
	    <td style="color:red">增值税一般纳税人申报</td>
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
  <tr style="display: none;" id="dataTr2">
  		<td  align="center">2</td>
	    <td class="tjzt00">增值税一般纳税人申报</td>
	    <td class="tjzt00" align="center" >未申报 </td>
	    <td class="tjzt00" align="center" >2015-09-01</td>
	    <td class="tjzt00" align="center" >2015-09-30</td>
	    <td class="tjzt00" align="center" >2015-10-20</td>
	    <td class="tjzt00"  align="center" >按月</td>
	    <!--<td class="tjzt02"><a class="btn1 btn_02" href="#">查看</a> <a class="btn1 btn_02" href="#">作废</a> <a class="btn1 btn_02" href="#" onClick="jk();">缴款</a> <a class="btn1 btn_02" href="#">更正</a></td> -->
	 
    </tr>
    <tr  id="dataTr3">    
    <td align="center">3</td>
  <td style="color:red">酒及酒精消费税申报</td>
	    <td class="tjzt01" align="center" style="color:red">未申报 </td>
	    <td class="tjzt01" align="center" style="color:red">2015-10-01</td>
	    <td class="tjzt01" align="center" style="color:red">2015-10-31</td>
	    <td class="tjzt01" align="center" style="color:red">2015-11-16</td>
	    <td class="tjzt01"  align="center" style="color:red">按月</td>
    <!--<td><a class="btn1 btn_02" href="#">查看</a> <a class="btn1 btn_02" href="#">作废</a> <a class="btn1 btn_02" href="#" onClick="jk();">缴款</a> <a class="btn1 btn_02" href="#">更正</a></td> -->
    </tr>
    <tr  id="dataTr4">
    <td align="center">4</td>
  <td style="color:red">居民企业所得税月(季)度预缴纳税申报(适用查账征收)</td>
	    <td class="tjzt01" align="center" style="color:red">未申报 </td>
	    <td class="tjzt01" align="center" style="color:red">2015-10-01</td>
	    <td class="tjzt01" align="center" style="color:red">2015-10-31</td>
	    <td class="tjzt01" align="center" style="color:red">2015-11-16</td>
	    <td class="tjzt01"  align="center" style="color:red">按月</td>
    <!--<td><a class="btn1 btn_02" href="#">查看</a> <a class="btn1 btn_02" href="#">作废</a> <a class="btn1 btn_02" href="#" onClick="jk();">缴款</a> <a class="btn1 btn_02" href="#">更正</a></td> -->
    </tr>
    <tr style="display: none;" id="dataTr5">
    <td align="center">5</td>
  <td>文化事业建设费申报</td>
	    <td class="tjzt01" align="center" >未申报 </td>
	    <td class="tjzt01" align="center" >2015-09-01</td>
	    <td class="tjzt01" align="center" >2015-09-30</td>
	    <td class="tjzt01" align="center" >2015-10-20</td>
	    <td class="tjzt01"  align="center" >按月</td>
    <!--<td><a class="btn1 btn_02" href="#">查看</a> <a class="btn1 btn_02" href="#">作废</a> <a class="btn1 btn_02" href="#" onClick="jk();">缴款</a> <a class="btn1 btn_02" href="#">更正</a></td> -->
    </tr>
  
    <tr style="display: none;" id="dataTr6">
    <td align="center">6</td>
  <td>教育费附加申报</td>
	    <td class="tjzt01" align="center" >未申报 </td>
	    <td class="tjzt01" align="center" >2015-09-01</td>
	    <td class="tjzt01" align="center" >2015-09-30</td>
	    <td class="tjzt01" align="center" >2015-10-20</td>
	    <td class="tjzt01"  align="center" >按月</td>
    <!--<td><a class="btn1 btn_02" href="#">查看</a> <a class="btn1 btn_02" href="#">作废</a> <a class="btn1 btn_02" href="#" onClick="jk();">缴款</a> <a class="btn1 btn_02" href="#">更正</a></td> -->
    </tr>
    <tr style="display: none;" id="dataTr7">
    <td align="center">7</td>
  <td>废弃电器电子产品处理基金申报</td>
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
       <table width="100%" border="0" cellspacing="0" cellpadding="0" id="pageTable" style="display:none">
  <tr>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;总共<span class="font01">1 </span>条信息</td>
    <td align="right">
        <div class="pagebut" >
        <ul><span>< 上一页</span>
             <li class="lihover">1</li
             <span>下一页 ></span>
        </ul>     
        </div>
    </td>
  </tr>
</table>

  </div>
</div>
</body>
</html>
