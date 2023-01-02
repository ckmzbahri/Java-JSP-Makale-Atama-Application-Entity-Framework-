<%@page import="java.sql.ResultSet"%>
<%@page import="java.security.MessageDigest"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<jsp:useBean id="islem" class="yazar.baglanti" scope="page"></jsp:useBean>
<jsp:useBean id="veri" class="yazar.getset" scope="page" ></jsp:useBean>
</head>
<body>


<%
int i=0;
int b=0;
boolean sonuc=false;
String kullaniciadi=request.getParameter("kullanici");
String sifre=request.getParameter("sifre");

MessageDigest mdAlgorithm = MessageDigest.getInstance("MD5");
mdAlgorithm.update(sifre.getBytes());
byte[] digest = mdAlgorithm.digest();
StringBuffer hexString = new StringBuffer();
for (int j = 0; j < digest.length; j++) {
	 sifre = Integer.toHexString(0xFF & digest[j]);

    if (sifre.length() < 2) {
   	 sifre = "0" + sifre;
    }
    hexString.append(sifre);
}


HttpSession oturum = request.getSession();
oturum.setAttribute("oturumismi", null);
ResultSet rs = islem.Kontrol();
while (rs.next()) {
	b+=1;

	String ka = rs.getString("kullanici");
	String sf = rs.getString("sifre");

	if (kullaniciadi.equals(ka) && hexString.toString().equals(sf)) {
		oturum.setAttribute("oturumismi", kullaniciadi);

		response.sendRedirect("yazarana.jsp");
	} 	
	
	else if(!kullaniciadi.equals(ka)|| !hexString.toString().equals(sf))
	{
		i+=1;	
	}  
}
	
	if(i==b)
	{
		
		response.sendRedirect("yanlisyazar.jsp");
		
	}
	
%>
</body>
</html>