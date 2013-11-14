<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.cloud.model.Employee" %>
<%
	Employee e = (Employee)request.getSession().getAttribute("employee");
	if(e==null) {
		response.sendRedirect(request.getContextPath() + "/EmployeeServlet?method=logout");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<h2><a href="<%=request.getContextPath()%>/admin/main.jsp">试题维护</a></h2>
	<h2><a href="<%=request.getContextPath()%>/admin/report.jsp">下载数据</a></h2>
	<h2><a href="<%=request.getContextPath() %>/EmployeeServlet?method=logout">退出系统</a></h2>
</body>
</html>