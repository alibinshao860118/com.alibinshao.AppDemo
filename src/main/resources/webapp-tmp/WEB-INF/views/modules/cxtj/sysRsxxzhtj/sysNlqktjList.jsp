<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
	<head>
		<meta name="decorator" content="default" />
		<script type="text/javascript" src="${ctxStatic}/js/modules/cxtj/sysRsxxzhtj/sysRsxxzhtjList.js"></script>
	</head>
	<body>
		<div style="font-size: 20 px;text-align: center">专任教师年龄情况统计</div>
		<div class="layui-btn-group">
			<button class="layui-btn layui-btn layui-btn-small" 
			onclick="exportExcel();;return false;">
			<i class="icon iconfont"></i>导出</button>
		</div>
		<table class="layui-table">
		  <colgroup>
		  	<col width="120" >
		    <col width="80" >
		    <col width="80">
		    <col width="80">
		    <col width="80">
		    <col width="80">
		    <col>
		  </colgroup>
		  <thead>
		    <tr>
		      <th></th>
		      <th>30岁以下</th>
		      <th>31-40(岁)</th>
		      <th>41-50(岁)</th>
		      <th>51-60(岁)</th>
		      <th>60岁以上</th>
		    </tr> 
		  </thead>
		  <tbody>
		    <tr>
		   	  <td >总计</td>
		      <td></td>
		      <td></td>
		      <td></td>
		      <td></td>
		      <td></td>
		    </tr>
		    <tr>
		   	  <td >
		   	  	<div align="right">其中：女</div>
		   	  </td>
		      <td> </td>
		      <td> </td>
		      <td> </td>
		      <td> </td>
		      <td> </td>
		    </tr>
		    <tr>
		   	  <td >
		   	  	<div align="right">其中：男</div>
		   	  </td>
		      <td> </td>
		      <td> </td>
		      <td> </td>
		      <td> </td>
		      <td> </td>
		    </tr>
		    <tr>
		      <td >
		   	  	<div align="left">按职称分：</div>
		   	  </td>
		      <td></td>
		      <td></td>
		      <td></td>
		      <td></td>
		      <td></td>
		    </tr>
		    <tr>
		      <td >
		   	  	<div align="right">正高级</div>
		   	  </td>
		      <td></td>
		      <td></td>
		      <td></td>
		      <td></td>
		      <td></td>
		    </tr>
		    <tr>
		   	  <td >
		   	  	<div align="right">副高级</div>
		   	  </td>
		      <td> </td>
		      <td> </td>
		      <td> </td>
		      <td> </td>
		      <td> </td>
		    </tr>
		    <tr>
		   	  <td >
		   	  	<div align="right">中级</div>
		   	  </td>
		      <td> </td>
		      <td> </td>
		      <td> </td>
		      <td> </td>
		      <td> </td>
		    </tr>
		    <tr>
		   	  <td align="right" ><div align="right">初级</div></td>
		      <td> </td>
		      <td> </td>
		      <td> </td>
		      <td> </td>
		      <td> </td>
		    </tr>
		    <tr>
		   	  <td ><div align="left">按学(历)位分：</div></td>
		      <td> </td>
		      <td> </td>
		      <td> </td>
		      <td> </td>
		      <td> </td>
		    </tr>
		    <tr>
		   	  <td align="right" ><div align="right">博士</div></td>
		      <td> </td>
		      <td> </td>
		      <td> </td>
		      <td> </td>
		      <td> </td>
		    </tr>
		    <tr>
		   	  <td align="right" ><div align="right">硕士</div></td>
		      <td> </td>
		      <td> </td>
		      <td> </td>
		      <td> </td>
		      <td> </td>
		    </tr>
		     <tr>
		   	  <td align="right" ><div align="right">研究生</div></td>
		      <td> </td>
		      <td> </td>
		      <td> </td>
		      <td> </td>
		      <td> </td>
		    </tr>
		    <tr>
		   	  <td align="right" ><div align="right">本科</div></td>
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