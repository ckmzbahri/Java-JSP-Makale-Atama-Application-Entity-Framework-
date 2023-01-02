<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>



<jsp:useBean id="islem" class="makale.baglanti" scope="page"></jsp:useBean>
<jsp:useBean id="veri" class="makale.getset" scope="page" ></jsp:useBean>
</head>
<body>

<%

boolean sonuc=false;
int id=Integer.parseInt(request.getParameter("id"));
String baslik=request.getParameter("baslik");
String icerik=request.getParameter("icerik");
String tur=request.getParameter("tur");
String durum=request.getParameter("tur");
veri.setBaslik(baslik);
veri.setIcerik(icerik);
veri.setTur(tur);
veri.setId(id);
veri.setDurum(durum);

sonuc = islem.updateData(veri);

if(sonuc==true){ 
	response.sendRedirect("makaleler.jsp");  }
else
{	response.sendRedirect("makaleguncelle.jsp");  }
%>



</body>
</html>