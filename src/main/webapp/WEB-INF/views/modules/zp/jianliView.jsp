<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<link href="${ctxStatic}/css/comon.css" rel="stylesheet" type="text/css" />
<link href="${ctxStatic}/css/index.css" rel="stylesheet" type="text/css" />
<link href="${ctxStatic}/css/font.css" rel="stylesheet" type="text/css" />
<link href="${ctxStatic}/css/tab_css.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="${ctxStatic}/js/jquery-easyui-1.5/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${ctxStatic}/js/jquery-easyui-1.5/themes/icon.css">
<SCRIPT language=JavaScript src="${ctxStatic}/js/jquery.js"></SCRIPT>
<SCRIPT language=JavaScript src="${ctxStatic}/js/js.js"></SCRIPT>
<script src="${ctxStatic}/js/Njs.js" type="text/jscript"></script>
<SCRIPT language=JavaScript src="${ctxStatic}/js/layer-v2.2/layer/layer.js"></script>
<SCRIPT language=JavaScript src="${ctxStatic}/js/laydate-v1.1/laydate/laydate.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/jquery-easyui-1.5/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/jquery-easyui-1.5/jquery.easyuiext.js"></script>

<script type="text/javascript">

	$(document).ready(function () {
		$("input").attr("disabled","disabled");
		$("textarea").attr("disabled","disabled");
		$("select").attr("disabled","disabled");
		
		$.get("${ctx}/zpjlxq/findById?id=${vo.id}",function(data){
			$("#jlForm").form("load",data)
		});
		
		//控制是否显示修改按钮
		$.post("${ctx}/zp/zpZpjh/checkStop",{zpjhid:'${vo.zpjhid}'},function(data){
			if(data.isExsits){
				//报名已经截止
				
			}else{
				$("#update_btn").show();
			}
		});
	});

