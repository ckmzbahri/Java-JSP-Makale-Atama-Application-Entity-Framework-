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
    <p>PROF?L</p>
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
    <p>KATEGOR?</p>
  </a>
     <a href="yazarlar.jsp" class="w3-bar-item w3-button w3-padding-large w3-black">
    <i class="fa fa-pencil w3-xxlarge"></i>
    <p>YAZARLAR</p>
  </a>
   <a href="editorgiris.jsp" class="w3-bar-item w3-button w3-padding-large w3-hover-black">
    <i class="fa fa-arrow-left w3-xxlarge"></i>
    <p>?IKI?</p>
  </a>

</nav>

<!-- Navbar on small screens (Hidden on medium and large screens) -->
<div class="w3-top w3-hide-large w3-hide-medium" id="myNavbar">
  <div class="w3-bar w3-black w3-opacity w3-hover-opacity-off w3-center w3-small">
    <a href="editorana.jsp" class="w3-bar-item w3-button" style="width:25% !important">ANASAYFA</a>
    <a href="ed?torhesap.jsp" class="w3-bar-item w3-button" style="width:25% !important">PROF?L</a>
    <a href="uzmanlar.jsp" class="w3-bar-item w3-button" style="width:25% !important">UZMANLAR</a>
    <a href="makaleislem.jsp" class="w3-bar-item w3-button" style="width:25% !important">MAKALELER</a>
    <a href="kategori.jsp" class="w3-bar-item w3-button" style="width:25% !important">KATEGOR?</a>
    <a href="yazarlar.jsp" class="w3-bar-item w3-button" style="width:25% !important">YAZARLAR</a>
    <a href="editorgiris.jsp" class="w3-bar-item w3-button" style="width:25% !important">?IKI?</a>
  </div>
</div>




<div class="w3-row-padding" style="margin:0 -16px">
    <form class="modal-content animate" action="editorhesapview.jsp" method="post">
    
        <li class="w3-dark-grey w3-xlarge w3-padding-32">G?R??</li>
        <ul class="w3-ul w3-white w3-center w3-opacity w3-hover-opacity-off">
           <br>
  <br>
<jsp:useBean id="veri" class="editor.getset" scope="page" ></jsp:useBean>
<jsp:useBean id="data" class="editor.baglanti" scope="page"></jsp:useBean>
  <%
  boolean sonuc=false;

  String kullanici = (String) oturum.getAttribute("oturumismi");
  System.out.println(kullanici);
  veri.setKullanici(kullanici);
  sonuc = data.VeriAld?m(veri);
   if (sonuc=true)
 {
    ResultSet rs = data.selectData(kullanici);
    while(rs.next()){ %>
           <label for="uname"><b>Ad</b></label>
           <br><br>
        <input name="ad" type="text" required= "required" class="validate[required,custom[onlyLetter],length[0,100]] feedback-input" value="<%=rs.getString("ad") %>" id="ad" />
           <br><br>
           <label for="uname"><b>SOYAD</b></label>
           <br><br>
          <input name="soyad" type="text" required= "required" class="validate[required,custom[onlyLetter],length[0,100]] feedback-input" value="<%=rs.getString("soyad") %>" id="soyad" />
           <br><br>
           <label for="uname"><b>MA?L</b></label>
           <br><br>
          <input name="mail" type="text" class="validate[required,custom[]] feedback-input" required= "required" id="mail" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"title="E-mail format?nda giriniz." value="<%=rs.getString("mail") %>" />
           <br><br>
           <label for="uname"><b>KULLANICI ADI</b></label>
           <br><br>
          <input name="kullanici" type="text" required= "required" class="validate[required,custom[onlyLetter],length[0,100]] feedback-input" value="<%=rs.getString("kullanici") %>" id="kullanici"/>
           <br><br>
           <label for="uname"><b>??FRE</b></label>
           <br><br>
         <input name="sifre" type="password" class="validate[required,custom[]] feedback-input" required= "required" id="sifre" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{5,}" title=" ?ifre en az 5 karakter,en az bir b?y?k,en az bir k???k harf" value="<%=rs.getString("sifre") %>" />
           <br><br>
           <li class="w3-light-grey w3-padding-24">
    <br>
             <button type="submit">G?NCELLE</button>
          </li>
        </ul>
        <li class="w3-dark-grey w3-xlarge w3-padding-20"></li>
      <%}
    } %>
      </form>

     
    </div>
  


<!-- END PAGE CONTENT -->
</div>

</body>
</html>