<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
		$( "#button1" ).button();
		$( "#button2" ).button();
		$( "#button3" ).button();
		$( "#button4" ).button();
		$( "#button5" ).button();
		$( "#button6" ).button();
		$( "#search" ).button();
	});
	
	function main() {
		window.location.href = "<%=request.getContextPath()%>/ExaminationServlet?method=find&paperid=1";
	}
	
</script>
</head>
<body>
	<div class="div_border">
	<div class="div_area">
		<table>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="5" style="padding-left: 10px;">欢迎来到VOTE调查问卷！</td>
			</tr>
			<tr>
				<td colspan="5" align="right" style="padding-right: 25px;"><input>&nbsp;&nbsp;<button style="font-size: 0.4em;" id="search">搜索</button></td>
			</tr>
			<tr>
				<td><font size="1">&nbsp;</font></td>
			</tr>
			<tr>
				<td><button onclick="main()" style="font-size: 0.4em;" id="button1"><span class="ui-button-text">第一套</span></button></td>
				<td><button onclick="main()" style="font-size: 0.4em;" id="button2"><span class="ui-button-text">第一套</span></button></td>
				<td><button onclick="main()" style="font-size: 0.4em;" id="button3"><span class="ui-button-text">第一套</span></button></td>
				<td><button onclick="main()" style="font-size: 0.4em;" id="button4"><span class="ui-button-text">第一套</span></button></td>
				<td><button onclick="main()" style="font-size: 0.4em;" id="button5"><span class="ui-button-text">第一套</span></button></td>
			</tr>
		</table>
	</div>
	</div>
</body>
</html>