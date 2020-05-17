<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>
<link rel="stylesheet" type="text/css" href="main.css">
<title>Kirjautuminen</title>
</head>
<body>
<center>
<div id="kirjaudu">
	<form action="TutkiKirjaudu" method="post" name="kirjauduLomake" id="kirjauduLomake">
		<span class="login">Tunnus: </span><input type="text" name="uid" id="uid" value=""><br>
		<span class="login">Salasana: </span><input type="password" name="pwd" value=""><br>
		<span class="login"></span><input type="submit" value="Kirjaudu">
	</form>
	<%
	if(request.getParameter("login")!=null){
		if(request.getParameter("login").equals("0")){
			out.print("Antamasi tunnus/salasana ei kelpaa!");
		}	
	}
	%>
</div>
</center>
<script>
	$(document).ready(function(){
		$("#uid").focus();	
		$("#kirjauduLomake").validate({						
			rules: {
				uid:  {
					required: true					
				},	
				pwd:  {
					required: true
				}		
			},
			messages: {
				uid: {
					required: "Pakollinen"					
				},
				pwd: {
					required: "Pakollinen"
				}
			},			
			submitHandler: function (form) {				
				document.forms["kirjauduLomake"].submit();
			}		
		});
	});
</script>
</body>
</html>