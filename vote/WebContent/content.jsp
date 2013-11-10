<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.cloud.model.Examination" %>
<%@ page import="com.cloud.model.Employee" %>
<%
	Employee employee = (Employee)request.getSession().getAttribute("employee");
	if(employee == null) {
		response.sendRedirect(request.getContextPath() + "/register.jsp");
	}
%>
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

.input_line{
   border-bottom-style:solid;
   border-bottom-color:#FFFF;
   border-bottom-width:1px;

   border-top-style:none;
   border-left-style:none;
   border-right-style:none;
}

ul.errors {
	list-style:none;
	background:#ffcece;
	padding:3px;
	margin:3px 0 3px 70px;
	font-size:0.9em;
	width:165px;
}
</style>
<script type="text/javascript">
function trim(value) {
	return value.replace(/(^\s*)|(\s*$)/g,'');
}
var errMsg = {
	mchoice:{
		msg:'请您选择一个答案！',
		test:function(obj, load) {
			return trim(obj.value).length > 0 || load || trim(obj.value) != obj.defaultValue;
		}
	},required:{
		msg:'此空为必输项！',
		test:function(obj, load) {
			return trim(obj.value).length > 0 || load || trim(obj.value) != obj.defaultValue;
		}
	},
	email: {
		msg:'Not a valid email address.',
		test:function(obj) {
			return trim(obj.value).length <= 0 || /^[a-z0-9_+.-]+\@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/i.test(obj.value);	
		}
	},
	phone: {
	 	msg:'Not a valid phone number.',
		test:function(obj) {
			var m = /(\d{3}).*(\d{3}).*(\d{4})/.exec( obj.value );
            if(m) obj.value = "(" + m[1] + ") " + m[2] + "-" + m[3];
            return trim(obj.value).length <= 0 || m;	
		}	
	},	
	date: {
		msg:'Not a valid date.',
		test:function(obj) {
			return trim(obj.value).length <= 0 || /^\d{2}\/\d{2}\/\d{2,4}$/.test(obj.value);
		}
	},
	url: {
		msg:'Not a valid URL.',
		test:function(obj) {
              return trim(obj.value).length <= 0 || obj.value == 'http://' ||
                     /^https?:\/\/([a-z0-9-]+\.)+[a-z0-9]{2,4}.*$/.test(obj.value);
		}
	}
}
function watchFields(form) {
	for(var i = 0; i < form.elements.length; i++) {
		addEvent(form.elements[i],'blur', function(){
			hideErrors(this);  //add by myself
			return validateField(this);
		});
	}
}
function validateForm(form, load) {
	var valid = true;
	for(var i = 0; i < form.elements.length; i++) {
		 hideErrors(form.elements[i]);
		 if(validateField(form.elements[i], load))
		           valid = false;
		 //alert(form.elements[i].name);
		 if(i > 1 &&form.elements[i].name != form.elements[i-1].name) {
		 	if(checkRequired(form.elements[i]))
				       valid = false;
		 }
	}
	return valid;
}
function validateField(elem, load) {
	var errors = [];
	for(var name in errMsg) {
		var re = new RegExp('(^|\\s)' + name + '(\\s|$)');
		if(re.test(elem.className) && !errMsg[name].test(elem, load))
		         errors.push(errMsg[name].msg);
	}
	if(errors.length) showErrors(elem, errors);
	return errors.length > 0;
}
function hideErrors(elem) {
	var next = elem.nextSibling;
	if(next && next.nodeName == 'UL' && next.className == 'errors') {
		elem.parentNode.removeChild(next);
	}
}
function showErrors(elem, errors) {
	var next = elem.nextSibling;
	if (next == null || next && (next.nodeName != 'UL' || next.className != 'errors')) {
		next = document.createElement('ul');
		next.className = 'errors';
		elem.parentNode.insertBefore(next, elem.nextSibling);
	}
	for(var i = 0; i < errors.length; i++) {
		var li = document.createElement('li');
		li.innerHTML = errors[i];
		next.appendChild(li);
	}
}


function showErrorsMe(elem, errors) {
	var next = elem.previousSibling;
	if (next && (next.nodeName != 'UL' || next.className != 'errors')) {
		next = document.createElement('ul');
		next.className = 'errors';
		elem.parentNode.insertBefore(next, elem.previousSibling);
	}
	for(var i = 0; i < errors.length; i++) {
		var li = document.createElement('li');
		li.innerHTML = errors[i];
		next.appendChild(li);
	}
}
function getInputsByName(name) {
	var results = [];
	results.numChecked = 0;
	var input = document.getElementsByTagName("input");	
	for(var i = 0; i < input.length; i++) {
		if(input[i].name == name) {
			results.push(input[i]);
			if(input[i].checked) results.numChecked++;
		}
	}
	return results;
}
function checkRequired(elem) {
	if(elem.type == 'checkbox' || elem.type == 'radio') {
		
		  var errors = [];
		  if(getInputsByName(elem.name).numChecked == 0) {
			  errors.push(errMsg['mchoice'].msg);
		  }
		  if(errors.length) showErrorsMe(elem, errors);
		
		  //alert(getInputsByName(elem.name).numChecked);
	      return errors.length > 0;
	}
	/**
	} else {
	      alert(elem.value.length > 0 && elem.value != elem.defaultValue);
	      return !(elem.value.length > 0 && elem.value != elem.defaultValue);
	} 
	*/
}

