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
  <a href="editorana.jsp" class="w3-bar-item w3-button w3-padding-large w3-black">
    <i class="fa fa-home w3-xxlarge"></i>
    <p>ANASAYFA</p>
  </a>
  <a href="editorhesap.jsp" class="w3-bar-item w3-button w3-padding-large w3-black">
    <i class="fa fa-cogs w3-xxlarge"></i>
    <p>PROFİL</p>
  </a>
   <a href="uzmanlar.jsp" class="w3-bar-item w3-button w3-padding-large w3-black">
    <i class="fa fa-male w3-xxlarge"></i>
    <p>UZMANLAR</p>
  </a>
   <a href="makaleislem.jsp" class="w3-bar-item w3-button w3-padding-large w3-black">
    <i class="fa fa-book w3-xxlarge"></i>
    <p>MAKALELER</p>
  </a>
    </a>
   <a href="kategori.jsp" class="w3-bar-item w3-button w3-padding-large w3-black">
    <i class="fa fa-list w3-xxlarge"></i>
    <p>KATEGORİ</p>
  </a>
     <a href="yazarlar.jsp" class="w3-bar-item w3-button w3-padding-large w3-black">
    <i class="fa fa-pencil w3-xxlarge"></i>
    <p>YAZARLAR</p>
  </a>
   <a href="editorgiris.jsp" class="w3-bar-item w3-button w3-padding-large w3-hover-black">
    <i class="fa fa-arrow-left w3-xxlarge"></i>
    <p>ÇIKIŞ</p>
  </a>

</nav>

<!-- Navbar on small screens (Hidden on medium and large screens) -->
<div class="w3-top w3-hide-large w3-hide-medium" id="myNavbar">
  <div class="w3-bar w3-black w3-opacity w3-hover-opacity-off w3-center w3-small">
    <a href="editorana.jsp" class="w3-bar-item w3-button" style="width:25% !important">ANASAYFA</a>
    <a href="edıtorhesap.jsp" class="w3-bar-item w3-button" style="width:25% !important">PROFİL</a>
    <a href="uzmanlar.jsp" class="w3-bar-item w3-button" style="width:25% !important">UZMANLAR</a>
    <a href="makaleislem.jsp" class="w3-bar-item w3-button" style="width:25% !important">MAKALELER</a>
    <a href="kategori.jsp" class="w3-bar-item w3-button" style="width:25% !important">KATEGORİ</a>
    <a href="yazarlar.jsp" class="w3-bar-item w3-button" style="width:25% !important">YAZARLAR</a>
    <a href="editorgiris.jsp" class="w3-bar-item w3-button" style="width:25% !important">ÇIKIŞ</a>
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

      <form class="navbar-form navbar-left" action="editorfiltre.jsp">
    <li>  <div class="form-group">
     <jsp:useBean id="datam" class="durum.baglanti" scope="page"></jsp:useBean>
  <jsp:useBean id="verim" class="durum.getset"></jsp:useBean>
          <select  id="tur" name="filtre" face="tahoma"  style="width: 100px ">
     <% 
  ResultSet r=datam.selectAllData();
  while(r.next()) { %>
    <option value="<%=r.getString("durum") %>" ><%=r.getString("durum") %></option>
     <%} %>
  </select>
    <button type="submit" class="btn btn-default"  style="width: 96px ">Ara</button>
    </form>

 <jsp:useBean id="islem" class="makale.baglanti"></jsp:useBean>
  <jsp:useBean id="veri" class="makale.getset"></jsp:useBean>
            <div style="margin-left:130px; margin-right: 10px;">
 <table>
  <tr>
   <th>BAŞLIK</th>
   <th>MAKALE</th>
    <th>ALAN</th>
<th>DURUM</th>
      <th>TARİH</th>
      <th>YAZAR</th>
        <th>NO</th>
      <th>İNCELEYEN</th>
      <th>RAPOR</th>
   
     <th>SIL</th>
     <th>ATA</th>
  <% 
  
  boolean sonuc=false;
  ResultSet rs=islem.selectAllData();
  while(rs.next()) { %>
 <form class="modal-content animate" action="geziguncelleme.jsp" method="post">
  <tbody>
  <tr>
     <td><%=rs.getString("baslik") %></td>
      <td><%=rs.getString("icerik") %></td>
      <td><%=rs.getString("tur") %></td>
      <td><%=rs.getString("durum") %></td>
       <td><%=rs.getString("tarih") %></td>
        <td><%=rs.getString("yazar") %></td>
        <td><input type ="text" name="id" disabled value= "<%=rs.getString("id")%>"></input></td>
          <% if (rs.getString("durum").equals("beklemede"))
        {%>
        <td><%=rs.getString("inceleyen") %></td>
        <td></td>
           <td></td>
        <td></td>
           <% 
         }%>
       
         <% if (rs.getString("durum").equals("atandi"))
        {%>
          
         <td><%=rs.getString("inceleyen") %></td>
        <td><%=rs.getString("rapor") %></td>
        <td></td>
        <td></td>
        
           <% 
         }%>
       
         <% if (rs.getString("durum").equals("atanmadi"))
        {%>
        <td></td>
        <td></td>
        
       <td><a href='makalered.jsp?id=<%=rs.getInt("id")%>'>Sil<span class="glyphicon glyphicon-edit" style="font-size:24px; color:green;"></span></a></td>
          <% 
         }%>
        <% if (rs.getString("durum").equals("atanmadi"))
        {%>
        <td><a href='makaleata.jsp?id=<%=rs.getInt("id")%>'>ATA<span class="glyphicon glyphicon-edit" style="font-size:24px; color:green;"></span></a></td>
           <% 
         }%>

  </tr>
   </form>
      <%}
     %>
  
  </table>
</div>
        </ul>
            <li class="w3-dark-grey w3-xlarge w3-padding-20"></li>


     
    </div>
  


<!-- END PAGE CONTENT -->

<script>
  alert(" GÖNDERMEK İSTEDİĞİNİZ MAKALE İLE AYNI ALANA KAYITLI UZMAN BULUNAMAMIŞTIR.!");
</script>
</body>
</html>