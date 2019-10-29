<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String ctx = request.getContextPath();
%>
<meta charset="utf-8">
<link href="<%=ctx%>/css/comon.css" rel="stylesheet" type="text/css" />
<link href="<%=ctx%>/css/index.css" rel="stylesheet" type="text/css" />
<link href="<%=ctx%>/css/font.css" rel="stylesheet" type="text/css" />
<link href="<%=ctx%>/css/tab_css.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="<%=ctx%>/js/jquery-easyui-1.5/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=ctx%>/js/jquery-easyui-1.5/themes/icon.css">
<style type="text/css">
.td1 {
	text-align: right;
	width: 120px;
}
.td2 {
	text-align: right;
	width: 200px;
}
</style>

<SCRIPT language=JavaScript src="<%=ctx%>/js/jquery.js"></SCRIPT>
<SCRIPT language=JavaScript src="<%=ctx%>/js/js.js"></SCRIPT>
<script src="<%=ctx%>/js/Njs.js" type="text/jscript"></script>
<script type="text/javascript" src="<%=ctx%>/js/jquery-easyui-1.5/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=ctx%>/js/jquery-easyui-1.5/jquery.easyuiext.js"></script>
<script type="text/javascript" src="<%=ctx%>/js/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script type="text/javascript" src="<%=ctx%>/js/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
<script type="text/javascript">

$(document).ready(function () {
	$("#jlForm").form({    
		  url:"<%=ctx%>/zpjlxq/save.do",   
	      success:function(data){    
	    	  if(data=='SUCCESS'){
	    		  alert("您的简历提交成功！");
	    		  location.href='<%=ctx%>/zp/zprn/init.do';
	    	  }else{
	    		  alert("您的简历提交失败，请联系系统管理员！");
	    	  }
	     }    
	});   
	
});

</script>
<title>应聘简历提交</title>
</head>

