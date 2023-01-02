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
int i=0;
int b=0;
boolean sonuc=false;
String kullaniciadi=request.getParameter("kullanici");
String sifre=request.getParameter("sifre");

//veri.setKullanici(kullaniciadi);
//veri.setSifre(sifre);
HttpSession oturum = request.getSession();
oturum.setAttribute("oturumismi", null);
ResultSet rs = islem.bak();
while (rs.next()) {
	b+=1;

	String ka = rs.getString("kullanici");
	String sf = rs.getString("sifre");

	if (kullaniciadi.equals(ka) && sifre.equals(sf)) {
		oturum.setAttribute("oturumismi", kullaniciadi);

		response.sendRedirect("uzmanana.jsp");
	} 	
	
	else if(!kullaniciadi.equals(ka)|| !sifre.equals(sf))
	{
		i+=1;	
	}  
}
	
	if(i==b)
	{
		
		response.sendRedirect("yanlisuzman.jsp");
		
	}
	


%>
</body>
</html>