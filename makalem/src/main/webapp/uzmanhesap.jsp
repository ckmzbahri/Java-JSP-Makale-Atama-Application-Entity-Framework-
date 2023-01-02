<%@page import="java.sql.ResultSet"%>
<%@page import="com.sun.net.httpserver.Authenticator.Result"%>
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



  
<div class="w3-row-padding" style="margin:0 -16px">
    <form class="modal-content animate" action="uzmanhesapview.jsp" method="post">
    
        <li class="w3-dark-grey w3-xlarge w3-padding-32">GİRİŞ</li>
        <ul class="w3-ul w3-white w3-center w3-opacity w3-hover-opacity-off">
           <br>
  <br>
<jsp:useBean id="veri" class="uzman.getset" scope="page" ></jsp:useBean>
<jsp:useBean id="islem" class="uzman.baglanti" scope="page"></jsp:useBean>
<jsp:useBean id="datam" class="kategori.baglanti"></jsp:useBean>
 <%
 boolean sonuc=false;

 String kullanici = (String) oturum.getAttribute("oturumismi");
 veri.setKullanici(kullanici);
 sonuc = islem.VeriAldım(veri);
  if (sonuc=true)
{
   ResultSet rs = islem.selectData();
   while(rs.next()){ %>
  <font face="tahoma" size="4" color="rgba(72,72,72,0.4)">İD</font>
  <p class="id">
<input type ="text" style="width: 202px; height: 30px;" name="id" value= "<%=rs.getString("id")%>"readonly></input>
</p>
<font face="tahoma" size="4" color="rgba(72,72,72,0.4)">AD</font>
<p class="ad">
<input name="ad" type="text" style="width: 202px; height: 30px;" required= "required" class="validate[required,custom[onlyLetter],length[0,100]] feedback-input" value="<%=rs.getString("ad") %>" id="ad"/>
</p>
      
      
<font face="tahoma" size="4" color="rgba(72,72,72,0.4)">SOYAD</font>
<p class="soyad">
<textarea name="soyad" type="text"  style="width: 202px; height: 30px;" required= "required" class="validate[required,custom[onlyLetter],length[0,300]] feedback-input" value="<%=rs.getString("soyad") %>" id="soyad"><%=rs.getString("soyad") %></textarea>
</p> 
      
      
<font face="tahoma" size="4" color="rgba(72,72,72,0.4)">KULLANICI ADI</font>
<p class="kullanici">
<textarea name="kullanici" type="text" style="width: 202px; height: 30px;" required= "required" class="validate[required,custom[onlyLetter],length[0,300]] feedback-input" value="<%=rs.getString("kullanici") %>" id="kullanici"><%=rs.getString("kullanici") %></textarea>
</p> 
 
  <font face="tahoma" size="4" color="rgba(72,72,72,0.4)">ŞİFRE</font>
<p class="sifre">
<input name="sifre" type="password" class="validate[required,custom[]] feedback-input" required= "required" id="sifre" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{5,}" title=" Şifre en az 5 karakter,en az bir büyük,en az bir küçük harf" value="<%=rs.getString("sifre") %>" />
</p> 
 <font face="tahoma" size="4" color="rgba(72,72,72,0.4)">MAİL ADRESİ</font>
<p class="mail">
          <input name="mail" type="text" class="validate[required,custom[]] feedback-input" required= "required" id="mail" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"title="E-mail formatında giriniz." value="<%=rs.getString("mail") %>" />
</p> 
<font face="tahoma" size="4" color="rgba(72,72,72,0.4)">ALAN</font>
<p class="tur">  
  <select  id="tur" name="tur" face="tahoma" style="width: 202px; height: 30px;">
     <% 
  ResultSet r=datam.selectAllData();
  while(r.next()) { %>
    <option value="<%=r.getString("tur") %>" ><%=r.getString("tur") %></option>
    
     <%} %>
  </select>
  </p>
   <font face="tahoma" size="4" color="rgba(72,72,72,0.4)">PUAN</font>
<p class="puan">
<textarea name="puan" type="text" style="width: 202px; height: 30px;" readonly required= "required" class="validate[required,custom[onlyLetter],length[0,300]] feedback-input" value="<%=rs.getString("puan") %>" id="puan"><%=rs.getString("puan") %></textarea>
</p> 

  <br>
  <br>
      
 <div class="submit">
       <button type="submit" value="GÜNCELLE" class="button button5">GÜNCELLE</button>
       </div>
           <br>
             
         <%}
    } %>
    
      </form>

     
    </div>




</body>
</html>