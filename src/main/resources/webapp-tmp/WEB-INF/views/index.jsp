<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html> 
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=0.8"> 
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${fns:getConfig('productName')}</title>
<link href="${ctxStatic}/css/comon.css" rel="stylesheet" type="text/css" />
<link href="${ctxStatic}/css/index_green.css" rel="stylesheet" type="text/css" />
<link href="${ctxStatic}/css/font.css" rel="stylesheet" type="text/css" />
<link href="${ctxStatic}/css/tab_css.css" rel="stylesheet" type="text/css" />

<SCRIPT type="text/jscript" src="${ctxStatic}/js/jquery.js"></SCRIPT>
<SCRIPT type="text/jscript" src="${ctxStatic}/js/js.js"></SCRIPT>
<script type="text/jscript" src="${ctxStatic}/js/Njs.js"></script>
<script language=JavaScript >
	
    var index = 1;
	function clikcMenu(url,tabTitle){
		//document.getElementById("workingFrame").src = url;		
		$(this).parent("div").parent("li").parent("li").siblings().children("ul").children("li").children("div").slideUp();
		
		//alert($("#tablis")[0].tagName);
		$("#tablis").children().removeClass("unlike");
		//alert($("#tablis").children("li:last-child").html());
		var liID = "tabli"+index;
		$("#tablis").children("li:last-child").after("<li class='unlike' id="+liID+" ><span class='tabClick' style='cursor:default'>"+tabTitle+"</span><span class='close' >×</span></li>");
		
		$("#divTabs").children().css('display','none');
		var divID = 'divFrame'+index;
		var iframeID = 'workingFrame'+index;
		$("#divTabs").children("div:last-child").after('<div id='+divID+'><table width="100%" border="0" cellspacing="0" cellpadding="0">'
        +'<tr>'
        +'<td>'
        +'<iframe src="'+url+'" frameborder="none" class="iframe1" style="width:100%;" name="workingFrame" id="'+iframeID+'" ></iframe>'
        +'</td>'
        +'</tr>'
        +'</table></div>');
	
		$("#"+iframeID).css({height:$(window).height()-85});
		index++;
		
	}
	

</script>
</head>
<body class="body2">

<div class="header">
    <div class="head_logo"></div>
    <div class="head_left_btn"><i class="fa fa-bars"></i></div>
    <div class="head_new"><i></i><a href="${ctx}/logout" ><span style="color:#fff;">退出登录</span></a></div>
    <div class="head_setting">
   	 	<i class="fa fa-cogs"></i>
    </div>
    <div class="head_name">${fns:getUser().name}</div>
</div>


<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="left_box" valign="top">
    <div class="left_menu">
        <ul id="menus">
