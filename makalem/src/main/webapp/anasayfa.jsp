<%@ page language="java" contentType="text/html; charset=ISO-8859-9"
    pageEncoding="ISO-8859-9"%>
    <%  HttpSession oturum= request.getSession();
       oturum.setAttribute("oturumismi", null);

%>




<!DOCTYPE html>
<html>
<head>
<link href="css/Form.css" rel="stylesheet" type="text/css">
</head>
<body>
<%if(request.getParameter("sonuc")!=null && request.getParameter("sonuc").equals("1")) { %>
<script>
  alert("ISLEM BASARIYLA GERCEKLESTIRILDI...");
</script>
<%}else if(request.getParameter("sonuc")!=null && request.getParameter("sonuc").equals("0")) { %>
<script>
  alert("SIFRE YENILEME BAGLANTISI GONDERILEMEDI LUTFEN BILGILERINIZI KONTROL EDIN!!");
</script>
<%} %>

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
  <a href="anasayfa.jsp" class="w3-bar-item w3-button w3-padding-large w3-black">
    <i class="fa fa-home w3-xxlarge"></i>
    <p>ANASAYFA</p>
  </a>
  <a href="editorgiris.jsp" class="w3-bar-item w3-button w3-padding-large w3-hover-black">
    <i class="fa fa-user w3-xxlarge"></i>
    <p>ED�T�R</p>
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
    <a href="ed�torgiris.jsp" class="w3-bar-item w3-button" style="width:25% !important">ED�T�R G�R��</a>
    <a href="uzmangiris.jsp" class="w3-bar-item w3-button" style="width:25% !important">UZMAN G�R��</a>
    <a href="yazargiris.jsp" class="w3-bar-item w3-button" style="width:25% !important">YAZAR G�R��</a>
  </div>
</div>


  


<!-- END PAGE CONTENT -->


  <!-- Header/Home -->
  <header class="w3-container w3-padding-32 w3-center w3-black" id="home">
    <h1 class="w3-jumbo"><span class="w3-hide-small">Prof. Dr.</span> �LBER ORTAYLI</h1>
    <p>TAR�H��</p>
    <img src="https://www.emu.edu.tr/media/posts_media/media_2536_en_1200.jpg?1584889185" alt="boy" class="w3-image" width="992" height="1108">
  </header>

  <!-- About Section -->
  <div class="w3-content w3-justify w3-text-grey w3-padding-64" id="about">
    <h2 class="w3-text-light-grey">K�MD�R?</h2>
    <hr style="width:200px" class="w3-opacity">
    <p>1970 y�l�nda Ankara �niversitesi Dil ve Tarih-Co�rafya Fak�ltesi Tarih B�l�m�n� bitirdi. Burada �erif Mardin, Halil �nalc�k, M�mtaz Soysal, Seha Meray, �lhan Tekeli, M�beccel K�ray'�n ��rencisi oldu. Ayr�ca s�n�f arkada�lar� aras�nda Zafer Toprak, Mehmet Ali K�l��bay, �mit Arslan da vard�.

Viyana �niversitesi'nde Slav ve Do�u Avrupa dilleri hakk�nda ��renim g�rd�. Y�ksek lisans �al��mas�n� Chicago �niversitesinde Halil �nalc�k ile yapt�. "Tanzimat sonras� mahall� idareler" ba�l�kl� tezi ile Ankara �niversitesi Siyasal Bilgiler Fak�ltesinde 1974 y�l�nda doktor, "Osmanl� �mparatorlu�u'nda Alman n�fuzu" adl� 
�al��mas�yla 1979'da ayn� Fak�ltede do�ent oldu.

1982 y�l�nda �niversitelere uygulanan siyasi yapt�r�mlara tepki olarak g�revinden istifa etti. Bu d�nemde Viyana, Berlin, Paris, Princeton, Moskova, Roma, M�nih, Strasbourg, Yanya, Sofya, Kiel, Cambridge, Oxford ve Tunus'ta ders, seminer ve konferanslar verdi.

1989'da T�rkiye'ye d�nerek profes�r oldu ve 1989-2002 y�llar� aras�nda Ankara �niversitesi Siyasal Bilgiler Fak�ltesinin idare tarihi anabilim dal�n�n ba�kanl���n� yapt�.

2002 y�l�nda Galatasaray �niversitesine, iki y�l sonra ise Bilkent �niversitesine konuk ��retim �yesi olarak ge�ti. �u anda Galatasaray �niversitesi Hukuk Fak�ltesi ve MEF �niversitesi Hukuk Fak�ltesinde T�rk Hukuk Tarihi derslerini vermektedir. Galatasaray �niversitesi senatosu �yesidir.

2005 y�l�nda Topkap� Saray� M�zesi M�d�r� oldu. Yedi y�l bu g�revde kalan Ortayl�, 2012 y�l�nda ya� haddinden emekli oldu ve g�revi Ayasofya M�zesi M�d�r� Haluk Dursun'a devretti.

Ortayl�, Uluslararas� Osmanl� Et�tleri Komitesi y�netim kurulu �yesi ve Avrupa �ranoloji Cemiyeti ve Avusturya-T�rk Bilimler Forumu �yesidir. 2018 y�l�nda K�lt�r ve Turizm Bakanl��� bakanl�k dan��man� oldu.

Tarih Vakf� ve Afet �nan ailesinin i� birli�iyle iki y�lda bir verilen Afet �nan Tarih Ara�t�rmalar� �d�l�'n�n 2004 y�l�ndaki sahipleri �lber Ortayl�'n�n da i�inde bulundu�u j�ri taraf�ndan belirlenmi�tir. 2009 y�l�nda �zmir Kitap Fuar�'na kat�lm��t�r. Mill� Saraylar Daire Ba�kanl���n�n Dolmabah�e Saray�'nda d�zenledi�i 
"Vefat�n�n 150'nci y�l�nda I. Abd�lmecit ve d�nemi" ba�l�kl� uluslararas� sempozyumun a��l�� ve kapan�� oturumlar�na kat�lm��t�r. Ortayl�, ileri seviyede Almanca, Rus�a, �ngilizce, Frans�zca, �talyanca ve Fars�a ve iyi seviyede Latince bilmektedir. Kat�ld��� bir televizyon program�nda bilgisayar kullanmad���n�, 
ba�kalar�n�n yanl�� bilgilerle biyografisini yazd���n� ve bundan b�y�k rahats�zl�k duydu�unu dile getiren[13] Ortayl�, orta seviyede S�rp�a, H�rvat�a, Bo�nak�a bildi�i iddialar�n� yalanlam��t�r.
    </p>
   

    

    
   

  </div>
  



  

<!-- END PAGE CONTENT -->


</body>
</html>