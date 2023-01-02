package yazar;
import java.beans.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.beans.Statement;
import java.sql.CallableStatement;
import yazar.getset;
public class baglanti {
	private String driver="com.mysql.jdbc.Driver";
	private String url="jdbc:mysql://localhost:3306/makale?useUnicode=true&characterEncoding=UTF-8";
    private java.sql.Statement stm;
	private Connection con ;
	private  ResultSet resultSet = null;
	 int id;
		String kullanici;
		String sifre;
		String ad;
		String soyad;
		String mail;
		
		public baglanti() {
			   try {
					Class.forName(driver);
					 System.out.println("JDBC surucu basari ile yüklendi.");
				} catch (ClassNotFoundException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}	  
				try{
					con=DriverManager.getConnection(url,"root","bahri123@1");System.out.println("Veritabanýna baðlanýldý.");
					}
				catch (Exception e) { 
					System.out.println("Veri Tabanýna Baðlanýlamadý. Hata:"+e.getMessage()); System.exit(0);
					}
				try {
					stm=con.createStatement();
					
					}
				catch (Exception e) { System.out.println("sfdfsdfsdf");
						System.out.println("Hata:"+e.getMessage()); System.exit(0); 	
					}
		}
		public boolean sifresifirla(getset veri)
		{  
			kullanici = veri.getKullanici();
			
			sifre=veri.getSifre();
			 try
				{
					CallableStatement statement=(CallableStatement) con.prepareCall("{call sifreleme(?,?)}"); 
					
					statement.setString(1,kullanici);
					statement.setString(2,sifre);				
					int result=statement.executeUpdate(); if(result>0) { System.out.println("Durum Güncellendi"); return true; } else { 
					return false; } 

				}
				catch (Exception e) { System.out.println("Hata:"+e.getMessage()); return false;}
			
		}
		public ResultSet selectAllData()
		{	
			try
			{
				CallableStatement stm=(CallableStatement) con.prepareCall("{call yselecttAllData()}");
		        boolean hasResult =stm.execute();
		        if(hasResult){
		        ResultSet rs=stm.getResultSet();
		        System.out.println("Baþarýlý");
		        return rs;
		        }

		        else 
		           return null;
			}
			catch (Exception e) { System.out.println("Hata:"+e.getMessage());
				
			}
			return resultSet;}
		public ResultSet yazar()
		{	
			try
			{
				CallableStatement stm=(CallableStatement) con.prepareCall("{call ykontrol()}");
		        boolean hasResult =stm.execute();
		        if(hasResult){
		        ResultSet rs=stm.getResultSet();
		        System.out.println("Baþarýlý");
		        return rs;
		        }

		        else 
		           return null;
			}
			catch (Exception e) { System.out.println("Hata:"+e.getMessage());
				
			}
			return resultSet;}
		public boolean IdAldým(getset veri)
		{
			id=veri.getId();
			return true;
		}
		public boolean VeriAldým(getset veri)
		{
			kullanici = veri.getKullanici();
			return true;
		}
		public ResultSet selectData()
		{
			try
			{CallableStatement stm=(CallableStatement) con.prepareCall("{call yselectdata(?)}");
			stm.setString(1, kullanici);
	        boolean hasResult =stm.execute();
	        if(hasResult){
	        ResultSet rs=stm.getResultSet();
	        System.out.println("Baþarýlý...");
	        return rs;
			}}
			catch (Exception e) { System.out.println("Hata:"+e.getMessage());
				
			}
			return resultSet;
		}
		public boolean updateData(getset veri)
		{   id=veri.getId();
			kullanici = veri.getKullanici();
			ad = veri.getAd();
			soyad=veri.getSoyad();
			mail=veri.getMail();
		
			try
			{
				CallableStatement statement=(CallableStatement) con.prepareCall("{call yazarguncelle(?,?,?,?,?)}"); 
				statement.setInt(1,id); 
				statement.setString(2,ad); 
				statement.setString(3,soyad); 
				statement.setString(4,kullanici); 
			
				statement.setString(5,mail);

				int result=statement.executeUpdate(); if(result>0) { System.out.println("Durum Güncellendi"); return true; } else { 
				return false; } 

			}
			catch (Exception e) { System.out.println("Hata:"+e.getMessage()); return false;}
			
		}
		public boolean insertData(getset veri)
		{
			ad = veri.getAd();
			soyad=veri.getSoyad();
			kullanici=veri.getKullanici();
			mail=veri.getMail();
			sifre=veri.getSifre();
            boolean sonuc=true;

			
			
			
			if(sonuc==true) {
			
			try { CallableStatement cs; cs=(CallableStatement) con.prepareCall("{call yekle(?,?,?,?,?)}"); 
	          
	           cs.setString(1,ad); 
	           cs.setString(2,soyad); 
	           cs.setString(3,kullanici); 
	           cs.setString(4,mail); 
	           cs.setString(5,sifre); 
 
	           cs.execute(); System.out.println("Baþarýlý"); return true; 
	           } 
	           catch (Exception e) { System.out.println("Hata:"+e.getMessage()); 
	           } return false; 
			
		}
			return sonuc;
			
			
		}
		
		public ResultSet Kontrol()
		{		
			try
			{
				        CallableStatement stm=(CallableStatement) con.prepareCall("{call yykontrol()}");
						boolean hasResult =stm.execute();
						if(hasResult){
						ResultSet rs=stm.getResultSet();
						System.out.println(" listelendi..");
						return rs;
						}

						else 
						   return null;

						}
			
			catch (Exception e) 
			{ 
				System.out.println("Hata:"+e.getMessage());
				
			}
			return resultSet;

			
		}
}


