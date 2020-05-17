<%@include file="onkokirjauduttu.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.Vene"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>
<link rel="stylesheet" type="text/css" href="main.css">
<title>Veneen poistaminen</title>
</head>
<%
	Vene vene=null;
	if(request.getAttribute("vene")!=null){
		vene = (Vene)request.getAttribute("vene");
	}else{
		response.sendRedirect("listaaveneet.jsp");
	}
%>
<body>
<%
	out.print("Kirjautuneena: " + session.getAttribute("kayttaja") + "<br>");
%>
<center>
<form action="PoistaVene" method="post" name="PoistaLomake" id="PoistaLomake">
	<input type="hidden" name="tunnus" value="<%=request.getParameter("tunnus")%>">
	<table>
		<tr>
			<th align="right" style="width:33%" class="pysty">Nimi:</th>
			<td><input type="text" name="nimi" id="nimi" value="<%=vene.getNimi()%>" readonly></td>
		</tr>
		<tr>
			<th align="right" class="pysty">Merkkimalli:</th>
			<td><input type="text" name="merkkimalli" id="merkkimalli" value="<%=vene.getMerkkimalli()%>" readonly></td>
		</tr>
		<tr>
			<th align="right" class="pysty">Pituus:</th>
			<td><input type="text" name="pituus" id="pituus" value="<%=vene.getPituus()%>" readonly></td>
		</tr>
		<tr>
			<th align="right" class="pysty">Leveys:</th>
			<td><input type="text" name="leveys" id="leveys" value="<%=vene.getLeveys()%>" readonly></td>
		</tr>
		<tr>
			<th align="right" class="pysty">Hinta:</th>
			<td><input type="text" name="hinta" id="hinta" value="<%=vene.getHinta()%>" readonly></td>
		</tr>
		<tr>
			<td colspan="2" class="nappiSarake"><input type="submit" value="Vahvista poisto">
			<input type="button" value="Kaikki veneet" id="kaikki"></td>
		</tr>
	</table>
</form>
</center>
<script>
	$(document).ready(function(){
		$("#nimi").focus();
	    $("#kaikki").click(function(){	    	
	    	window.location.href = 'HaeVeneet';
		});
	});

</script>
</body>
</html>