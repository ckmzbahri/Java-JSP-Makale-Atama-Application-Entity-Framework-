<%@ page language="java" contentType="text/html; charset=ISO-8859-9"
    pageEncoding="ISO-8859-9"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-9">
<title>Insert title here</title>
</head>
<body>



<jsp:useBean id="islem" class="makale.baglanti" scope="page"></jsp:useBean>
<jsp:useBean id="veri" class="makale.getset" scope="page" ></jsp:useBean>
</head>
<body>

<%

boolean sonuc=false;
int id=Integer.parseInt(request.getParameter("id"));
String rapor=request.getParameter("rapor");
veri.setId(id);
veri.setRapor(rapor);

sonuc = islem.raporyayin(veri);

if(sonuc==true){ 
	response.sendRedirect("uzmanmakale.jsp");  }
else
{	response.sendRedirect("raporyaz.jsp");  }
%>



</body>
</html>