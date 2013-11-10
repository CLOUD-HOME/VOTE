<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
			form {
				font-family:Arial;
				font-size:14px;
				width:300px;
			}
			fieldset {
				border:1px solid #ccc;
				margin-bottom:10px;
			}
			fieldset.login input {
				width:125px;
			}
			legend {
				font-weight:bold;
				font-size:1.1em;
			}
			label {
				display:block;
				width:60px;
				text-align:right;
				float:left;
				padding-right:10px;
				margin:5px 0px;
			}
			input {
				margin:5px 0;
			}
			input.text {
				padding:0 0 0 3px;
				width:172px;
			}
			input.submit {
				margin:15px 0 0 70px;
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
				required:{
					msg:'This field is required.',
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
					 if(checkRequired(form.elements[i]))
						 	   valid = false;
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
				if (next && (next.nodeName != 'UL' || next.className != 'errors')) {
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
				if(elem.type == 'checkbox' || elem.type == 'radio')
				      return getInputsByName(elem.name).numChecked;
			    else 
				      return elem.value.length > 0 && elem.value != elem.defaultValue;
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
	<form action="" method="post">
		<fieldset class="login">
			<legend>Login Information</legend>
			<label for="username" class="hover">Username</label>
			<input type="text" id="username" class="required text"/><br/>
			
			<label for="password" class="hover">Password</label>
		    <input type="password" id="password" class="required text"/>
		</fieldset>
		<fieldset>
			<legend>Personal Information</legend>
			<label for="name">Name</label>
			<input type="text" id="name" class="required text"/><br/>
			
			<label for="email">Email</label>
			<input type="text" id="email" class="required email text"/><br/>
			
			<label for="date">Date</label>
			<input type="text" id="date" class="required date text"/><br/>
			
			<label for="url">Website</label>
			<input type="text" id="url" class="url text" value="http://"/><br/>
			
			<label for="phone">Phone</label>
			<input type="text" id="phone" class="phone text"/><br/>
			
			<label for="age">Over 13?</label>
			<input type="checkbox" id="age" name="age" value="yes"/><br/>
			
			<input type="submit" value="Submit Form" class="submit"/>
			<button>sssss</button>
		</fieldset>
	</form>
</body>

</html>