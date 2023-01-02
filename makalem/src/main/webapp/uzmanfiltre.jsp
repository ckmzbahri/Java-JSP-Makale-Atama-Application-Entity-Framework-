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
<meta charset="ISO-8859-9">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body, h1,h2,h3,h4,h5,h6 {font-family: "Montserrat", sans-serif}
.w3-row-padding img {margin-bottom: 12px}
/* Set the width of the sidebar to 120px */
.w3-sidebar {width: 120px;background: #222;}
/* Add a left margin to the "page content" that matches the width of the sidebar (120px) */
#main {margin-left: 120px}
/* Remove margins from "page content" on small screens */
@media only screen and (max-width: 600px) {#main {margin-left: 0}}
</style>
<body class="w3-black">

<!-- Icon Bar (Sidebar - hidden on small screens) -->
<nav class="w3-sidebar w3-bar-block w3-small w3-hide-small w3-center">
  <!-- Avatar image in top left corner -->
  <img src="https://pbs.twimg.com/media/Ez_s0dwXMAAdItq.jpg" style="width:100%">
  <a href="uzmanana.jsp" class="w3-bar-item w3-button w3-padding-large w3-black">
    <i class="fa fa-home w3-xxlarge"></i>
    <p>ANASAYFA</p>
  </a>
  <a href="uzmanhesap.jsp" class="w3-bar-item w3-button w3-padding-large w3-black">
    <i class="fa fa-home w3-xxlarge"></i>
    <p>PROFİL</p>
  </a>
  <a href="uzmanmakale.jsp" class="w3-bar-item w3-button w3-padding-large w3-black">
    <i class="fa fa-home w3-xxlarge"></i>
    <p>MAKALELER</p>
  </a>
   <a href="uzmangiris.jsp" class="w3-bar-item w3-button w3-padding-large w3-hover-black">
    <i class="fa fa-eye w3-xxlarge"></i>
    <p>ÇIKIŞ</p>
  </a>

</nav>

<!-- Navbar on small screens (Hidden on medium and large screens) -->
<div class="w3-top w3-hide-large w3-hide-medium" id="myNavbar">
  <div class="w3-bar w3-black w3-opacity w3-hover-opacity-off w3-center w3-small">
    <a href="uzmanana.jsp" class="w3-bar-item w3-button" style="width:25% !important">ANASAYFA</a>
    <a href="uzmanhesap.jsp" class="w3-bar-item w3-button" style="width:25% !important">PROFİL</a>
        <a href="uzmanmakale.jsp" class="w3-bar-item w3-button" style="width:25% !important">MAKALELER</a>
    <a href="uzmangiris.jsp" class="w3-bar-item w3-button" style="width:25% !important">ÇIKIŞ</a>
  </div>
</div>




  

<!-- END PAGE CONTENT -->
<!DOCTYPE html>
<html>
<head>
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #bbbbbb;
}
</style>
</head>
<body>



</body>
</html>
 

<div class="w3-row-padding" style="margin:0 -16px">
   
    
       
        <ul class="w3-ul w3-white w3-center w3-opacity w3-hover-opacity-off">
            <h2>MAKALELER</h2>

      <form class="navbar-form navbar-left" action="uzmanfiltre.jsp">
    <li>  <div class="form-group">
     <jsp:useBean id="datam" class="durum.baglanti" scope="page"></jsp:useBean>
  <jsp:useBean id="verim" class="durum.getset"></jsp:useBean>
          <select  id="tur" name="filtre" face="tahoma"  style="width: 100px ">
     <% 
  ResultSet r=datam.selecttAllData();
  while(r.next()) { %>
    <option value="<%=r.getString("durum") %>" ><%=r.getString("durum") %></option>
     <%} %>
  </select>
    <button type="submit" class="btn btn-default"  style="width: 96px ">Ara</button>
    </form>

 <jsp:useBean id="islem" class="makale.baglanti"></jsp:useBean>
  <jsp:useBean id="veri" class="makale.getset"></jsp:useBean>
    <jsp:useBean id="ver" class="uzman.getset"></jsp:useBean>
   <jsp:useBean id="isle" class="uzman.baglanti"></jsp:useBean>
            <div style="margin-left:130px; margin-right: 10px;">
 <table>
  <tr>
    <th>BAŞLIK</th>
   <th>MAKALE</th>
    <th>ALAN</th>
<th>DURUM</th>
      <th>TARİH</th>
     <th>NO</th>
     <th>Geri Çevir</th>
  <th>Kabul ET</th>
  <th>Rapor Yaz</th>
  <% 
  boolean sonuc=false;
  String filtre=request.getParameter("filtre");

 if (filtre.equals("hepsi"))
  {
		response.sendRedirect("uzmanmakale.jsp"); 
  }
 else
 {
	 boolean s=false;

	  String kullanici = (String) oturum.getAttribute("oturumismi");
	  System.out.println(kullanici);
	  ver.setKullanici(kullanici);
	  s = isle.VeriAldım(ver);
	  if (sonuc=true)
	  {
	     ResultSet rs = isle.selectData();
	     while(rs.next()){
	             String mail=rs.getString("mail");
	             veri.setInceleyen(mail);
	             System.out.println(mail);}
	    } %>
	  <%

  System.out.println(filtre);
  veri.setFiltre(filtre);
  islem.ver(veri);
   if (sonuc=true)
   {
  ResultSet rs=islem.uzmanfiltrele();
  while(rs.next()) { %>
 <form class="modal-content animate"  method="post">
  <tbody>
  <tr>
     <td><%=rs.getString("baslik") %></td>
      <td><%=rs.getString("icerik") %></td>
      <td><%=rs.getString("tur") %></td>
      <td><%=rs.getString("durum") %></td>
       <td><%=rs.getString("tarih") %></td>
       <td><input type ="text" name="id" disabled value= "<%=rs.getString("id")%>"></input></td>
        <% if (rs.getString("durum").equals("beklemede"))
        {%>
        <td><a href='makaleguncelle.jsp?id=<%=rs.getInt("id")%>'>Geri Çevir<span class="glyphicon glyphicon-edit" style="font-size:24px; color:green;"></span></a></td>
         <td><a href='makaleguncelle.jsp?id=<%=rs.getInt("id")%>'>Kabul Et<span class="glyphicon glyphicon-edit" style="font-size:24px; color:green;"></span></a></td>
         <td>-</td>
           <% 
         }%>
          <% if (rs.getString("durum").equals("atandi"))
        {%>
        <td>-</td>
         <td>-</td>
        <td><a href='makaleguncelle.jsp?id=<%=rs.getInt("id")%>'>RAPOR YAZ<span class="glyphicon glyphicon-edit" style="font-size:24px; color:green;"></span></a></td>
       
           <% 
         }%>

  </tr>
   </form>
      <%}
   }
    } %>
  
  </table>
</div>
        </ul>
            <li class="w3-dark-grey w3-xlarge w3-padding-20"></li>


     
    </div>




<!-- END PAGE CONTENT -->


</body>
</html>