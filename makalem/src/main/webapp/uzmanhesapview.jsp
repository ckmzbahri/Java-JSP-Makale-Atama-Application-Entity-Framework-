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
HttpSession oturum = request.getSession();
oturum.setAttribute("oturumismi", null);
int id=Integer.parseInt(request.getParameter("id"));
String ad=request.getParameter("ad");
String soyad=request.getParameter("soyad");
String kullanici=request.getParameter("kullanici");
String mail=request.getParameter("mail");
String sifre=request.getParameter("sifre");
String tur=request.getParameter("tur");

veri.setId(id);
veri.setAd(ad);
veri.setSoyad(soyad);
veri.setKullanici(kullanici);
veri.setMail(mail);
veri.setSifre(sifre);
veri.setTur(tur);

sonuc = islem.uupdateData(veri);

if(sonuc==true)
{
	oturum.setAttribute("oturumismi", kullanici);
	response.sendRedirect("uzmanhesap.jsp");  
}
%>



</body>
