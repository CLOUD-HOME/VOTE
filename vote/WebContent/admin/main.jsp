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
<script type="text/javascript" src="<%=request.getContextPath() %>/easyui/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/easyui/jquery.easyui.min.js"></script>
<style type="text/css">
	input{
		width: 200px;
	}
</style>
</head>
<body>
    <h2>试题维护页面</h2>
    
    <table id="dg" title="试题列表" class="easyui-datagrid" style="width:1000px;height:500px"
    		data-options="singleSelect:true,collapsible:true,url:'<%=request.getContextPath() %>/ExaminationServlet?method=querye',method:'get'"
            <%--
    		url="get_users.php"
            url="http://www.jeasyui.com/demo/main/get_users.php"
            url="<%=request.getContextPath() %>/ExaminationServlet?method=querye"
            url="http://localhost:8080/vote/ExaminationServlet?method=querye"
            --%>
            toolbar="#toolbar" pagination="true"
            rownumbers="true" fitColumns="true" singleSelect="true">
        <thead>
            <tr>
                <th field="paperid" width="15">试卷标识</th>
                <th field="papername" width="50">试卷标题</th>
                <th field="content" width="100">试题内容</th>
                <th field="type" width="15">试题类型</th>
                <th field="answer" width="50">试题答案</th>
            </tr>
        </thead>
    </table>
    <div id="toolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newUser()">添加试题</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">编辑试题</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyUser()">删除试题</a>
    </div>
    
    <div id="dlg" class="easyui-dialog" style="width:500px;height:350px;padding:10px 20px"
            closed="true" buttons="#dlg-buttons">
        <div class="ftitle">试题信息</div>
        <form id="fm" method="post" novalidate>
        	<input type="hidden" name="id">
            <div class="fitem">
                <label>试题标识：</label>
                <input name="paperid" class="easyui-validatebox" required="true">
            </div>
            <div class="fitem">
                <label>试题名称：</label>
                <input name="papername" class="easyui-validatebox" required="true">
            </div>
            <div class="fitem">
                <label>试题内容：</label>
                <input name="content" class="easyui-validatebox" required="true">
            </div>
            <div class="fitem">
                <label>试题类型：</label>
                <input name="type" class="easyui-validatebox" required="true">
            </div>
            <div class="fitem">
                <label>试题答案：</label>
                <input name="answer">
            </div>
        </form>
    </div>
    <div id="dlg-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveUser()">保存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
    </div>
    <script type="text/javascript">
        var url;
        function newUser(){
            $('#dlg').dialog('open').dialog('setTitle','添加试题');
            $('#fm').form('clear');
            url = '<%=request.getContextPath() %>/ExaminationServlet?method=insert';
        }
        function editUser(){
            var row = $('#dg').datagrid('getSelected');
            if (row){
                $('#dlg').dialog('open').dialog('setTitle','编辑试题');
                $('#fm').form('load',row);
                url = '<%=request.getContextPath() %>/ExaminationServlet?method=update' + row.id;
            }
        }
        function saveUser(){
            $('#fm').form('submit',{
                url: url,
                onSubmit: function(){
                    return $(this).form('validate');
                },
                success: function(result){
                    var result = eval('('+result+')');
                    if (result.errorMsg){
                        $.messager.show({
                            title: 'Error',
                            msg: result.errorMsg
                        });
                    } else {
                        $('#dlg').dialog('close');        // close the dialog
                        $('#dg').datagrid('reload');    // reload the user data
                    }
                }
            });
        }
        function destroyUser(){
            var row = $('#dg').datagrid('getSelected');
            if (row){
                $.messager.confirm('确认','您确认要删除当前所选择的记录吗？',function(r){
                    if (r){
                        $.post('destroy_user.php',{id:row.id},function(result){
                            if (result.success){
                                $('#dg').datagrid('reload');    // reload the user data
                            } else {
                                $.messager.show({    // show error message
                                    title: 'Error',
                                    msg: result.errorMsg
                                });
                            }
                        },'json');
                    }
                });
            }
        }
    </script>
    <style type="text/css">
        #fm{
            margin:0;
            padding:10px 30px;
        }
        .ftitle{
            font-size:14px;
            font-weight:bold;
            padding:5px 0;
            margin-bottom:10px;
            border-bottom:1px solid #ccc;
        }
        .fitem{
            margin-bottom:5px;
        }
        .fitem label{
            display:inline-block;
            width:80px;
        }
    </style>
</body>
</html>