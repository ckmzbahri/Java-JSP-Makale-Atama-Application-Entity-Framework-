<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<jsp:useBean id="islem" class="yazar.baglanti" scope="page"></jsp:useBean>
<jsp:useBean id="veri" class="yazar.getset" scope="page" ></jsp:useBean>
<%
boolean sonuc=false;
HttpSession oturum = request.getSession();
oturum.setAttribute("oturumismi", null);
int id=Integer.parseInt(request.getParameter("id"));
String ad=request.getParameter("ad");
String soyad=request.getParameter("soyad");
String kullanici=request.getParameter("kullanici");
String mail=request.getParameter("mail");

veri.setId(id);
veri.setAd(ad);
veri.setSoyad(soyad);
veri.setKullanici(kullanici);
veri.setMail(mail);
sonuc = islem.updateData(veri);

if(sonuc==true)
	response.sendRedirect("yazarhesap.jsp");  
%>



</body>
</html>