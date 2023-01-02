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
<div class="w3-row-padding" style="margin:0 -16px">
    <form class="modal-content animate" action="uzmanekleview.jsp" method="post">
     <jsp:useBean id="data" class="kategori.baglanti"></jsp:useBean>
    <jsp:useBean id="veri" class="kategori.getset"></jsp:useBean>
        <li class="w3-dark-grey w3-xlarge w3-padding-32"></li>
        <ul class="w3-ul w3-white w3-center w3-opacity w3-hover-opacity-off">
           <br>
           <label for="uname"><b> AD</b></label>
           <br><br>
           <input type="text"  name="ad" required>
           <br><br>
            <label for="uname"><b> SOYAD</b></label>
           <br><br>
           <input type="text"  name="soyad" required>
           <br><br>
           <label for="uname"><b> KULLANICI ADI</b></label>
           <br><br>
           <input type="text"  name="kullanici" required>
           <br><br>
           <label for="uname"><b>ŞİFRE</b></label>
           <br><br>
           <input type="password"  name="sifre" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{5,}" title=" Şifre en az 5 karakter,en az bir büyük,en az bir küçük harf" required>  
           <br><br>
           <label for="uname"><b>MAİL</b></label>
           <br><br>
           <input type="text"  name="mail" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"title="E-mail formatında giriniz." required>
           <br><br>
            <label for="uname"><b> ALAN</b></label>
           <br><br>
              <select  id="tur" name="tur" face="tahoma" style="width: 200px; height: 30px;"">
     <% 
  ResultSet tr=data.selectAllData();
  while(tr.next()) { %>
    <option value="<%=tr.getString("tur") %>" ><%=tr.getString("tur") %></option>
    
     <%} %>
  </select>
           <br><br>
           <li class="w3-light-grey w3-padding-24">
    <br>
             <button type="submit">KAYIT OL</button>
          </li>
        </ul>
            <li class="w3-dark-grey w3-xlarge w3-padding-20"></li>
      </form>

     
    </div>

</body>
</html>