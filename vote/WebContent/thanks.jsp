<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String method = request.getParameter("method");
	String paperid = request.getParameter("paperid");
	request.getSession().setAttribute("method", method);
	request.getSession().setAttribute("paperid", paperid);
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
</head>
<body>
	<div class="div_border">
	<div class="div_area">
		<form method="post">
		<table>
			<tr>
				<td style="padding-left: 10px;"><strong>宁波思库网络科技有限公司</strong></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td align="center">感谢您参与本调查问卷，点击<a href="<%=request.getContextPath()%>/ExaminationServlet?method=query">这里</a>转到首页</td>
			</tr>
		</table>
		</form>
	</div>
	</div>
</body>
</html>