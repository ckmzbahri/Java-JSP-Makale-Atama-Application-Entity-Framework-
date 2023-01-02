<%@ page language="java" contentType="text/html; charset=ISO-8859-9"
    pageEncoding="ISO-8859-9"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-9">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="islem" class="makale.baglanti" scope="page"></jsp:useBean>
<jsp:useBean id="veri" class="makale.getset" scope="page"></jsp:useBean>
  <script>
  alert("MAKALE İNCELEME KABUL EDİLMEDİ!!");
</script>
  <% 
  boolean sonuc=false;
  int id=Integer.parseInt(request.getParameter("id"));
  System.out.println(id);
  String durum=request.getParameter("durum");
  veri.setDurum(durum);
  veri.setId(id);
  sonuc=islem.kabul(veri);
  if (sonuc==true)response.sendRedirect("uzmanmakale.jsp"); 
  %>

</body>
</html>