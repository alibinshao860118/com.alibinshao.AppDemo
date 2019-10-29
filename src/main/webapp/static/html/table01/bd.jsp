<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="javascript">
	zoom=100;
	function prevPage(){pdffile.gotoPreviousPage();};
	function nextPage(){pdffile.gotoNextPage();};
	function print(){pdffile.print();};
	function setZoomIn(){if(zoom<400){zoom = zoom+10;}pdffile.setZoom(zoom);};
	function setZoomOut(){if(zoom>10){zoom = zoom-10;}pdffile.setZoom(zoom);};
</script>
</head>
<body style="overflow-x:hidden;overflow-y:hidden;border:0;margin:0;">
<div id="downAcrobat" style="display:none;line-height:30px;margin:30px 50px">您未能正常预览报表，可能原因及解决方法如下：<br/>1.如果您安装了Adobe Reader。需要手动打开Adobe Reader阅读器，然后点击工具栏【帮助】->【修复Adobe Reader安装】，等会修复成功后重试。<br/>2.如果您没有安装Adobe Reader。请点击<a href='http://www.gdltax.gov.cn/download/dzbsdt/Adobe%20Reader%20XI_11.0.exe'>这里</a>下载Adobe Reader，安装成功后重试。</div>
<object id="pdffile" style="display:none;width:100%;height:600px;" classid="clsid:CA8A9780-280D-11CF-A24D-444553540000">
<param name="SRC" value="../../pdf/bd.pdf" />
</object></body>
	<%
	//webBrowser.setHTMLContent(content.toString());
	%>
<script language="javascript">
try{
	oAcro7=new ActiveXObject("AcroPDF.PDF.1");
	document.all[oAcro7?"pdffile":"downAcrobat"].style.display="block";
	}catch(e){
		//document.all["downAcroba"].style.display="block";
		}
pdffile.setView("fitW");pdffile.setView("fitH");pdffile.setShowToolbar(false);
pdffile.setPageMode("none");pdffile.setLayoutMode("SinglePage");
</script>
</html>