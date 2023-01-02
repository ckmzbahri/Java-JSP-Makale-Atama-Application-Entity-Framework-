
    <%@page import="java.sql.ResultSet"%>
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import = "java.io.*,java.util.*" %>
<%@ page import = "javax.servlet.*,java.text.*" %>
<%@ page import = "java.io.*,java.util.*,javax.mail.*"%>
<%@ page import = "javax.mail.internet.*,javax.activation.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>
<jsp:useBean id="islem" class="makale.baglanti" scope="page"></jsp:useBean>
<jsp:useBean id="veri" class="makale.getset" scope="page"></jsp:useBean>
<jsp:useBean id="isle" class="uzman.baglanti" scope="page"></jsp:useBean>
<jsp:useBean id="ver" class="uzman.getset" scope="page"></jsp:useBean>
  <%
  String to;
    int puan;
    int i;
      int id=Integer.parseInt(request.getParameter("id"));
      String tur=request.getParameter("tur");
     
      veri.setId(id);
      veri.setTur(tur);
    	boolean sonuc = islem.uzmanbelirle(veri);
    	if (sonuc == true) {
    		ResultSet mkl1 = islem.atamaislemi();
    		
    		while (mkl1.next()) {
    			if(mkl1!=null)
        		{
    	System.out.println(mkl1.getString("mail"));
   
    	to = mkl1.getString("mail");
        puan=mkl1.getInt("puan");
     
        i=mkl1.getInt("id");
  	String result;

  	// alici mail adresi

  	// gonderici mail adresi
  	String from = "ckmzbahri535@gmail.com";
  	//gonderici sifre
  	String password = "Bahri123@1";

  	// ozellik nesnesi olusturuluyor
  	Properties properties = System.getProperties();

  	// mail server ayarlari yapiliyor
  	properties.put("mail.smtp.host", "smtp.gmail.com");
  	properties.put("mail.smtp.port", "587");
  	properties.put("mail.smtp.starttls.enable", "true");
  	properties.put("mail.smtp.auth", "true");

  	//SSL sertifikasi kullanilmak istenirse bu ayarlar eklenir
  	properties.put("mail.smtp.socketFactory.port", "465");
  	properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
  	properties.put("mail.smtp.auth", "true");
  	properties.put("mail.smtp.port", "465");

  	// Mail icin session nesnesi olusturulur.
  	Session mailSession = Session.getInstance(properties, new javax.mail.Authenticator() {
  		protected PasswordAuthentication getPasswordAuthentication() {
  	return new PasswordAuthentication(from, password);
  		}
  	});

  	try {
  		// olusturulan sessiondan mimemesage nesnesi olusturulur
  		MimeMessage message = new MimeMessage(mailSession);

  		// gonderici adresi set ediliyor
  		message.setFrom(new InternetAddress(from));

  		// alici adresi set ediliyor
  		message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
  		// mail basligi set ediliyor
  		message.setSubject("ONAY BEKLEYEN MAKALENIZ VAR");

  		// mail icerigi set ediliyor
  		message.setText(
  		"SAYIN YETKILI, ONAY BEKLEYEN ATANMIS MAKALENIZ MEVCUT. 5 GUN ICINDE KABUL ISLEMINI YAPMAZSANIZ ATAMA IPTAL OLACAKTIR. EN KISA SUREDE SISTEME GIRIS YAPMANIZ RICA OLUNUR: http://localhost:8085/makalem/uzmangiris.jsp");

  		// mail gonderiliyor
  		Transport.send(message);
  		//mail gonderilir ise sonuc 1

  		veri.setInceleyen(to);
  		ver.setPuan(puan);
  		ver.setId(i);
  		boolean guncell = isle.durumguncelle(ver);
  		boolean guncelle = islem.durumguncelle(veri);
  %>
      <div align="center">
      <img src="https://www.tekniktrend.com/wp-content/uploads/2019/05/tick-sembol.png"  height="400" width="400" >  
    </div>
    
    <% 
    response.sendRedirect("http://localhost:8085/makalem/makaleislem.jsp");
 } catch (MessagingException mex) {
    mex.printStackTrace();
  //mail gonderilemez ise sonuc 0
    response.sendRedirect("http://localhost:8085/makalem/uzmanyok.jsp");
 }
    		}
    			if(mkl1==null)
        			response.sendRedirect("uzmanyok.jsp");	
    
	  }
    		
 
  }
    		
  %>
  </body>
</html>