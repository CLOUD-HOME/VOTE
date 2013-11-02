<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String message = (String)request.getParameter("msg");
	message = new String(message.getBytes("iso8859-1"),"utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.9.0.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-ui-1.10.0.custom.js"></script>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/ui-lightness/jquery-ui-1.10.0.custom.css">
<title>Insert title here</title>
<style type="text/css">
	.div_border {
		width: 730px;
		height: 100%;
		border: 1px #CCC solid;
		padding: 8px;
		margin: 0 auto;
		font-size: 11pt;
		line-height: 1.8;
		font-family: "微软雅黑";
	}

	div {
		display: block;
	}
	
	.div_area {
		background-color: rgb(249, 249, 249);
		height: 300px;
		display: block;
		font-size: 15pt;
		font-family: 微软雅黑;
	}
	
	table {
		width: 100%;
	}
	
</style>

<script type="text/javascript">
	$(function() {
		$( "#button" ).button();
	});
	
	function verify() {
		jQuery(document).ready(function() {
		  jQuery("form")//选择form
		    .first()//选择第一个 第二个用eq(1) 最后一个 last()
		    .attr("action","<%=request.getContextPath()%>/EmployeeServlet?method=verify")//更改属性
		    .submit();//提交
		});
	}
	
</script>
</head>
<body>
	<div class="div_border">
	<div class="div_area">
		<form method="post">
		<table>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2" style="padding-left: 10px;"><%=message %></td>
			</tr>
			<tr>
				<td><font size="1">&nbsp;</font></td>
			</tr>
			<tr>
				<td width="40%" align="right">验证码：</td>
				<td><input name="vcode" style="height: 25px;" size="30px;"></td>
			</tr>
			<tr>
				<td><font size="1">&nbsp;</font></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><button onclick="verify()" style="font-size: 0.6em;" id="button"><span class="ui-button-text">点击继续注册</span></button></td>
			</tr>
		</table>
		</form>
	</div>
	</div>
</body>
</html>