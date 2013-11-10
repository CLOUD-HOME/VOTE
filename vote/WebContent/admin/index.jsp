<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/easyui/demo/demo.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.9.0.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/easyui/jquery.easyui.min.js"></script>
</head>
<body style="text-align:center;">
    <h2>问达后台管理</h2>
    <div style="margin:10px 0;"></div>
    <div align="center">
    <div class="easyui-panel"  title="后台管理登录窗" style="width:400px">
        <div style="padding:10px 0 10px 90px">
        <form id="ff" method="post">
            <table>
            	<tr>
            		<td>&nbsp;</td>
            	</tr>
                <tr>
                    <td>邮件:</td>
                    <td><input class="easyui-validatebox" type="text" name="email" data-options="required:true,validType:'email'"></input></td>
                </tr>
                <tr>
                    <td>密码:</td>
                    <td><input class="easyui-validatebox" type="text" name="password" data-options="required:true"></input></td>
                </tr>
                <tr>
                	<td></td>
            		<td id="msg">&nbsp;</td>
            	</tr>
            </table>
        </form>
        </div>
        <div style="text-align:center;padding:5px">
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">提交</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">清空</a>
        </div>
    </div>
    </div>
    <script>
        function submitForm(){
        	$('#ff').form({
        		url:"<%=request.getContextPath()%>/EmployeeServlet?method=login",
        		onSubmit: function(){
        		// do some check
        		// return false to prevent submit;
        		},
        		success:function(data){
        			if(data == 1) {
        			window.location.href="<%=request.getContextPath()%>/admin/main.jsp";
        			}else{
        				$("#msg").html("<font color='red'>邮件或者密码错误<font>");
        			}
        		}
        	});
        	$('#ff').submit();
        }
        function clearForm(){
            $('#ff').form('clear');
        }
    </script>
</body>
</html>