<%--             <li>
               <h3><i class="fa fa-desktop"></i><a href="#">任务中心<i class="fa fa-angle-down"></i></a></h3>
               <ul>
                   <h4><i class="fa fa-caret-left"></i><a href="#">任务中心</a></h4>
                <li><a href="#" onClick="clikcMenu('${ctx}/zp/zpjlsxlc/initDbrw','我的待办')">我的待办</a></li>
                <li><a href="#" onClick="clikcMenu('${ctx}/zp/zpjlsxlc/initYbrw','我的已办')">我的已办</a></li>  
               </ul>
            </li>
            <li>
            	<h3><i class="fa fa-edit"></i><a href="#">招聘管理</a><i class="fa fa-angle-down"></i></h3>
            	<ul>
	            	<h4><i class="fa fa-caret-left"></i><a href="#">招聘管理</a></h4>   
	                <li><a href="#" onClick="clikcMenu('${ctx}/zp/zpZpjh/list','招聘计划编制')">招聘计划编制</a></li>
	                <li><a href="#" onClick="clikcMenu('${ctx}/zp/zprn/jianligl','简历管理')">简历管理</a></li>
	                 <li><a href="#" onClick="clikcMenu('${ctx}/zp/zprn/jianliqr','现场确认')">现场确认</a></li>
	                <li><a href="#" onClick="clikcMenu('${ctx}/zp/zprn/jianlizgsh','资格审查')">资格审查</a></li>
	                <li><a href="#" onClick="clikcMenu('${ctx}/zp/zpjlsxlc/init','简历筛选')">简历筛选</a></li>
	                <li><a href="#" onClick="clikcMenu('${ctx}/zp/zprn/jianligl','面试成绩录入')">面试成绩录入</a></li>
	                <li><a href="#" onClick="clikcMenu('${ctx}/zp/zprn/jianligl','笔试成绩录入')">笔试成绩录入</a></li>
	                <li><a href="#" onClick="clikcMenu('${ctx}/zp/zprn/jianligl','招聘录用')">招聘录用</a></li>
	                <li><a href="#">统计分析<i class="fa fa-angle-right"></i></a>
	                    <div>
	                        <a href="#" onClick="clikcMenu('${ctx}/zp/zprn/init','按招聘岗位统计')">· 按招聘岗位统计</a>
	                        <a href="#" onClick="clikcMenu('${ctx}/zp/zprn/jianligl','按简历状态统计')">· 按简历状态统计</a>
	                        <a href="#" onClick="clikcMenu('${ctx}/zp/zprn/jianliqr','按人员状态统计')">· 按人员状态统计</a>
	                    </div>
	                </li> 
            	</ul>
            </li>
            <li>
               <h3><i class="fa fa-envelope"></i><a href="#none"">培训管理<i class="fa fa-angle-down"></i></a></h3>
               <ul>
	                <h4><i class="fa fa-caret-left"></i><a href="#">培训管理</a></h4>
	                <li><a href="#" onClick="clikcMenu('${ctx}/pxgl/pxPxjh/list','培训计划管理')">培训计划管理</a></li>
	                <li><a href="#" onClick="clikcMenu('${ctx}/pxgl/pxPxb/list','培训班管理')">培训班管理</a></li>
	                <li><a href="#" onClick="clikcMenu('${ctx}/pxgl/pxPxbry/list','培训人员申报')">培训人员申报</a></li>
	                <li><a href="#" onClick="clikcMenu('${ctx}/pxgl/pxJszgz/list','教师资格证管理')">教师资格证管理</a></li>
	                <li><a href="#" onClick="clikcMenu('${ctx}/pxgl/pxglGnjxgl/list','国内进修管理')">国内进修管理</a></li>
               </ul>
           </li>
           <li>
               <h3><i class="fa fa-user"></i><a href="#none">人事信息管理<i class="fa fa-angle-down"></i></a></h3>
               <ul>
	                <h4><i class="fa fa-caret-left"></i><a href="#none">人事信息管理</a></h4>
	                <li><a href="#" onClick="clikcMenu('${ctx}/rygl/ryJbxx/list','在职人员基本信息')">人员信息管理</a></li>
	                <li><a href="#none">人事信息查询<i class="fa fa-angle-right"></i></a>
	                		<div>
	                             <a href="#" onclick="clikcMenu('${ctx}/rygl/ryJyjl/toView','教育经历')">· 教育经历</a><br>
	                             <a href="#" onclick="clikcMenu('${ctx}/rygl/ryGzjl/toView','工作经历')">· 工作经历</a><br>
	                             <a href="#" onclick="clikcMenu('${ctx}/rygl/ryZcxx/toView','职务信息')">· 职务信息</a><br>
	                             <a href="#" onclick="clikcMenu('${ctx}/rygl/ryJtcy/toView','家庭成员')">· 家庭成员</a><br>
	               		</div>                  
	                </li>
               </ul>
           </li>
           <li>
               <h3><i class="fa fa-calendar"></i><a href="#none">考勤信息管理<i class="fa fa-angle-down"></i></a></h3>
               <ul>
                <h4><i class="fa fa-caret-left"></i><a href="#none">考勤信息管理</a></h4>
                <li><a href="#none" onclick="clikcMenu('${ctx}/kq/kqBsxx/list','考勤信息报送')">考勤信息报送</a></li>  
                <li><a href="#none" onclick="clikcMenu('${ctx}/kq/kqBsmx/list','考勤明细查询')">考勤明细查询</a></li>  
               </ul>
           </li>
           
           <li>
               <h3><i class="fa fa-group"></i><a href="#none">人事调配管理<i class="fa fa-angle-down"></i></a></h3>
               <ul>
                <h4><i class="fa fa-caret-left"></i><a href="#none">人事调配管理</a></h4>
                <li><a href="#none" onclick="clikcMenu('${ctx}/rygl/ryJbxx/list','人员入职管理')">人员入职管理</a></li>
                <li><a href="#none" onclick="clikcMenu('${ctx}/dp/dpLzxx/list','人员离职管理')">人员离职管理</a></li> 
                <li><a href="#none" onclick="clikcMenu('${ctx}/dp/dpQsxx/list','在职去世管理')">在职去世管理</a></li> 
                <li><a href="#none" onclick="clikcMenu('${ctx}/dp/dpDdxx/list','人员调动管理')">人员调动管理</a></li> 
                <li><a href="#none">人员退休管理<i class="fa fa-angle-right"></i></a>
                	<div>
                         <a href="#" onclick="clikcMenu('${ctx}/dp/dpTxxx/list','正常退休管理')">· 正常退休管理</a><br>
                         <a href="#" onclick="clikcMenu('${ctx}/dp/dpYctx/list','延迟退休管理')">· 延迟退休管理</a><br>
                         <a href="#" onclick="clikcMenu('${ctx}/dp/dpTqtx/list','提前退休管理')">· 提前退休管理</a><br>
               		</div>                  
                </li>
                <li><a href="#none" onclick="clikcMenu('${ctx}/dp/dpCgxx/list','人员出国管理')">人员出国管理</a></li>  
               </ul>
           </li>
           <li>
               <h3><i class="fa fa-file-text-o"></i><a href="#none">人事合同管理<i class="fa fa-angle-down"></i></a></h3>
               <ul>
                <h4><i class="fa fa-caret-left"></i><a href="#none">人事合同管理</a></h4>
                <li><a href="#" onClick="clikcMenu('${ctx}/htgl/htHtxx/list','新签合同')">新签合同</a></li>
                <li><a href="#" onClick="clikcMenu('${ctx}/htgl/htHtxx/xqHtxxList','续签合同')">续签合同</a></li>
                <li><a href="#" onClick="clikcMenu('${ctx}/htgl/htHtxx/zzHtxxList','终止合同')">终止合同</a></li>
                <li><a href="#" onClick="clikcMenu('${ctx}/htgl/htHtxx/queryHtxxList','合同查询')">合同查询</a></li>
               </ul>
           </li>
                                             
           <li>
               <h3><i class="fa fa-search"></i><a href="#none">数据查询统计<i class="fa fa-angle-down"></i></a></h3>
               <ul>
                <h4><i class="fa fa-caret-left"></i><a href="#none">数据查询统计</a></h4>
                   <li><a href="#none" onClick="clikcMenu('${ctx}/cxtj/sysRsxxzhtj/list','人事信息综合')">人事信息综合</i></a></li>
                   <li><a href="#none" onClick="clikcMenu('${ctx}/cxtj/sysRsxxzhtj/nlqktjlist','年龄情况统计')">年龄情况统计</i></a></li>
                   <li><a href="#none" onClick="clikcMenu('${ctx}/cxtj/sysRsxxzhtj/xlqktjlist','学历情况统计')">学历情况统计</i></a></li>
               </ul>
           </li>
           
           <li>
               <h3><i class="fa fa-group"></i><a href="#none">组织机构管理<i class="fa fa-angle-down"></i></a></h3>
               <ul>
                <h4><i class="fa fa-caret-left"></i><a href="#none">组织机构管理</a></h4>
                   <li><a href="#none" onclick="clikcMenu('${ctx}/sys/sysZzjgbmgz/list','编码规则设置')">编码规则设置</i></a></li>
                   <li><a href="#none" onclick="clikcMenu('${ctx}/sys/sysOrg/list','组织机构管理')">组织机构管理</a></li>
               </ul>
           </li>
           
           <li>
               <h3><i class="fa fa-list-alt"></i><a href="#none">系统信息管理<i class="fa fa-angle-down"></i></a></h3>
               <ul>
                   <h4><i class="fa fa-caret-left"></i><a href="#none">系统信息管理</a></h4>
                   <li><a href="#" onclick="clikcMenu('${ctx}/sys/sysXxxx/list','学校信息维护')">学校信息维护</a></li>
                   <li><a href="#" onclick="clikcMenu('${ctx}/sys/sysMenu/list','系统菜单维护')">系统菜单维护</a></li>
                   <li><a href="#" onclick="clikcMenu('${ctx}/sys/sysUser/list','用户信息管理')">用户信息管理</a></li>
                   <li><a href="#" onclick="clikcMenu('${ctx}/sys/sysRole/list','角色权限管理')">角色权限管理</a></li>
                   <li><a href="#" onclick="clikcMenu('${ctx}/sys/sysDict/list','数字字典管理')">数字字典管理</a></li>
               </ul>
            </li>
            --%>
        </ul>
