<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.cloud.model.Examination" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.9.0.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-ui-1.10.0.custom.js"></script>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/ui-lightness/jquery-ui-1.10.0.custom.css">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$( "#button" ).button();
	});
</script>
<style type="text/css">
table {
border-collapse: separate;
border-spacing: 2px;
border-color: gray;
}

tr {
display: table-row;
vertical-align: inherit;
border-color: inherit;
}

td, th {
display: table-cell;
vertical-align: inherit;
}

.style123w {
height: 100%;
border: 1px #CCC solid;
padding: 8px;
margin: 0 auto;
font-size: 16px;
line-height: 1.8;
font-family: "微软雅黑";
}
user agent stylesheetdiv {
display: block;
}

.over {
background-color: #B7DDA9;
}
</style>
</head>
<body>
	<table style="width:771px;margin :  5px 0px 15px 5px;margin-left:auto;margin-right:auto" align="center">
		<tr>
			<td>
				<div class="style123w">
					<h2 align="center">卡特尔16PF测试</h2>
					<table width="95%" border="0" cellpadding="0" cellspacing="0" align="center">
						<tr><td> <a name="checkboxjuanbiao"></a><br><br>
 						</td></tr>
 						
 						<%
 							List<Examination> elist = (ArrayList<Examination>)request.getAttribute("elist");
 							int k = 0;
 							for(Iterator<Examination> i = elist.iterator(); i.hasNext();) {
 								Examination e = i.next();
 								if(!e.getType().equals("0")) {
 									continue;
 								}
 								k = k + 1;
 								String content = e.getContent();
 								//String temp = content.substring(1).substring(0, content.substring(1).length()-1);
 								String[] a1 = (content).split("_");
 								content = content.replaceAll("_", "_______");
 								System.out.println(a1.length);
 								//System.out.println(temp);
 						%>
 						
 						<tr><td><strong><%=content %></strong><br>
 							<%
 								if(a1.length == 1) {
 							%>
 								答案：<input name="answer<%=k%>">
 							<%
 								} else if(a1.length > 1) {
 							%>
 								答案：
 							<%
 									for(int j=1; j<a1.length; j++) {
 							%>
 								<input name="answer<%=k %>">
 							<%
 									}
 								}
 							%>
 						</td></tr>
 						<%
 							}
 							
 							for(Iterator<Examination> i = elist.iterator(); i.hasNext();) {
 								Examination e = i.next();
 								if(!e.getType().equals("1")) {
 									continue;
 								}
 								k = k + 1;
 								String content = e.getContent();
 								//System.out.println(content);
 								String[] a1 = content.split("\\$");
 								String[] a2 = a1[1].split("#");
 								//System.out.println(a2.length);
 								//System.out.println(a1[1]);
						%>
 						<tr><td> <a name="answer1juanbiao"></a><br>
 							<span class="style1"> <strong><%=a1[0] %></strong>
							<br><br>
							<%
								for(int j=0; j<a2.length; j++) {
							%>
							<input type="radio" name="answer<%=k %>" value="<%=j+1 %>" id="<%=k%><%=j+1%>"> <label onmouseover="this.className='over';" onmouseout="this.className='out';" for="11" class="out"><%=a2[j] %></label><br>
							<%
								} 
							%>
							<br><br>
							</span>	
						</td></tr>
						<%
 							}
						%>
						<tr>
							<td colspan="2" align="center"><button onclick="main()" style="font-size: 1.0em;" id="button"><span class="ui-button-text">提交答案</span></button></td>
						</tr>
					</table>
				</div>
			</td>
		</tr>
	</table>
	
</body>
</html>