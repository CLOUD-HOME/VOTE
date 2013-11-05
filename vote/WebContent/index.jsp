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
		$( "#button" ).button();
	});
	
	function register() {
		if(vemail()) {
			
			jQuery(document).ready(function() {
			  jQuery("form")//选择form
			    .first()//选择第一个 第二个用eq(1) 最后一个 last()
			    .attr("action","<%=request.getContextPath()%>/EmployeeServlet?method=insert")//更改属性
			    .submit();//提交
			});
		
		}
	}
	
	function vemail() {
		var sReg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
		if (!sReg.test(document.getElementById('email').value)) 
		{ 
		       //alert("E-Mail 地址无效,请重新输入!");
			   $("#vemail").html("E-Mail 地址无效,请重新输入!");
			   //alert($("#vemail").html("xxxxxxx"));
		       document.getElementById('email').focus();
		       return false; 
		}
		else{

		       //alert("E-Mail 地址无效,请重新输入!");
		}
	}
	
</script>
</head>
<body>
	<div class="div_border">
	<div class="div_area">
		<form method="post">
		<table>
			<tr>
				<td><strong>宁波思库网络科技有限公司</strong></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td width="40%" align="right">邮箱：</td>
				<td><input onmouseout="vemail()" id="email" name="email" style="height: 25px;" size="30px;"></td>
			</tr>
			<tr>
				<td><font id="vemail" size="1">&nbsp;mmm</font></td>
			</tr>
			<tr>
				<td width="40%" align="right">密码：</td>
				<td><input type="password" name="password" style="height: 25px;" size="30px;"></td>
			</tr>
			<tr>
				<td><font size="1">&nbsp;</font></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><button onclick="register()" style="font-size: 0.6em;" id="button"><span class="ui-button-text">同意协议并注册</span></button></td>
			</tr>
		</table>
		</form>
	</div>
	</div>
</body>
</html>