</div>
    </td>
    <td class="right_box" valign="top">
	    <div class="tabs">
	       <ul id="tablis">
	       		<li id="liID0"><span class="tabClick" style="cursor:default">工作桌面</span></li>
	   	   </ul>
	    </div> 
		<div id="divTabs">
			 <div id="divFrame0">
				<table width="100%" border="0" cellspacing="12" cellpadding="0">
				  <tr>
				    <td>
				    <!-- <iframe src="table01/bszm.html" frameborder="none" class="iframe1" style="width:100%;" name="workingFrame0" id="workingFrame0" ></iframe>
				    --> 
				    </td>
				  </tr>
				</table>
			</div>
		</div>
    </td>
    
    <td class="right_box2" valign="top" width="100">
    <div class="right_icons">
    <ul>
       <li><a href="#" onClick="clikcMenu('${ctx}/zp/zpZpjh/list','招聘计划编制')"><img src="${ctxStatic}/images/icons_01.png"><span>招聘计划</span></a></li>
       <li><a href="#" onClick="clikcMenu('${ctx}/zp/zprn/jianligl','简历管理')"><img src="${ctxStatic}/images/icons_02.png"><span>简历管理</span></a></li>
       <%-- <li><a href="#"><img src="${ctxStatic}/images/icons_03.png"><span>现场确认</span></a></li>
       <li><a href="#"><img src="${ctxStatic}/images/icons_04.png"><span>简历筛选</span></a></li>
       <li><a href="#"><img src="${ctxStatic}/images/icons_05.png"><span>招聘录用</span></a></li> --%>
  
    </ul>
    </div>
    </td> 
  </tr>
