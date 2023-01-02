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
boolean sonuc=false;

String ad=request.getParameter("ad");
String soyad=request.getParameter("soyad");
String kullanici=request.getParameter("kullanici");
String mail=request.getParameter("mail");
String sifre=request.getParameter("sifre");

 MessageDigest mdAlgorithm = MessageDigest.getInstance("MD5");
 mdAlgorithm.update(sifre.getBytes());
 byte[] digest = mdAlgorithm.digest();
 StringBuffer hexString = new StringBuffer();
 for (int i = 0; i < digest.length; i++) {
	 sifre = Integer.toHexString(0xFF & digest[i]);

     if (sifre.length() < 2) {
    	 sifre = "0" + sifre;
     }
     hexString.append(sifre);
 }

veri.setAd(ad);
veri.setSoyad(soyad);
veri.setKullanici(kullanici);
veri.setMail(mail);
veri.setSifre(hexString.toString());

int sayi=0;
int i=0;
ResultSet rs=islem.yazar();
while(rs.next())
{   sayi+=1;
	String ka=rs.getString("kullanici");
	if(!kullanici.equals(ka))
	{
		i+=1;
		
	}
		
		
}
	
	if(sayi==i)
	{
		
		sonuc = islem.insertData(veri);

		if(sonuc==true){ 
			response.sendRedirect("yazarkayit.jsp");
		
		}	
	}

	else
{
	response.sendRedirect("kullaniciadi.jsp"); 

}




%>




</body>
</html>