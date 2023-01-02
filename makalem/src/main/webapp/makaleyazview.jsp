<%@page import="javax.print.attribute.standard.DateTimeAtCompleted"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
         <%  HttpSession oturum= request.getSession();
       String isim=null;
       isim = (String) oturum.getAttribute("oturumismi");
if (isim==null)
	response.sendRedirect("anasayfa.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<jsp:useBean id="islem" class="makale.baglanti" scope="page"></jsp:useBean>
<jsp:useBean id="veri" class="makale.getset" scope="page" ></jsp:useBean>
<jsp:useBean id="verim" class="yazar.getset" scope="page" ></jsp:useBean>
<jsp:useBean id="data" class="yazar.baglanti" scope="page"></jsp:useBean>
</head>
<body>

<%

boolean sonuc=false;
String yazar = (String) oturum.getAttribute("oturumismi");
String baslik=request.getParameter("baslik");
String icerik=request.getParameter("icerik");
String durum="atanmadi";
String tur=request.getParameter("tur");
veri.setBaslik(baslik);
veri.setIcerik(icerik);
veri.setDurum(durum);
veri.setTur(tur);
veri.setYazar(yazar);

sonuc = islem.insertData(veri);

if(sonuc==true){ 
	response.sendRedirect("yazarana.jsp");  }
else
{	response.sendRedirect("makaleyaz.jsp");  }
%>




</body>
</html>