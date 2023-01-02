<%@page import="java.security.MessageDigest"%>
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
String ka=request.getParameter("kullanici");
String sf=request.getParameter("sifre");
MessageDigest mdAlgorithm = MessageDigest.getInstance("MD5");
mdAlgorithm.update(sf.getBytes());
byte[] digest = mdAlgorithm.digest();
StringBuffer hexString = new StringBuffer();
for (int i = 0; i < digest.length; i++) {
	 sf = Integer.toHexString(0xFF & digest[i]);

    if (sf.length() < 2) {
   	 sf = "0" + sf;
    }
    hexString.append(sf);
}
veri.setKullanici(ka);
veri.setSifre(hexString.toString());
sonuc = islem.sifresifirla(veri);
if(sonuc==true)
	response.sendRedirect("anasayfa.jsp?sonuc=1");
else
	response.sendRedirect("anasayfa.jsp?sonuc=0");
%>

</body>
</html>