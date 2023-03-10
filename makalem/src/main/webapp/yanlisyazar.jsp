<%@ page language="java" contentType="text/html; charset=ISO-8859-9"
    pageEncoding="ISO-8859-9"%>
    <%  HttpSession oturum= request.getSession();
       oturum.setAttribute("oturumismi", null);

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
<title>Bootstrap Example</title>
<body class="w3-black">

<!-- Icon Bar (Sidebar - hidden on small screens) -->
<nav class="w3-sidebar w3-bar-block w3-small w3-hide-small w3-center">
  <!-- Avatar image in top left corner -->
  <img src="https://pbs.twimg.com/media/Ez_s0dwXMAAdItq.jpg" style="width:100%">
  <a href="anasayfa.jsp" class="w3-bar-item w3-button w3-padding-large w3-black">
    <i class="fa fa-home w3-xxlarge"></i>
    <p>ANASAYFA</p>
  </a>
  <a href="editorgiris.jsp" class="w3-bar-item w3-button w3-padding-large w3-hover-black">
    <i class="fa fa-user w3-xxlarge"></i>
    <p>ED?T?R</p>
  </a>
  <a href="uzmangiris.jsp" class="w3-bar-item w3-button w3-padding-large w3-hover-black">
    <i class="fa fa-eye w3-xxlarge"></i>
    <p>UZMAN</p>
  </a>
   <a href="yazarkayit.jsp" class="w3-bar-item w3-button w3-padding-large w3-hover-black">
    <i class="fa fa-eye w3-xxlarge"></i>
    <p>YAZAR</p>
  </a>

</nav>

<!-- Navbar on small screens (Hidden on medium and large screens) -->
<div class="w3-top w3-hide-large w3-hide-medium" id="myNavbar">
  <div class="w3-bar w3-black w3-opacity w3-hover-opacity-off w3-center w3-small">
    <a href="anasayfa.jsp" class="w3-bar-item w3-button" style="width:25% !important">ANASAYFA</a>
    <a href="ed?torgiris.jsp" class="w3-bar-item w3-button" style="width:25% !important">ED?T?R G?R??</a>
    <a href="uzmangiris.jsp" class="w3-bar-item w3-button" style="width:25% !important">UZMAN G?R??</a>
    <a href="yazargiris.jsp" class="w3-bar-item w3-button" style="width:25% !important">YAZAR G?R??</a>
  </div>
</div>




 <div class="w3-row-padding" style="margin:0 -16px">
    <form class="modal-content animate" action="yazargirisview.jsp" method="post">
      <div class="w3-half w3-margin-bottom">
        <li class="w3-dark-grey w3-xlarge w3-padding-32">G?R??</li>
        <ul class="w3-ul w3-white w3-center w3-opacity w3-hover-opacity-off">
           <br>
           <label for="uname"><b>Kullan?c? Ad?</b></label>
           <br><br>
           <input type="text" placeholder="Kullan?c? Ad?" name="kullanici" required>
           <br><br><br>
           <label for="uname"><b>??FRE</b></label>
           <br><br>
           <input type="password" placeholder="?ifre" name="sifre" required>  
           <br><br>
           <li class="w3-light-grey w3-padding-24">
              <div class="container" style="background-color:#f1f1f1">
              <br>
      <span class="psw">?ifremi <a href="#">Unuttum?</a></span>
      <br>
    </div>
    <br>
             <button type="submit">G?R??</button>
          </li>
        </ul>
         <li class="w3-dark-grey w3-xlarge w3-padding-20"></li>
      </div>
      </form>

<form class="modal-content animate" action="yazarkayitview.jsp" method="post">
      <div class="w3-half w3-margin-bottom">
        <li class="w3-dark-grey w3-xlarge w3-padding-32">KAYIT OL</li>
        <ul class="w3-ul w3-white w3-center w3-opacity w3-hover-opacity-off">
           <br>
           <label for="uname"><b>Ad</b></label>
           <br><br>
           <input type="text" placeholder="Ad" name="ad" required>
           <br><br>
           <label for="uname"><b>SOYAD</b></label>
           <br><br>
           <input type="text" placeholder="Soyad" name="soyad" required>
           <br><br>
           <label for="uname"><b>MA?L</b></label>
           <br><br>
           <input type="text" placeholder="Mail" name="mail" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"title="E-mail format?nda giriniz." required>
           <br><br>
           <label for="uname"><b>KULLANICI ADI</b></label>
           <br><br>
           <input type="text" placeholder="Kullan?c? Ad?" name="kullanici" required>  
           <br><br>
           <label for="uname"><b>??FRE</b></label>
           <br><br>
           <input type="password" placeholder="?ifre" name="sifre" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{5,}" title=" ?ifre en az 5 karakter,en az bir b?y?k,en az bir k???k harf" required>  
           <br><br>
           <li class="w3-light-grey w3-padding-24">
             
             <button type="submit">G?R??</button>
          </li>
        </ul>
                <li class="w3-dark-grey w3-xlarge w3-padding-20"></li>
      </div>
      </form>
    <!-- End Grid/Pricing tables -->
    </div>
    
    
  
 


<!-- END PAGE CONTENT -->
</div>
<script>
  alert("KULLANICI ADI VEYA ??FRE HATALI!");
</script>
</body>
</html>