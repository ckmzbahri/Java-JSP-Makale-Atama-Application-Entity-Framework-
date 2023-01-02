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

<div class="w3-row-padding" style="margin:0 -16px">
<meta charset="utf-9">
    <form class="modal-content animate" action="raporyazview.jsp" method="post">
    <jsp:useBean id="data" class="kategori.baglanti"></jsp:useBean>
    <jsp:useBean id="veri" class="kategori.getset"></jsp:useBean>
        <jsp:useBean id="islem" class="makale.baglanti"></jsp:useBean>
        <jsp:useBean id="verim" class="makale.getset"></jsp:useBean>
        <li class="w3-dark-grey w3-xlarge w3-padding-20"></li>
        <ul class="w3-ul w3-white w3-center w3-opacity w3-hover-opacity-off">
           <br>
            <%
boolean sonuc=false;
int id=Integer.parseInt(request.getParameter("id"));
verim.setId(id);
islem.idaldim(verim);
 if (sonuc=true)
 {
    ResultSet mkl = islem.select(verim);
    while(mkl.next()){ %>
           <br><br>
           <label for="uname"><b>RAPOR</b></label>
           <br>
           <textarea id="rapor" name="rapor" rows="4" cols="50" style="width: 700px; height: 700px;" required="required"></textarea>
           <br><br>
           <li class="w3-light-grey w3-padding-24">
 <input type="text" name="id" id="id" value="<%=mkl.getString("id") %>" style="display:none;">
  <input type="text" name="durum" id="durum" value="<%=mkl.getString("durum") %>" style="display:none;">
           <br>
           <button type="submit">YAYINLA</button>
          </li>
        </ul>
            <li class="w3-dark-grey w3-xlarge w3-padding-20"></li>
      </form>
  <%}}%>
    </div>
  


<!-- END PAGE CONTENT -->
</div>

</body>
</html>