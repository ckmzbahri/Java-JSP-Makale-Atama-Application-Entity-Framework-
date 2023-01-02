<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<jsp:useBean id="islem" class="editor.baglanti" scope="page"></jsp:useBean>
<jsp:useBean id="veri" class="editor.getset" scope="page" ></jsp:useBean>
</head>
<body>

<%
boolean sonuc=false;

String ad=request.getParameter("ad");
String soyad=request.getParameter("soyad");
String kullanici=request.getParameter("kullanici");
String mail=request.getParameter("mail");
String sifre=request.getParameter("sifre");
veri.setAd(ad);
veri.setSoyad(soyad);
veri.setKullanici(kullanici);
veri.setMail(mail);
veri.setSifre(sifre);

sonuc = islem.updateData(veri);

if(sonuc==true){ 
	response.sendRedirect("editorhesap.jsp");  }
else
{	response.sendRedirect("editorana.jsp");  }
%>




</body>
</html>