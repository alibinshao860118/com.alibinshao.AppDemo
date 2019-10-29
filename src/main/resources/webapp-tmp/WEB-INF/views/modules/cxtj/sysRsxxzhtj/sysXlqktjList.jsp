<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
	<head>
		<meta name="decorator" content="default" />
		<script type="text/javascript" src="${ctxStatic}/js/modules/cxtj/sysRsxxzhtj/sysRsxxzhtjList.js"></script>
	</head>
	<body>
		<div style="font-size: 20px;text-align: center">学历情况统计</div>
		<div class="layui-btn-group">
			<button class="layui-btn layui-btn layui-btn-small" 
			onclick="exportExcel();;return false;">
			<i class="icon iconfont"></i>导出</button>
		</div>
		<table class="layui-table">
		  <colgroup>
		  	<col width="150" >
		    <col width="100" >
		    <col width="100">
		    <col width="100">
		    <col width="100">
		    <col width="100">
		    <col>
		  </colgroup>
		  <thead>
		    <tr>
		      <th></th>
		      <th>博士</th>
		      <th>硕士</th>
		      <th>研究生</th>
		      <th>本科</th>
		      <th>大专及以下</th>
		    </tr> 
		  </thead>
		  <tbody>
		    <tr>
		   	  <td >总计</td>
		      <td> </td>
		      <td> </td>
		      <td> </td>
		      <td> </td>
		      <td> </td>
		    </tr>
		    <tr>
		   	  <td><div align="center">专任教师</div></td>
		      <td> </td>
		      <td> </td>
		      <td> </td>
		      <td> </td>
		      <td> </td>
		    </tr>
		    <tr>
		   	  <td><div align="center">其中：女</div></td>
		      <td> </td>
		      <td> </td>
		      <td> </td>
		      <td> </td>
		      <td> </td>
		    </tr>
		    <tr>
		   	  <td ><div align="center">正高级</div></td>
		      <td> </td>
		      <td> </td>
		      <td> </td>
		      <td> </td>
		      <td> </td>
		    </tr>
		    <tr>
		   	  <td ><div align="center">副高级</div></td>
		      <td> </td>
		      <td> </td>
		      <td> </td>
		      <td> </td>
		      <td> </td>
		    </tr>
		    <tr>
		   	  <td><div align="center">中级</div></td>
		      <td> </td>
		      <td> </td>
		      <td> </td>
		      <td> </td>
		      <td> </td>
		    </tr>
		    <tr>
		   	  <td><div align="center">初级</div></td>
		      <td> </td>
		      <td> </td>
		      <td> </td>
		      <td> </td>
		      <td> </td>
		    </tr>
		    <tr>
		   	  <td align="right" ><div align="center">无职称</div></td>
		      <td> </td>
		      <td> </td>
		      <td> </td>
		      <td> </td>
		      <td> </td>
		    </tr>
		    
		  </tbody>
		</table>	
		
	</body>
</html>