</script>
<STYLE>
input {width: 85%;}
.bg1 table{margin:20px 5px;width:85%;}
.bg1 table td{border: 1px solid #400040;font-size: 13px;text-align:left;height:35px;padding:0px 5px;}
.bg1 table th{border: 1px solid #400040;text-align:center;font-size: 13px;height:35px;padding:0px 5px;}
.bg2 table td{border: 0px solid #400040;font-size: 13px;text-align:left;height:35px;padding:0px 5px;}
.bg2 table th{border: 0px solid #400040;text-align:center;font-size: 13px;height:35px;padding:0px 5px;}

.bt1 {margin:10px 25px 5px;font-size: 21px;color: #0080c0;font-weight:bold;text-align:center;}
</STYLE>
<title>查看简历详情</title>
</head>

<body style="padding: 10px;">

<div class="bt1">湖南省事业单位公开招聘人员报名表</div>     

<div id="data1" class="bg1" align="center">
    <!-- <form name="form" method="post" action="" id="form" onSubmit=""> -->
    <form id="jlForm"  method="post" enctype="multipart/form-data">
	<input type="hidden" id="zpjhid" name="zpjhid" value="${vo.zpjhid}"> 
	<input type="hidden" id="zpjhmc" name="zpjhmc" value="专职教师招聘">
	<input type="hidden" id="zpxqid" name="zpxqid" value="1">
	<input type="hidden" id="nl" name="nl" value="">
	<input type="hidden" id="password" name="password" value="111111">
	<input type="text" id="rpzhiweiid" name="rpzhiweiid" value="${vo.rpzhiweiid}" style="display: none">
	<input type="text" id="zpzttitle" name="zpzttitle" style="display: none"> 
	<input type="text" id="zpztid" name="zpztid" size="20" style="display: none">
    <input type="text" id="ssbmid" name="ssbmid" style="display: none;" value="${vo.ssbmid}"  readonly>
    <TABLE border="1" cellspacing="0" cellpadding="0" align=center>
        <tr><th style="width:10%;">姓    名</th><td style="width:14%;"><input name="username" type="text" id="username" required></td>
            <th style="width:14%;">性    别</th>
            <td style="width:14%;">
            <select name="xb" id="xb"  style="width:50px;">
                <option value="男">男</option><option value="女">女</option></select>
                </td>
            <th style="width:12%;">民    族</th>
            <td style="width:10%;">
            	<select name="mz" id="mz" >
						<option value="">---请选择---</option>
						<c:forEach items="${mz}" var="mz">					
							<option value="${mz.id}">${mz.name}</option>
						</c:forEach>
					</select></td>
            <td rowspan="6"></td></tr>
        <tr><th>应聘职位</th><td><input type="text" id="rpzhiwei" name="rpzhiwei" value="${vo.rpzhiwei}" readonly>
			<th>应聘部门</th><td><input type="text" id="ssbm" name="ssbm" value="${vo.ssbm}" readonly></td>
			<th>岗位类型</th><td><input type="text" id="gwlx" name="gwlx" value="${vo.gwlx}" readonly></td></tr>			
        <!--  <tr><th>出生年月</th><td><input name="csrq" type="date" id="csrq" required></td>-->
        <tr><th>出生年月</th><td><input  id="csrq" name="csrq" class="input01css" type="text" value ="" required onFocus="laydate({istime: true, format: 'YYYY-MM-DD'})"></td>
        
        
            <th>政治面貌</th><td>
            		<select name="zzmm"  id="zzmm" style="width:100px;" required>
						<option value="">---请选择---</option>
						<c:forEach items="${zzmm}" var="mzdp">					
							<option value="${mzdp.id}">${mzdp.name}</option>
						</c:forEach>
					</select></td>
            <th>入党（团）时间</th><td><input  id="rdsj" name="rdsj" class="input01css" type="text" value =""  onFocus="laydate({istime: true, format: 'YYYY-MM-DD'})"></td></tr>
        <tr><th>籍贯</th><td><input name="jg" type="text" id="jg"></td>            
            <th>户籍所在地</th><td  colspan="3">
            <input name="hjdz" type="text" id="hjdz"></td></tr> 
        <tr><th colspan="2">职称、执（职）业资格</th><td colspan="2">
        	<input name="zyzg" type="text" id="zyzg" ></td>
            <th>取得时间</th><td><input  id="zyzgsj" name="zyzgsj" class="input01css" type="text" value =""  onFocus="laydate({istime: true, format: 'YYYY-MM-DD'})"></td></tr>       
        <tr>
            <th colspan="2">档案保管单位</th><td colspan="2"><input name="rsdadw" type="text" id="rsdadw"></td>
            <th>婚姻状况</th><td>
            <select name="hyzk" id="hyzk"  style="width:80px;">
                <option value="已婚">已婚</option><option value="未婚">未婚</option>
                <option value="离异">离异</option>
                </select></td></tr>
        <tr><!-- <th>第一学历211</th><td><select id="dy211" name="dy211" style="width:50px;">
                <option value="是">是</option><option value="否">否</option></select><span style="color: red;"></span></td>
			<th>最高学历211</th><td><select id="zg211" name="zg211" style="width:50px;">
                <option value="是">是</option><option value="否">否</option></select><span style="color: red;"></span></td> -->
			<th>第一外语</th><td colspan="6"><input type="text" id="dywy" name="dywy" style="width:200px"></td></tr>
        <tr><th>第一学历</th><td>
       			 <select name="dyxlxw" style="width:100px;" id="dyxlxw" required>
						<option value="">---请选择---</option>
						<c:forEach items="${xl}" var="xl">					
							<option value="${xl.id}">${xl.name}</option>
						</c:forEach>
				</select>
        	<span style="color: red;"></span></td>
        	<th>第一学历毕业学校</th><td><input type="text" id="dyxlxx" name="dyxlxx" required><span style="color: red;"></span></td>
			<th>在校时间</th><td colspan="2"><input  id="dyxlrxsj" name="dyxlrxsj" class="input01css" type="text" value =""  
				onFocus="laydate({istime: true, format: 'YYYY-MM-DD'})" style="width:120px;" required><span style="color: red;"></span>——<input  id="dyxlbysj" name="dyxlbysj" class="input01css" type="text" value ="" 
				 onFocus="laydate({istime: true, format: 'YYYY-MM-DD'})" style="width:120px;" required><span style="color: red;"></span></td>
	    <tr><th>最高学历</th><td>
	    		<select name="zgxlxw" style="width:100px;" id="zgxlxw" required>
						<option value="">---请选择---</option>
						<c:forEach items="${xl}" var="xl">					
							<option value="${xl.id}">${xl.name}</option>
						</c:forEach>
					</select><span style="color: red;"></span></td>
			<th>最高学历毕业学校</th><td><input name="zgxlxx" type="text" id="zgxlxx" required><span style="color: red;"></span></td>
			<th>在校时间</th><td colspan="2"><input  id="zgxlrxsj" name="zgxlrxsj" class="input01css" type="text" 
				value =""  onFocus="laydate({istime: true, format: 'YYYY-MM-DD'})" style="width:120px;" required><span style="color: red;"></span>——<input  id="zgxlbysj" name="zgxlbysj" 
					class="input01css" type="text" value =""  onFocus="laydate({istime: true, format: 'YYYY-MM-DD'})" style="width:120px;" required><span style="color: red;"></span></td></tr>
		<tr><th>第一学历专业</th><td><input type="text" id="dyzy" name="dyzy" required><span style="color: red;"></span></td>
		    <th>最高学历专业</th><td><input type="text" id="sxzy" name="sxzy" required><span style="color: red;"></span></td>
		    <th>所属学科</th><td colspan="2"><input type="text" id="xueke" name="xueke" required><span style="color: red;"></span></td></tr>
		<tr><th>有何特长:</th><td><input name="tc" type="text" id="tc"></td>
            <th>身份证件类型</th><td>
					<select name="sfzlx" style="width:110px;" id="sfzlx" required>
						<option value="">---请选择---</option>
						<c:forEach items="${sfzlx}" var="sfzlx">					
							<option value="${sfzlx.id}">${sfzlx.name}</option>
						</c:forEach>
					</select>
					<span style="color: red;"></span></td>
            <th>身份证号</th><td colspan="2"><input name="sfzhm" type="text" id="sfzhm" required><span style="color: red;"></span></td></tr>    
        <tr><th>通讯地址</th><td colspan="4"><input name="txdz" type="text" id="txdz" style="width:90%;" required></td>
            <th>邮政编码</th><td><input name="youbian" type="text" id="youbian"></td></tr>
        <tr><th>联系电话</th><td><input name="sj" type="text" id="sj" required></td>
            <th>QQ号码:</th><td><input name="qq" type="text" id="qq"></td>
            <th>EMAIL</th><td colspan="2"><input name="yx" type="text" id="yx" required></td></tr> 
        <tr>
        	<th style="height:160px;">简历</th>
        	<td colspan="6">
        		<textarea id="jianli" name="jianli" rows="6" cols="100"></textarea>
        		<br/> 注意：从高中毕业填起
        	</td>
        </tr> 
        <tr><th style="height:160px;">与应聘岗位<br>相关的实践<br>经历或取得<br>的成绩</th><td colspan="6"><textarea id="chengji" name="chengji" rows="6" cols="100"></textarea></td></tr> 
        <tr><th style="height:80px;">备注</th><td colspan="7"><textarea id="beizhu" name="beizhu" rows="3" cols="100"></textarea></td></tr>
        <tr>
        	<th>附件</th>
        	<td colspan=6>
				<c:forEach var="item" items="${fjList }">  
				    <a href='javascript:void(0)' onclick="fjxz('${item.fjlj}','${item.fjmc}')">${item.fjmc}</a> <br>  
				</c:forEach>  
			</td>
			<script>
				function fjxz(fjlj,fjmc) {
					var form = $("<form>");//定义一个form表单
					form.attr("action", "${ctx}/zpjlxq/downloadJlFj");
				    $("body").append(form);//将表单放置在web中
				    var input = $("<input>");
				    input.attr("type", "hidden");
				    input.attr("name", "fjlj");
				    input.attr("value", fjlj);
				    form.append(input);
				    
				    input = $("<input>");
				    input.attr("type", "hidden");
				    input.attr("name", "fjmc");
				    input.attr("value", fjmc);
				    form.append(input);
				    form.submit();
				}
			</script>
	  </tr>
   </table>    
</div>

<div class="btnbox" style="margin:20px;">
    <c:if test="${empty src}">
	     <a id="update_btn" type="submit" href="#" class="btn btn_success" style="display: none;" 
	     	onClick="location='${ctx}/zpjlxq/toJlUpdate?id=${vo.id}'">修改</a> 
	    <button type="button" class="btn btn_success"  onClick="location='${ctx}/zp/zpZpjh/preview?jhBh=${vo.zpjhBh}'">返回</button>
  	</c:if>
  	<c:if test="${not empty src}">
	  	<a id="update_btn" type="submit" href="#" class="btn btn_success" style="display: none;" 
	     	onClick="location='${ctx}/zpjlxq/toJlUpdate?id=${vo.id}&src=zyjs'">修改</a> 
	  	<button type="button" class="btn btn_success"  onClick="location='${pageContext.request.contextPath}/zp/zprn/init.do'">返回</button>
  	</c:if>
  </div>

 </form>
</body>
</html>