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
<script type="text/javascript" src="${ctxStatic}/js/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>

<script type="text/javascript">

$(document).ready(function () {
	$.get("${ctx}/zpjlxq/findById?id=${vo.id}",function(data){
		$("#jlForm").form("load",data)
	});
	
	$("#jlForm").form({    
		  url:"${ctx}/zpjlxq/save",   
		  onSubmit:function(){
			var isValid = $(this).form("validate");
			if(isValid){
				//验证简历长度
				var jianliValue =  $("#jianli").val();
				if(getByteLen(jianliValue)>400){
					$("#jianli").focus();
					layer.alert("【简历】一栏内容过长，最多只允许200个汉字，请修改！", { icon: 2, skin: 'layer-ext-moon' })	;
					return false;
				}
				
				//验证成绩长度
				var chengjiValue =  $("#chengji").val();
				if(getByteLen(chengjiValue)>400){
					$("#chengji").focus();
					layer.alert("【实践经历或取得的成绩】一栏内容过长，最多只允许200个汉字，请修改！", { icon: 2, skin: 'layer-ext-moon' })	;
					return false;
				}
				
				//验证备注长度
				var beizhuValue =  $("#beizhu").val();
				if(getByteLen(beizhuValue)>400){
					$("#beizhu").focus();
					layer.alert("【备注】一栏内容过长，最多只允许200个汉字，请修改！", { icon: 2, skin: 'layer-ext-moon' })	;
					return false;
				}
				
				//验证附件是否有上传
				var $li = $(".info_list").find("li");
				var fjNum = $(".info_list").find("li").size();
				if(fjNum==0){
					layer.alert("附件不能为空，请上传！", { icon: 2, skin: 'layer-ext-moon' })	
					return false;
				}
			}
			return true;
		  },
	      success:function(data){    
	    	  if(data==null || data ==''){
	    		  layer.alert("提交失败，请按要求填写信息。特别需要注意附件累计大小不允许超过20M！", {
					  icon: 2,
					  skin: 'layer-ext-moon' //该皮肤由layer.seaning.com友情扩展。关于皮肤的扩展规则，去这里查阅
					})	;
	    		  return false;
	    	  }
	    	  
	    	  var data = eval("("+data+")");
	    	  if(data.success){
				layer.alert("您的简历提交成功！", {
					  icon: 1,
					  skin: 'layer-ext-moon' //该皮肤由layer.seaning.com友情扩展。关于皮肤的扩展规则，去这里查阅
					},function(){
						<c:if test="${empty src}">
						location.href="${ctx}/zp/zpZpjh/preview?jhBh=${vo.zpjhBh}";
					  	</c:if>
					  	<c:if test="${not empty src}">
					    location.href="${pageContext.request.contextPath}/zp/zprn/init.do";
					    </c:if>
					});												
	    	  }else{
				layer.alert(data.msg, {
					  icon: 2,
					  skin: 'layer-ext-moon' //该皮肤由layer.seaning.com友情扩展。关于皮肤的扩展规则，去这里查阅
				})		    		  
	    	  }
	     }    
	});
	
	//身份证号码校验并且给出生日期赋值
	function verifsfzhm() {
		 if ($("#sfzhm").val() != '' && $("#sfzlx").val()=='197' ) {
				var msg = verifyIdCard($("#sfzhm").val());
				if(null!=msg){
					//alert("身份证号填写错误:"+msg);
					layer.alert("身份证号填写错误:"+msg, {
						  icon: 2,
						  skin: 'layer-ext-moon' //该皮肤由layer.seaning.com友情扩展。关于皮肤的扩展规则，去这里查阅
						})					
					return;
				} else {
					//校验成功就给出生日期赋值
					var csrq = $("#sfzhm").val().substring(6,10)+"-"+$("#sfzhm").val().substring(10,12)+"-"+$("#sfzhm").val().substring(12,14);
					if ($("#csrq").val() == '') {						
						$("#csrq").val(csrq);
					} else if ($("#csrq").val() != csrq) {
						//如果出生日期与身份证号码里面不相等则提示
						layer.msg('出生日期和身份证号码不匹配，是否使用身份证号码中的出生日期？', {
						  time: 0 //不自动关闭
						  ,btn: ['确定','取消']
						  ,yes: function(index){
							  $("#csrq").val(csrq); 
							 //计算年龄
							 /* var nl = jsGetAge($("#csrq").val());
							 $("#nl").val(nl);	 */							  
						     layer.close(index);						   
						  }
						});
					}
				}
			 }	
	  }
	
	//身份证号码校验
	$("#sfzhm").change(function(){		
		verifsfzhm();
		//计算年龄
		/* var nl = jsGetAge($("#csrq").val());
		$("#nl").val(nl);	 */		
	});	
	//身份证号码校验
	$("#sfzlx").change(function(){		
		verifsfzhm();
		//计算年龄
		/* var nl = jsGetAge($("#csrq").val());
		$("#nl").val(nl);	 */		
	});	
	
	//身份证号码校验,这里有点问题，change只对鼠标移开起作用，对代码直接赋值不起作用，所以到处都计算nl，本来应该只写在一个方法中的
	$("#csrq").change(function(){	
		//alert("ok");
		//计算年龄
		/* var nl = jsGetAge($("#csrq").val());
		$("#nl").val(nl);	 */	
	});	
	
});