function addLoadEvent(func){
	var oldonload = window.onload;
	if(typeof window.onload != 'function') {
		window.onload = func;
	} else {
		window.onload = function() {
			oldonload();
			func();
		}
	}
}
function addEvent(obj, event, eventHandler) {
	if(obj.addEventListener) {
		obj.addEventListener(event, eventHandler, false);
	} else if(obj.attachEvent) {
		event = 'on' + event;
		obj.attachEvent(event, eventHandler);
	}
}
function stopDefault(e) {
	if(e && e.preventDefault) e.preventDefault();
	else window.event.returnValue = false;
	return false;
}
function watchForm(form) {
	addEvent(form, 'submit', function(e){
		 if(!validateForm(form)) stopDefault(e);
	});
}
addLoadEvent(function(){
	//alert(111);
	var form = document.getElementsByTagName('form')[0];
	
	//console.log(form.nodeName);
	//console.log(trim(' aaa cc   ').length);
	watchFields(form);
	watchForm(form);
});
</script>
</head>
<body>
	<table style="width:771px;margin :  5px 0px 15px 5px;margin-left:auto;margin-right:auto" align="center">
		<tr>
			<td>
				<div class="style123w">
					<%		
							int fcount = 0;
							int scount = 0;
							int mcount = 0;
							Integer paperid = null;
 							List<Examination> elist = (ArrayList<Examination>)request.getAttribute("elist");
							for(Iterator<Examination> i = elist.iterator(); i.hasNext();) {
								Examination e = i.next();
								paperid = e.getPaperid();
					%>
					<h2 align="center"><%=e.getPapername() %></h2>
					<%
								break;
							}
					%>
					<form method="post" action="<%=request.getContextPath()%>/AnswerServlet?method=insert">
					<table width="95%" border="0" cellpadding="0" cellspacing="0" align="center">
						<tr><td> <a name="checkboxjuanbiao"></a><br><br>
 						</td></tr>
 						
 						<%
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
 								//content = content.replaceAll("_", "<input>");
 								//System.out.println(a1.length);
 								//System.out.println(temp);
 						%>
 						
 							<%
 								if(a1.length == 1) {
 							%>
 						<tr><td><strong><%=content.replaceAll("_", "<input class='input_line required text' name='answer" + k + "'>") %></strong><br>
 								<input type="hidden" value="<%=e.getId() %>" name="id<%=k%>">
 							<%
 								} else if(a1.length > 1) {
 							%>
 						<tr><td><strong><%=content.replaceAll("_", "<input class='input_line required text' name='answer" + k + "'>") %></strong><br>
 							<!-- 
 								答案：
 							-->
 							<%
 									for(int j=1; j<a1.length; j++) {
 							%>
 								<input type="hidden" value="<%=e.getId() %>" name="id<%=k%>">
 							<%
 									}
 								}
 							%>
 						</td></tr>
 						<%
 							}
 							fcount = k;
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
							<input type="hidden" value="<%=e.getId() %>" name="id<%=k%>">
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
 							scount = k - fcount;
							mcount = k;
 							for(Iterator<Examination> i = elist.iterator(); i.hasNext();) {
 								Examination e = i.next();
 								if(!e.getType().equals("2")) {
 									continue;
 								}
 								k = k + 1;
 								String content = e.getContent();
 								String[] a1 = content.split("\\$");
 								String[] a2 = a1[1].split("#");
						%>
						<tr><td>
							<span class="style1"> <strong><%=a1[0] %></strong>
							<br><br>
							<input type="hidden" value="<%=e.getId() %>" name="id<%=k%>">
							<%
								for(int j=0; j<a2.length; j++) {
							%>
							<input type="checkbox" name="answer<%=k %>" value="<%=j+1 %>" id="<%=k%><%=j+1%>"> <label onmouseover="this.className='over';" onmouseout="this.className='out';" for="11" class="out"><%=a2[j] %></label><br>
							<%
								} 
							%>
							<br><br>
							</span>
						</td></tr>
						<%
 							}
 							mcount = k - mcount;
						%>
						<tr>
							<td colspan="2" align="center"><button style="font-size: 1.0em;" id="button"><span class="ui-button-text">提交答案</span></button></td>
						</tr>
					</table>
					<input type="hidden" value="<%=fcount %>" name="fcount">
					<input type="hidden" value="<%=scount %>" name="scount">
					<input type="hidden" value="<%=mcount %>" name="mcount">
					<input type="hidden" value="<%=paperid %>" name="paperid">
					</form>
				</div>
			</td>
		</tr>
	</table>
	
</body>
</html>