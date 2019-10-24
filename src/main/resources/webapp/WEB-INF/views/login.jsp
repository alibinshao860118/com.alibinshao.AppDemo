<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="${fns:getConfig('productName')}" />
<meta name="description" content="${fns:getConfig('productName')}" />
<title>${fns:getConfig('productName')}</title>
<link href="${ctxStatic}/css/css/public.css" rel="stylesheet" />
<script type="text/javascript" src="${ctxStatic}/js/js/jquery.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/js/iview.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/js/jquery.plugins-min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/js/scripts-bottom-min.js"></script>
<script type="text/javascript">

//如果在框架或在对话框中，则弹出提示并跳转到首页
if(self.frameElement && self.frameElement.tagName == "IFRAME" || $('#left').length > 0 || $('.jbox').length > 0){
	alert('未登录或登录超时。请重新登录，谢谢！');
	top.location = "${ctx}";
}

function validateForm(){
	$("#errorInfo").hide();
	$("#errorInfo").empty();
	
	var isValid = true;
	var username = $("#loginForm #username").val();
	if(username==null || $.trim(username)==''){
		isValid = false;
		$("#errorInfo").show();
		$("#errorInfo").text("请输入用户名");	
		return false;
	}
	
	var password = $("#loginForm #password").val();
	if(password==null || $.trim(password)==''){
		isValid = false;
		$("#errorInfo").show();
		$("#errorInfo").text("请输入密码");
	}
	
	if(isValid){
		$('#sub_btn').click();
	}
	
	return true;
}
</script>
</head>
<body>
<div class="login-form">
	<form id="loginForm" class="form-signin" action="${ctx}/login" method="post" >
        <div class="form-signin-heading text-center">
            <h1 class="sign-title">用户登录</h1>
        </div>
        <div class="login-wrap">
            <input type="text" id="username" name="username" class="form-control" placeholder="请输入用户名" autofocus>
            <input type="password" id="password" name="password" class="form-control" placeholder="请输入密码">
			<span style="color:red;font-size:10;display: ${empty message?'none':''}" id="errorInfo">
				${message}
			</span>
            <input id="sub_btn" type="submit" value="登 录" style="display: none;"/>
            <a class="btn btn-lg btn-login btn-block" href="javascript:;" 
            	onclick="javascript:validateForm();" style="text-align:center;width:258px;">
                              登 录
            </a>
            <span class="pull-right" style="text-align:center; width:288px; display:block;">
                <a href="#none" >忘记密码？</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#none">立刻注册！</a>
            </span>
        </div>
	</form>
</div>
<div class="login-title">
<table width="1180" border="0" cellspacing="0" cellpadding="0" style="margin:0 auto;">
  <tr>
    <td width="500"><img src="${ctxStatic}/images/images/logo01.png" width="500" height="80"  alt=""/></td>
    <td align="right" class="login-link"><a href="#none">关于我们</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="#none">服务支持</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="#none">湖南工学院网站首页</a></td>
  </tr>
</table>

</div>
<!-- 代码 开始 -->
<div class="header">
  <div id="onebyone_slider">
    <div class="oneByOne_item">
		<span class="ob1_title"><img src="${ctxStatic}/images/images/xx01.png"/></span>
		<img src="${ctxStatic}/images/images/header/1.png" class="ob1_img_device1"/>
	</div>
   <div class="oneByOne_item">
		<span class="ob1_title"><img src="${ctxStatic}/images/images/xx02.png"/></span>
		<img src="${ctxStatic}/images/images/header/2.png" class="ob1_img_device1"/>
	</div>
	<div class="oneByOne_item">
		<span class="ob1_title"><img src="${ctxStatic}/images/images/xx03.png"/></span>
		<img src="${ctxStatic}/images/images/header/3.png" class="ob1_img_device1"/>
	</div>
	<div class="oneByOne_item">
		<span class="ob1_title"><img src="${ctxStatic}/images/images/xx04.png"/></span>
		<img src="${ctxStatic}/images/images/header/4.png" class="ob1_img_device1"/>
	</div>
  </div>
</div>
<!-- 代码 结束 -->
<div class="login-list">
<h3><a href="#none">信息公开</a></h3>
<ul>
	<li><a href="#none">· 搜狐网：衡阳环保志愿者协会举办环保NGO组织发展研讨会</a><span>2017-03-03</span></li>
	<li><a href="#none">· 湖南日报：用六中全会精神指引高校党建新实践</a><span>2017-02-27</span></li>
	<li><a href="#none">· 中国教育报：坚守阵地 履职尽责 促进发展——湖南工学院党建与思想政治工作纪实</a><span>2017-02-23</span></li>
	<li><a href="#none">· 中国教育报：“一把手”的神经为何绷紧了？</a><span>2017-02-15</span></li>
	<li><a href="#none">· 衡阳日报：湖南工学院举行“模拟长征行”5公里徒步拉练比赛</a><span>2017-02-09</span></li>                
</ul>    
</div>
<div class="login-foot">
	<span>版权所有 © 湖南工学院 20016-2017 湘ICP备086086086086号</span>
</div>

</body>
</html>