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
</head>
<body>

<%
boolean sonuc=false;
int id=Integer.parseInt(request.getParameter("id"));
String ad=request.getParameter("ad");
String soyad=request.getParameter("soyad");
String tur=request.getParameter("tur");
String mail=request.getParameter("mail");
String kullanici=request.getParameter("kullanici");
veri.setAd(ad);
veri.setSoyad(soyad);
veri.setId(id);
veri.setTur(tur);
veri.setMail(mail);
veri.setKullanici(kullanici);
sonuc = islem.updateData(veri);

if (sonuc == true) {
	response.sendRedirect("uzmanlar.jsp");
} else {
	response.sendRedirect("uzmanguncelle.jsp");
}
%>



</body>
</html>