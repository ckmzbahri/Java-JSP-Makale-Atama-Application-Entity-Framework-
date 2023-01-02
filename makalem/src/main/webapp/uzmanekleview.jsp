<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<jsp:useBean id="islem" class="uzman.baglanti" scope="page"></jsp:useBean>
<jsp:useBean id="veri" class="uzman.getset" scope="page" ></jsp:useBean>
</head>
<body>

<%
boolean sonuc=false;
boolean s=false;
String ad=request.getParameter("ad");
String soyad=request.getParameter("soyad");
String kullanici=request.getParameter("kullanici");
String mail=request.getParameter("mail");
String sifre=request.getParameter("sifre");
String tur=request.getParameter("tur");
int puan=0;
veri.setAd(ad);
veri.setSoyad(soyad);
veri.setKullanici(kullanici);
veri.setMail(mail);
veri.setSifre(sifre);
veri.setTur(tur);
veri.setPuan(puan);


int sayi=0;
int i=0;
ResultSet rs=islem.uzman();
while(rs.next())
{   sayi+=1;
	String ka=rs.getString("kullanici");
	if(!kullanici.equals(ka))
	{
		i+=1;
		System.out.println("asdasdasdasd");
	}
		
		
}
	
	if(sayi==i)
	{
		
		sonuc = islem.insertData(veri);
		System.out.println("aaaaaaaaaaaaaaaaaaa");
		if(sonuc==true){ 
			response.sendRedirect("uzmanlar.jsp");
			System.out.println("vvvvvvvvvvvvvvvv");
		}	
	}

	else
{
	response.sendRedirect("uzmankullanici.jsp"); 

}


%>




</body>
</html>