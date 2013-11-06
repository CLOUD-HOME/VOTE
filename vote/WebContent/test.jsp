<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%
	String aaa = request.getParameter("aaa");
	request.getParameterNames();
	Map<String,String[]> bbb = request.getParameterMap();
	request.getParameterValues("aaa");
	System.out.println(aaa);
	System.out.println(bbb);
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<body>
	<form method="post" action="">
		<input name="aaa">
		<input name="aaa">
		<button></button>
	</form>
</body>
</html>