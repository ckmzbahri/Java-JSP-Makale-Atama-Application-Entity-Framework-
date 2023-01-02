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
    <p>EDİTÖR</p>
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
    <a href="edıtorgiris.jsp" class="w3-bar-item w3-button" style="width:25% !important">EDİTÖR GİRİŞ</a>
    <a href="uzmangiris.jsp" class="w3-bar-item w3-button" style="width:25% !important">UZMAN GİRİŞ</a>
    <a href="yazargiris.jsp" class="w3-bar-item w3-button" style="width:25% !important">YAZAR GİRİŞ</a>
  </div>
</div>


  


<!-- END PAGE CONTENT -->


  <!-- Header/Home -->
  <header class="w3-container w3-padding-32 w3-center w3-black" id="home">
    <h1 class="w3-jumbo"><span class="w3-hide-small">Prof. Dr.</span> İLBER ORTAYLI</h1>
    <p>TARİHÇİ</p>
    <img src="https://www.emu.edu.tr/media/posts_media/media_2536_en_1200.jpg?1584889185" alt="boy" class="w3-image" width="992" height="1108">
  </header>

  <!-- About Section -->
  <div class="w3-content w3-justify w3-text-grey w3-padding-64" id="about">
    <h2 class="w3-text-light-grey">KİMDİR?</h2>
    <hr style="width:200px" class="w3-opacity">
    <p>1970 yılında Ankara Üniversitesi Dil ve Tarih-Coğrafya Fakültesi Tarih Bölümünü bitirdi. Burada Şerif Mardin, Halil İnalcık, Mümtaz Soysal, Seha Meray, İlhan Tekeli, Mübeccel Kıray'ın öğrencisi oldu. Ayrıca sınıf arkadaşları arasında Zafer Toprak, Mehmet Ali Kılıçbay, Ümit Arslan da vardı.

Viyana Üniversitesi'nde Slav ve Doğu Avrupa dilleri hakkında öğrenim gördü. Yüksek lisans çalışmasını Chicago Üniversitesinde Halil İnalcık ile yaptı. "Tanzimat sonrası mahallî idareler" başlıklı tezi ile Ankara Üniversitesi Siyasal Bilgiler Fakültesinde 1974 yılında doktor, "Osmanlı İmparatorluğu'nda Alman nüfuzu" adlı 
çalışmasıyla 1979'da aynı Fakültede doçent oldu.

1982 yılında üniversitelere uygulanan siyasi yaptırımlara tepki olarak görevinden istifa etti. Bu dönemde Viyana, Berlin, Paris, Princeton, Moskova, Roma, Münih, Strasbourg, Yanya, Sofya, Kiel, Cambridge, Oxford ve Tunus'ta ders, seminer ve konferanslar verdi.

1989'da Türkiye'ye dönerek profesör oldu ve 1989-2002 yılları arasında Ankara Üniversitesi Siyasal Bilgiler Fakültesinin idare tarihi anabilim dalının başkanlığını yaptı.

2002 yılında Galatasaray Üniversitesine, iki yıl sonra ise Bilkent Üniversitesine konuk öğretim üyesi olarak geçti. Şu anda Galatasaray Üniversitesi Hukuk Fakültesi ve MEF Üniversitesi Hukuk Fakültesinde Türk Hukuk Tarihi derslerini vermektedir. Galatasaray Üniversitesi senatosu üyesidir.

2005 yılında Topkapı Sarayı Müzesi Müdürü oldu. Yedi yıl bu görevde kalan Ortaylı, 2012 yılında yaş haddinden emekli oldu ve görevi Ayasofya Müzesi Müdürü Haluk Dursun'a devretti.

Ortaylı, Uluslararası Osmanlı Etütleri Komitesi yönetim kurulu üyesi ve Avrupa İranoloji Cemiyeti ve Avusturya-Türk Bilimler Forumu üyesidir. 2018 yılında Kültür ve Turizm Bakanlığı bakanlık danışmanı oldu.

Tarih Vakfı ve Afet İnan ailesinin iş birliğiyle iki yılda bir verilen Afet İnan Tarih Araştırmaları Ödülü'nün 2004 yılındaki sahipleri İlber Ortaylı'nın da içinde bulunduğu jüri tarafından belirlenmiştir. 2009 yılında İzmir Kitap Fuarı'na katılmıştır. Millî Saraylar Daire Başkanlığının Dolmabahçe Sarayı'nda düzenlediği 
"Vefatının 150'nci yılında I. Abdülmecit ve dönemi" başlıklı uluslararası sempozyumun açılış ve kapanış oturumlarına katılmıştır. Ortaylı, ileri seviyede Almanca, Rusça, İngilizce, Fransızca, İtalyanca ve Farsça ve iyi seviyede Latince bilmektedir. Katıldığı bir televizyon programında bilgisayar kullanmadığını, 
başkalarının yanlış bilgilerle biyografisini yazdığını ve bundan büyük rahatsızlık duyduğunu dile getiren[13] Ortaylı, orta seviyede Sırpça, Hırvatça, Boşnakça bildiği iddialarını yalanlamıştır.
    </p>
   

    

    
   

  </div>
  



  

<!-- END PAGE CONTENT -->


</body>
</html>