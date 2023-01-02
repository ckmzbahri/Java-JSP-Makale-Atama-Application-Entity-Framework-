<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="islem" class="kategori.baglanti" scope="page"></jsp:useBean>
  <% 
  int id=Integer.parseInt(request.getParameter("id"));
  boolean sonuc=islem.deleteData(id);
  if (sonuc==true)response.sendRedirect("kategori.jsp"); 
  %>
</body>
</html>