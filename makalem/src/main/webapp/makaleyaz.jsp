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
  <a href="yazarana.jsp" class="w3-bar-item w3-button w3-padding-large w3-black">
    <i class="fa fa-home w3-xxlarge"></i>
    <p>ANASAYFA</p>
  </a>
  <a href="yazarhesap.jsp" class="w3-bar-item w3-button w3-padding-large w3-hover-black">
    <i class="fa fa-user w3-xxlarge"></i>
    <p>PROF�L�M</p>
  </a>
  <a href="makaleyaz.jsp" class="w3-bar-item w3-button w3-padding-large w3-hover-black">
    <i class="fa fa-user w3-xxlarge"></i>
    <p>MAKALE YAYINLA</p>
  </a>
  <a href="makaleler.jsp" class="w3-bar-item w3-button w3-padding-large w3-hover-black">
    <i class="fa fa-user w3-xxlarge"></i>
    <p>MAKALELER�M</p>
  </a>
   <a href="yazarkayit.jsp" class="w3-bar-item w3-button w3-padding-large w3-hover-black">
    <i class="fa fa-eye w3-xxlarge"></i>
    <p>�IKI�</p>
  </a>

</nav>

<!-- Navbar on small screens (Hidden on medium and large screens) -->
<div class="w3-top w3-hide-large w3-hide-medium" id="myNavbar">
  <div class="w3-bar w3-black w3-opacity w3-hover-opacity-off w3-center w3-small">
    <a href="yazarana.jsp" class="w3-bar-item w3-button" style="width:25% !important">ANASAYFA</a>
    <a href="yazarhesap.jsp" class="w3-bar-item w3-button" style="width:25% !important">PROF�L�M</a>
    <a href="makaleyaz.jsp" class="w3-bar-item w3-button" style="width:25% !important">MAKALE YAYINLA</a>
    <a href="makaleler.jsp" class="w3-bar-item w3-button" style="width:25% !important">MAKALELER�M</a>
  <a href="yazarkayit.jsp" class="w3-bar-item w3-button" style="width:25% !important">�IKI�</a>
  </div>
</div>

<div class="w3-row-padding" style="margin:0 -16px">
<meta charset="utf-9">
    <form class="modal-content animate" action="makaleyazview.jsp" method="post">
    <jsp:useBean id="data" class="kategori.baglanti"></jsp:useBean>
    <jsp:useBean id="veri" class="kategori.getset"></jsp:useBean>
        <li class="w3-dark-grey w3-xlarge w3-padding-20"></li>
        <ul class="w3-ul w3-white w3-center w3-opacity w3-hover-opacity-off">
           <br>
           <label for="uname"><b>BA�LIK</b></label>
           <br>
           <input type="text"  name="baslik" required>
           <br><br>
           <label for="uname"><b>ALAN</b></label>
           <br>
     <select  id="tur" name="tur" face="tahoma" style="width: 382px; height: 30px;"">
     <% 
  ResultSet tr=data.selectAllData();
  while(tr.next()) { %>
    <option value="<%=tr.getString("tur") %>" ><%=tr.getString("tur") %></option>
    
     <%} %>
  </select>
           <br><br>
           <label for="uname"><b>��ER�K</b></label>
           <br>
           <textarea id="icerik" name="icerik" rows="4" cols="50" style="width: 700px; height: 700px;" required="required"> </textarea>
           <br><br>
           <li class="w3-light-grey w3-padding-24">

           <br>
           <button type="submit">YAYINLA</button>
          </li>
        </ul>
            <li class="w3-dark-grey w3-xlarge w3-padding-20"></li>
      </form>

    </div>
  


<!-- END PAGE CONTENT -->
</div>

</body>
</html>