function getByteLen(val) {
    var len = 0;
    for (var i = 0; i < val.length; i++) {
         var a = val.charAt(i);
         if (a.match(/[^\x00-\xff]/ig) != null) {
            len += 2;
        } else {
            len += 1;
        }
    }
    return len;
}

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
<title>应聘简历提交</title>
</head>

<body>
<div  class="TableBox" style="margin:20px;>
   <c:if test="${empty src}">
   <div class="Table03"">您现在的位置：<a href="http://www.hnpu.edu.cn/">返回首页</a>><a href="${ctx}/zp/zpZpjh/preview?jhBh=${vo.zpjhBh}">招聘信息</a>>简历递交</div>
   </c:if>
   <c:if test="${not empty src}">
	 <div class="Table03"">您现在的位置：<a href="http://www.hnpu.edu.cn/">返回首页</a>><a href="${pageContext.request.contextPath}/zp/zprn/init.do">招聘信息</a>>简历递交</div>
   </c:if>
</div> 
<div class="bt1">湖南省事业单位公开招聘人员报名表</div>     

<div id="data1" class="bg1" align="center">
    <!-- <form name="form" method="post" action="" id="form" onSubmit=""> -->
    <form id="jlForm"  method="post" enctype="multipart/form-data">
	<input type="hidden" id="zpjhid" name="zpjhid" value="${vo.zpjhid}"> 
	<input type="hidden" id="zpjhmc" name="zpjhmc" value="${vo.zpjhmc}">
	<input type="hidden" id="zpxqid" name="zpxqid" value="${vo.zpxqid}">
	<input type="hidden" id="zyyq" name="zyyq" value="${vo.zyyq}">
	<input type="hidden" id="nl" name="nl" value="">
	<input type="hidden" id="password" name="password" value="111111">
	<input type="text" id="rpzhiweiid" name="rpzhiweiid" value="${vo.rpzhiweiid}" style="display: none">
	<input type="text" id="zpzttitle" name="zpzttitle" style="display: none"> 
	<input type="text" id="zpztid" name="zpztid" size="20" style="display: none">
    <input type="text" id="ssbmid" name="ssbmid" style="display: none;" value="${vo.ssbmid}"  readonly>
    <TABLE border="1" cellspacing="0" cellpadding="0" align=center>
        <tr><th style="width:10%;">姓    名</th><td style="width:14%;">
        		<input name="username" type="text" id="username" required value="${vo.username}"
        			maxlength="10"><span style="color: red;"> *</span></td>
            <th style="width:14%;">性    别</th>
            <td style="width:14%;">
            <select name="xb" id="xb"  style="width:50px;">
                <option value="男">男</option><option value="女">女</option></select>
                <span style="color: red;"> *</span></td>
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
        <!--  <tr><th>出生年月</th><td><input name="csrq" type="date" id="csrq" required><span style="color: red;"> *</span></td>-->
        <tr><th>出生年月</th><td><input  id="csrq" name="csrq" class="input01css" type="text" value ="" required onFocus="laydate({istime: true, format: 'YYYY-MM-DD'})"><span style="color: red;"> *</span></td>
        
        
            <th>政治面貌</th><td>
            		<select name="zzmm"  id="zzmm" style="width:100px;" required>
						<option value="">---请选择---</option>
						<c:forEach items="${zzmm}" var="mzdp">					
							<option value="${mzdp.id}">${mzdp.name}</option>
						</c:forEach>
					</select><span style="color: red;"> *</span></td>
            <th>入党（团）时间</th><td><input  id="rdsj" name="rdsj" class="input01css" type="text" value =""  onFocus="laydate({istime: true, format: 'YYYY-MM-DD'})"></td></tr>
        <tr><th>籍贯</th><td><input name="jg" type="text" id="jg" maxlength="10"><span style="color: red;"> *</span></td>            
            <th>户籍所在地</th><td  colspan="3">
            <input name="hjdz" type="text" id="hjdz" maxlength="20"></td></tr> 
        <tr><th colspan="2">职称、执（职）业资格</th><td colspan="2">
        	<input name="zyzg" type="text" id="zyzg" ></td>
            <th>取得时间</th><td><input  id="zyzgsj" name="zyzgsj" class="input01css" 
            	type="text" value =""  onFocus="laydate({istime: true, format: 'YYYY-MM-DD'})"></td></tr>       
        <tr>
            <th colspan="2">档案保管单位</th><td colspan="2"><input name="rsdadw" type="text" id="rsdadw"></td>
            <th>婚姻状况</th><td>
            <select name="hyzk" id="hyzk"  style="width:80px;">
                <option value="已婚">已婚</option><option value="未婚">未婚</option>
                <option value="离异">离异</option>
                </select></td></tr>
        <tr><!-- <th>第一学历211</th><td><select id="dy211" name="dy211" style="width:50px;">
                <option value="是">是</option><option value="否">否</option></select><span style="color: red;">*</span></td>
			<th>最高学历211</th><td><select id="zg211" name="zg211" style="width:50px;">
                <option value="是">是</option><option value="否">否</option></select><span style="color: red;">*</span></td> -->
			<th>第一外语</th><td colspan="6"><input type="text" id="dywy" name="dywy" style="width:200px"></td></tr>
        <tr><th>第一学历</th><td>
       			 <select name="dyxlxw" style="width:100px;" id="dyxlxw" required>
						<option value="">---请选择---</option>
						<c:forEach items="${xl}" var="xl">					
							<option value="${xl.id}">${xl.name}</option>
						</c:forEach>
				</select>
        	<span style="color: red;">*</span></td>
        	<th>第一学历毕业学校</th><td><input type="text" id="dyxlxx" name="dyxlxx" required><span style="color: red;">*</span></td>
			<th>在校时间</th><td colspan="2"><input  id="dyxlrxsj" name="dyxlrxsj" class="input01css" type="text" value =""  
				onFocus="laydate({istime: true, format: 'YYYY-MM-DD'})" style="width:120px;" required><span style="color: red;">*</span>——<input  id="dyxlbysj" name="dyxlbysj" class="input01css" type="text" value ="" 
				 onFocus="laydate({istime: true, format: 'YYYY-MM-DD'})" style="width:120px;" required><span style="color: red;">*</span></td>
	    <tr><th>最高学历</th><td>
	    		<select name="zgxlxw" style="width:100px;" id="zgxlxw" required>
						<option value="">---请选择---</option>
						<c:forEach items="${xl}" var="xl">					
							<option value="${xl.id}">${xl.name}</option>
						</c:forEach>
					</select><span style="color: red;">*</span></td>
			<th>最高学历毕业学校</th><td><input name="zgxlxx" type="text" id="zgxlxx" required><span style="color: red;">*</span></td>
			<th>在校时间</th><td colspan="2"><input  id="zgxlrxsj" name="zgxlrxsj" class="input01css" type="text" 
				value =""  onFocus="laydate({istime: true, format: 'YYYY-MM-DD'})" style="width:120px;" required><span style="color: red;">*</span>——<input  id="zgxlbysj" name="zgxlbysj" 
					class="input01css" type="text" value =""  onFocus="laydate({istime: true, format: 'YYYY-MM-DD'})" style="width:120px;" required><span style="color: red;">*</span></td></tr>
		<tr><th>第一学历专业</th><td><input type="text" id="dyzy" name="dyzy" required maxlength="20"> <span style="color: red;">*</span></td>
		    <th>最高学历专业</th><td><input type="text" id="sxzy" name="sxzy" required><span style="color: red;">*</span></td>
		    <th>所属学科</th><td colspan="2"><input type="text" id="xueke" name="xueke" required><span style="color: red;">*</span></td></tr>
		<tr><th>有何特长:</th><td><input name="tc" type="text" id="tc"></td>
            <th>身份证件类型</th><td>
					<select name="sfzlx" style="width:110px;" id="sfzlx" required>
						<option value="">---请选择---</option>
						<c:forEach items="${sfzlx}" var="sfzlx">					
							<option value="${sfzlx.id}">${sfzlx.name}</option>
						</c:forEach>
					</select>
					<span style="color: red;">*</span></td>
            <th>身份证号</th><td colspan="2"><input name="sfzhm" type="text" id="sfzhm" required value="${vo.sfzhm}"><span style="color: red;">*</span></td></tr>    
        <tr><th>通讯地址</th><td colspan="4"><input name="txdz" type="text" id="txdz" style="width:90%;" required><span style="color: red;"> *</span></td>
            <th>邮政编码</th><td><input name="youbian" type="text" id="youbian"></td></tr>
        <tr><th>联系电话</th><td><input name="sj" type="text" id="sj" required><span style="color: red;"> *</span></td>
            <th>QQ号码:</th><td><input name="qq" type="text" id="qq"></td>
            <th>EMAIL</th><td colspan="2"><input name="yx" type="text" id="yx" required><span style="color: red;"> *</span></td></tr> 
        <tr>
        	<th style="height:160px;">简历</th>
        	<td colspan="6">
        		<textarea id="jianli" name="jianli" rows="6" cols="100"></textarea>
        		<br/><span style="color:red;">注意：从高中毕业填起，且最多只允许200个汉字</span>
        	</td>
        </tr> 
        <tr>
        	<th style="height:160px;">与应聘岗位<br>相关的实践<br>经历或取得<br>的成绩</th>
        	<td colspan="6">
        		<textarea id="chengji" name="chengji" rows="6" cols="100"></textarea>
        		<br/><span style="color:red;">注意：最多只允许200个汉字</span>
        	</td>
        </tr> 
        <tr>
        	<th style="height:80px;">备注</th>
        	<td colspan="7">
        		<textarea id="beizhu" name="beizhu" rows="3" cols="100"></textarea>
        		<br/><span style="color:red;">注意：最多只允许200个汉字</span>
        	</td>
        </tr>
        <tr><th>附件<span style="color: red;"> *</span></th><td colspan=6>
        	<div id="data2" class="bg2" align="left">
	        	<table>
					<tr id="fileTr" >
						<td id="fileTd">
							<input class="easyui-filebox" id="file" name="sourceFile" style="width:250px"
								data-options="multiple:false,buttonText:'浏览',onChange:fileChangeFj" 
								maxlength="200" />
							
						</td>
					</tr>
					<tr>
						<td>
							<ul class="info_list">
								<c:forEach var="item" items="${fjList }">  
								    <li><a href='javascript:void(0)' onclick="fjxz('${item.fjlj}','${item.fjmc}')">${item.fjmc}</a></li> <br>  
								</c:forEach> 
							</ul> 
						<td/>
					</tr>
				</table>
				
			</div>
			<span style="color:red;">注意：附件累计大小不能超过20M</span>
			  <script type="text/javascript">
				function fileChangeFj(){
					var value = $("#file").filebox('getValue');
					if(value!=null && value!=""){
						var name = value.replace(/.{0,}\\/, "");
						var outer = "<li></li>"
						var str = "<a href='javascript:void(0);' class='fjName'>"+name+"</a>";
						str += "<a href='javascript:void(0);' class='delete'><img src=\"${ctxStatic}/images/dot02.jpg\" /></a>";
						
						var $outer = $(outer);
						var $td = $("#fileTd"); 
						
						$td.attr("id","")
						$td.css("display", "none");
						jQuery($td).appendTo($outer);
						
						jQuery(str).appendTo($outer);
						
						$outer.appendTo(".info_list");
						
						var tdObj = $("<td></td>");
						tdObj.attr("id","fileTd")
						tdObj.attr("colspan","2");
						
						var inputObj = $("<input class='easyui-filebox' id='file' name='sourceFile' style='width:250px' data-options='buttonText:\"浏览\",multiple:false,onChange:fileChangeFj' />");
						$(inputObj).appendTo(tdObj);
						
						$(tdObj).appendTo("#fileTr");
						$.parser.parse('#fileTr');
					}
				}
				
				$(document).ready(function () {
					$(".delete").live("click",function(){
						$(this).parent().remove();
					});
				});
				
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
			</script>
		</td>
	  </tr>
   </table>    
</div>
  <div class="btnbox" style="margin:20px;">
    <!-- <button type="button" class="btn btn_success"  onClick="dyjkpz('table01/dzjkpz.pdf');">提交</button> -->
     <button type="submit" class="btn btn_success" >提交</button> 
     <!-- <button type="button" class="btn btn_success" onClick="f_submit();">提交</button> --> 
     <c:if test="${empty src}">
    <button type="button" class="btn btn_success"  onClick="location='${ctx}/zp/zpZpjh/preview?jhBh=${vo.zpjhBh}'">返回</button>
  	</c:if>
  	<c:if test="${not empty src}">
  	<button type="button" class="btn btn_success"  onClick="location='${pageContext.request.contextPath}/zp/zprn/init.do'">返回</button>
  	</c:if>
  </div>
    </form>
</body>
</html>