<body>

	<form id="jlForm"  method="post" enctype="multipart/form-data"> 
		<table widtd="100%" border="0" cellspacing="6" cellpadding="0" style="padding-left: 10px;">
			<tr>
				<td class="td1">应聘职位：</td>
				<td colspan="3" style="text-align: left;">
					<input type="text" id="rpzhiwei" name="rpzhiwei" class="select01" value="${vo.rpzhiwei}" readonly> 
					<input type="hidden" id="zpjhid" name="zpjhid" value="${vo.zpjhid}"> 
					<input type="hidden" id="gwlx" name="gwlx" value="${vo.gwlx}"> 
					<input type="text" id="rpzhiweiid" name="rpzhiweiid" value="${vo.rpzhiweiid}" style="display: none">
					<input type="text" id="zpzttitle" name="zpzttitle" style="display: none"> 
					<input type="text" id="zpztid" name="zpztid" size="20" style="display: none"></td>
			</tr>
			<tr>
				<td class="td1">姓名<span style="color: red;">*</span>：</td>
				<td>
					<input name="username" type="text" id="username" class="select01" required></td>
				<td class="td2">性别<span style="color: red;">*</span>：</td>
				<td>
					<select name="xb" id="xb" class="select01">
						<option value="男">男</option>
						<option value="女">女</option>
				</select> </td>
			</tr>
			<tr>
				<td class="td1">出生日期<span style="color: red;">*</span>：</td>
				<td>
					<input name="csrq" type="date" id="csrq" class="select01" required></td>
				<td class="td2">出生地：</td>
				<td>
					<input name="csd" type="text" id="csd" class="select01"></td>
			</tr>
			<tr>
				<td class="td1">籍贯<span style="color: red;">*</span>：</td>
				<td>
					<input name="jg" type="text" id="jg" class="select01"></td>
				<td class="td2">民族：</td>
				<td>
					<select name="mz" class="select01" id="mz" required>
						<option value="">---请选择---</option>
						<c:forEach items="${mz}" var="mz">					
							<option value="${mz.id}">${mz.name}</option>
						</c:forEach>
					</select></td>
			</tr>
			<tr>
				<td class="td1">身份证件类型<span style="color: red;">*</span>：</td>
				<td>
					<select name="sfzlx" class="select01" id="sfzlx" required>
						<option value="">---请选择---</option>
						<c:forEach items="${sfzlx}" var="sfzlx">					
							<option value="${sfzlx.id}">${sfzlx.name}</option>
						</c:forEach>
					</select></td>
				<td class="td2">身份证件号码<span style="color: red;">*</span>：</td>
				<td>
					<input name="sfzhm" type="text" id="sfzhm" class="select01" required></td>
			</tr>
			<tr>
				<td class="td1">户籍所在地：</td>
				<td>
					<input name="hjdz" type="text" id="hjdz" class="select01"></td>
				<td class="td2">婚姻状况：</td>
				<td>
					<select name="hyzk" id="hyzk" class="select01">
						<option value="已婚">已婚</option>
						<option value="未婚">未婚</option>
						<option value="离异">离异</option>
					</select> </td>
			</tr>
			<tr>
				<td class="td1">政治面貌<span style="color: red;">*</span>：</td>
				<td>
					<select name="zzmm" class="select01" id="zzmm" required>
						<option value="">---请选择---</option>
						<c:forEach items="${zzmm}" var="mzdp">					
							<option value="${mzdp.id}">${mzdp.name}</option>
						</c:forEach>
					</select></td>
				<td class="td2">入党（团）时间：</td>
				<td>
					<input name="rdsj" type="date" id="rdsj" class="select01"></td>
			</tr>
			<tr>
				<td class="td1">执（职）业资格：</td>
				<td>
					<input name="zyzg" type="text" id="zyzg" class="select01" ></td>
				<td class="td2">资格取得时间：</td>
				<td>
					<input name="zyzgsj" type="date" id="zyzgsj"  class="select01" ></td>
			</tr>
			<tr>
				<td class="td1">参加工作时间：</td>
				<td>
					<input name="cjgzsj" type="date" id="cjgzsj" class="select01"> </td>
				<td class="td2">从教时间：</td>
				<td>
					<input name="cjsj" type="date" id="cjsj" class="select01"></td>
			</tr>
			<tr>
				<td class="td1">第一学历：</td>
				<td>
					<select name="dyxlxw" class="select01" id="dyxlxw">
						<option value="">---请选择---</option>
						<c:forEach items="${xl}" var="xl">					
							<option value="${xl.id}">${xl.name}</option>
						</c:forEach>
					</select></td>
				<td class="td2">第一学历毕业学校：</td>
				<td>
					<input type="text" id="dyxlxx" name="dyxlxx" class="select01"></td>
			</tr>
			<tr>
				<td class="td1">第一学历专业：</td>
				<td>
					<input type="txet" id="dyxlzy" name="dyxlzy" class="select01"></td>
				<td class="td2">在校时间：</td>
				<td>
					<input type="date" id="dyxlkssj" name="dyxlkssj" class="select01"> — 
					<input type="date" id="dyxljssj" name="dyxljssj" class="select01"></td>
			</tr>
			<tr>
				<td class="td1">最高学历<span style="color: red;">*</span>：</td>
				<td>
					<select name="zgxlxw" class="select01" id="zgxlxw" required>
						<option value="">---请选择---</option>
						<c:forEach items="${xl}" var="xl">					
							<option value="${xl.id}">${xl.name}</option>
						</c:forEach>
					</select></td>
				<td class="td2">最高学历毕业学校<span style="color: red;">*</span>：</td>
				<td>
					<input type="text" id="zgxlxx" name="zgxlxx" class="select01" required></td>
			</tr>
			<tr>
				<td class="td1">最高学历专业：</td>
				<td>
					<input type="txet" id="sxzy" name="sxzy" class="select01"></td>
				<td class="td2">在校时间：</td>
				<td>
					<input type="date" id="zgxlkssj" name="zgxlkssj" class="select01"> — 
					<input type="date" id="zgxljssj" name="zgxljssj" class="select01"></td>
			</tr>
			<tr>
				<td class="td1">所属学科：</td>
				<td>
					<input type="text" id="xueke" name="xueke" class="select01"></td>
				<td class="td2">普通话水平：</td>
				<td>
					<select name="ptdsp" class="select01" id="ptdsp">
						<option value="">---请选择---</option>
						<c:forEach items="${dywydj}" var="ptdsp">					
							<option value="${ptdsp.id}">${ptdsp.name}</option>
						</c:forEach>
					</select></td>
			</tr>
			<tr>
				<td class="td1">第一外语：</td>
				<td>
					<select name="dywy" class="select01" id="dywy">
						<option value="">---请选择---</option>
						<c:forEach items="${dywy}" var="dywy">					
							<option value="${dywy.id}">${dywy.name}</option>
						</c:forEach>
					</select></td>
				<td class="td2">第一外语水平：</td>
				<td>
					<select name="wyslcd" class="select01" id="wyslcd">
						<option value="">---请选择---</option>
						<c:forEach items="${dywydj}" var="dywydj">					
							<option value="${dywydj.id}">${dywydj.name}</option>
						</c:forEach>
					</select></td>
			</tr>
			<tr>
				<td class="td1">第一学历211<span style="color: red;">*</span>：</td>
				<td>
					<select id="dy211" name="dy211" class="select01">
						<option value="是">是</option>
						<option value="否">否</option>
				</select></td>
				<td class="td2">最高学历211<span style="color: red;">*</span>：</td>
				<td><select id="zg211" name="zg211" class="select01">
						<option value="是">是</option>
						<option value="否">否</option>
				</select></td>
			</tr>
			<tr>
				<td class="td1">应聘部门：</td>
				<td>
					<input type="text" id="ssbmid" name="ssbmid" style="display: none;" value="${vo.ssbmid}"  readonly>
					<input type="text" id="ssbm" name="ssbm" class="select01" value="${vo.ssbm}"  readonly></td>
				<td class="td2">岗位类型：</td>
				<td>
					<input type="text" id="rpganwei" name="rpganwei" class="select01" readonly></td>
			</tr>
			<tr>
				<td class="td1">职务：</td>
				<td>
					<input name="zw" type="text" id="zw" class="select01"></td>
				<td class="td2">职称：</td>
				<td>
					<input name="zc" type="text" id="zc" class="select01"></td>
			</tr>
			<tr>
				<td class="td1">岗位等级：</td>
				<td>
					<select name="gwdj" class="select01" id="gwdj">
						<option value="">---请选择---</option>
						<c:forEach items="${gwdj}" var="gwdj">					
							<option value="${gwdj.id}">${gwdj.name}</option>
						</c:forEach>
					</select></td>
				<td class="td2">研究生导师：</td>
				<td>
					<input name="yjsds" type="text" id="yjsds" class="select01"></td>
			</tr>
			<tr>
				<td class="td1">有何特长：</td>
				<td>
					<input name="tc" type="text" id="tc" class="select01"></td>
				<td class="td2">档案保管单位：</td>
				<td>
					<input name="rsdadw" type="text" id="rsdadw" class="select01"></td>
			</tr>
			<tr>
				<td class="td1">联系电话<span style="color: red;">*</span>：</td>
				<td>
					<input name="sj" type="text" id="sj" class="select01" required></td>
				<td class="td2">QQ号码：</td>
				<td>
					<input name="qq" type="text" id="qq" class="select01"></td>
			</tr>
			<tr>
				<td class="td1">邮箱<span style="color: red;">*</span>：</td>
				<td>
					<input name="yx" type="email" id="yx" class="select01" required></td>
				<td class="td2">邮编：</td>
				<td>
					<input name="youbian" type="text" id="youbian" class="select01"></td>
			</tr>
			<tr>
				<td class="td2">通讯住址：</td>
				<td>
					<input name="txdz" type="text" id="txdz" class="select01"></td>
			</tr>
			<tr height="110px">
				<td class="td1">简历：</td>
				<td colspan=3>
					<textarea id="jianli" name="jianli" rows="6" cols="100" class="select01" style="width: 492px"></textarea></td>
			</tr>
			<tr height="110px">
				<td>工作经历与业绩：</td>
				<td colspan=3>
					<textarea id="chengji" name="chengji" rows="6" cols="100" class="select01" style="width: 492px"></textarea></td>
			</tr>
			<tr>
				<td class="td1">附件：</td>
				<td colspan=3 class="select01">
					<input class="easyui-filebox" id="uploadId" name="sourceFile" style="width:250px"
						data-options="multiple:true,buttonText:'浏览'">
				</td>
			</tr>
		</table>
		
		<div class="btnbox" style="margin: 20px;">
			<button type="submit" class="btn btn_success" >提交</button>
			<button type="button" class="btn btn_success" onClick="location='zpjihua.html'">关闭</button>
		</div>
	</form>



</body>
</html>