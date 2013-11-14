<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.cloud.model.Employee" %>
<%
	Employee e = (Employee)request.getSession().getAttribute("employee");
	if(e==null) {
		response.sendRedirect(request.getContextPath() + "/EmployeeServlet?method=logout");
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">  
<html>  
 <head>  
  <title>FineReport Demo</title>  
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />  
 </head>  
 <body>
 <div><span style="padding-left: 10px;"><a onclick="back()" href="javascript:history.go(-1);">返回</a></span></div>
 <iframe id="reportFrame" width="900" height="400" src="/vote/ReportServer?reportlet=WorkBook1.cpt"></iframe>  
 </body>  
</html>  