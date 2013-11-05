<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.location.href = "<%=request.getContextPath()%>/ExaminationServlet?method=query";
</script>
</head>
<body>
	<h1>VOTE在线调查系统欢迎您！</h1>
	<h2><a href="<%=request.getContextPath()%>/register.jsp">我要参与</a></h2>
</body>
</html>