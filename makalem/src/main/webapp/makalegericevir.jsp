<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-9"
    pageEncoding="ISO-8859-9"%>
         <%  HttpSession oturum= request.getSession();
       String isim=null;
       isim = (String) oturum.getAttribute("oturumismi");
if (isim==null)
	response.sendRedirect("anasayfa.jsp");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-9">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="islem" class="makale.baglanti" scope="page"></jsp:useBean>
<jsp:useBean id="veri" class="makale.getset" scope="page"></jsp:useBean>
   <jsp:useBean id="ver" class="uzman.getset"></jsp:useBean>
   <jsp:useBean id="isle" class="uzman.baglanti"></jsp:useBean>
  <script>
  alert("MAKALE İNCELEME KABUL EDİLMEDİ!!");
</script>
  <% 
  
  boolean s=false;

  String kullanici = (String) oturum.getAttribute("oturumismi");
  System.out.println(kullanici);
  ver.setKullanici(kullanici);
  s = isle.VeriAldim(ver);
  if (s=true)
  {
     ResultSet rs = isle.selectData();
     while(rs.next()){
    	 int ii=rs.getInt("id");
             String mail=rs.getString("mail");
             int puan=rs.getInt("puan");
             ver.setPuan(puan);
             ver.setId(ii);
             System.out.println("bu kadar"+puan);
             boolean gun = isle.puanaz(ver);        
     }
    } %>
  <% 
  boolean sonuc=false;
  int id=Integer.parseInt(request.getParameter("id"));
  System.out.println(id);
  String durum=request.getParameter("durum");
  veri.setDurum(durum);
  veri.setId(id);
  sonuc=islem.gericevir(veri);
  if (sonuc==true)response.sendRedirect("uzmanmakale.jsp"); 
  %>

</body>
</html>