</table>
<script>
	var SystemMenu = [];
	$.ajax({
		url : "${ctx}/sys/sysMenu/getMenus",
		type : 'GET',
		async : false,
		dataType : "json",
		success : function(data) {
			SystemMenu = data;
		}
	});
	
	
	var menuStr = "";
	for(var i = 0, len = SystemMenu.length; i < len; i++) {
		var topMenus =  '<li><h3><i class="'+SystemMenu[i].icon+'"></i><a href="#">'+SystemMenu[i].title+'<i class="fa fa-angle-down"></i></a></h3>';
		
		topMenus += '<ul><h4><i class="'+SystemMenu[i].icon+'"></i><a href="#">'+SystemMenu[i].title+'</a></h4>';
		
		var len2 = SystemMenu[i].menu.length;
		for(var j = 0; j < len2; j++) {
			var menu = SystemMenu[i].menu[j];
			
			if(menu.children.length==0){
				var url = menu.href;
				var title = menu.title;
				topMenus += '<li><a href="#" onClick="clikcMenu(\'${ctx}'+url+'\',\''+title+'\')">'+title+'</a></li>';
			}else{
				topMenus += '<li><a href="#">'+title+'<i class="fa fa-angle-right"></i></a><div>';
				
				var children = menu.children;
				var len3 =  children.length;
				for(var k = 0; k < len3; k++) {
					var url = children[k].href;
					var title = children[k].title;
					topMenus += '<a href="#" onClick="clikcMenu(\'${ctx}'+url+'\',\''+title+'\')">'+title+'</a><br/>';
				}
				
		        topMenus += "</div></li>"; 
			}
		} 
		
		
		topMenus += '</ul></li>';
		
		
		menuStr += topMenus;
	}

	$('#menus').html(menuStr);
	
</script>
</body>
</html>
