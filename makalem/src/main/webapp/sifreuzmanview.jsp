<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="islem" class="uzman.baglanti" scope="page"></jsp:useBean>
<jsp:useBean id="veri" class="uzman.getset" scope="page" ></jsp:useBean>
<%
boolean sonuc=false;
String ka=request.getParameter("kullanici");
String sf=request.getParameter("sifre");
veri.setKullanici(ka);
veri.setSifre(sf);
sonuc = islem.sifresifirla(veri);
if(sonuc==true)
	response.sendRedirect("anasayfa.jsp?sonuc=1");
else
	response.sendRedirect("anasayfa.jsp?sonuc=0");
%>

</body>
</html>