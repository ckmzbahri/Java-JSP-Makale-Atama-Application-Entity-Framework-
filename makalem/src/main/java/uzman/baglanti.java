package uzman;
import java.beans.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.beans.Statement;
import java.sql.CallableStatement;
import uzman.getset;
public class baglanti {
	private String driver="com.mysql.jdbc.Driver";
	private String url="jdbc:mysql://localhost:3306/makale?useUnicode=true&characterEncoding=UTF-8";
    private java.sql.Statement stm;
	private Connection con ;
	private  ResultSet resultSet = null;
		String kullanici;
		String sifre;
		String ad;
		String soyad;
		String mail;
		String tur;
		int puan;
		int id;
		int idm;
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
				catch (Exception e) { 
						System.out.println("Hata:"+e.getMessage()); System.exit(0); 	
					}
		}
		public boolean sifresifirla(getset veri)
		{  
			kullanici = veri.getKullanici();
			
			sifre=veri.getSifre();
			 try
				{
					CallableStatement statement=(CallableStatement) con.prepareCall("{call sifrele(?,?)}"); 
					
					statement.setString(1,kullanici);
					statement.setString(2,sifre);				
					int result=statement.executeUpdate(); if(result>0) { System.out.println("Durum Güncellendi"); return true; } else { 
					return false; } 

				}
				catch (Exception e) { System.out.println("Hata:"+e.getMessage()); return false;}
			
		}

		
		public boolean IdAldým(getset veri)
		{
			id=veri.getId();
			return true;
		}
		
		
		public boolean insertData(getset veri)
		{
			ad = veri.getAd();
			soyad=veri.getSoyad();
			kullanici=veri.getKullanici();
			mail=veri.getMail();
			sifre=veri.getSifre();
			tur=veri.getTur();
			puan=veri.getPuan();
	        System.out.println(puan);
            boolean sonuc=true;
			
			
			if(sonuc==true) {
				
			try { CallableStatement cs; cs=(CallableStatement) con.prepareCall("{call hekle(?,?,?,?,?,?,?)}"); 
	          
	           cs.setString(1,ad); 
	           cs.setString(2,soyad); 
	           cs.setString(3,kullanici); 
	           cs.setString(4,mail); 
	           cs.setString(5,sifre);
	           cs.setString(6,tur);
	           cs.setInt(7,puan);
 
	           cs.execute(); System.out.println("Baþarýlý"); return true; 
	           } 
	           catch (Exception e) { System.out.println("Hata:"+e.getMessage()); 
	           } return false; 
			
		}
			return sonuc;
		
			}
		
		public ResultSet uzman()
		{	
			try
			{
				CallableStatement stm=(CallableStatement) con.prepareCall("{call ukontrol()}");
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
		
		public ResultSet selectAllData()
		{	
			try
			{
				CallableStatement stm=(CallableStatement) con.prepareCall("{call uselecttAllData()}");
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
		public boolean VeriAldým(getset veri)
		{
			kullanici = veri.getKullanici();
			return true;
		}
		public boolean VeriAldim(getset veri)
		{
			kullanici = veri.getKullanici();
			return true;
		}
		public ResultSet selectData()
		{
			try
			{CallableStatement stm=(CallableStatement) con.prepareCall("{call uselectdata(?)}");
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
		
			tur=veri.getTur();
			puan=veri.getPuan();
			 try
				{
					CallableStatement statement=(CallableStatement) con.prepareCall("{call uupdate(?,?,?,?,?,?)}"); 
					statement.setInt(1,id); 
					statement.setString(2,ad);
					statement.setString(3,soyad);				
					statement.setString(4,mail);
					statement.setString(5,kullanici);
			
					statement.setString(6,tur);
					int result=statement.executeUpdate(); if(result>0) { System.out.println("Durum Güncellendi"); return true; } else { 
					return false; } 

				}
				catch (Exception e) { System.out.println("Hata:"+e.getMessage()); return false;}
			
		}
		
		public boolean uupdateData(getset veri)
		{   id=veri.getId();
			kullanici = veri.getKullanici();
			ad = veri.getAd();
			soyad=veri.getSoyad();
			mail=veri.getMail();
		    sifre=veri.getSifre();
			tur=veri.getTur();
			puan=veri.getPuan();
			 try
				{
					CallableStatement statement=(CallableStatement) con.prepareCall("{call updatee(?,?,?,?,?,?,?)}"); 
					statement.setInt(1,id); 
					statement.setString(2,ad);
					statement.setString(3,soyad);				
					statement.setString(4,mail);
					statement.setString(5,kullanici);
					statement.setString(6,sifre);
					statement.setString(7,tur);
					int result=statement.executeUpdate(); if(result>0) { System.out.println("Durum Güncellendi"); return true; } else { 
					return false; } 

				}
				catch (Exception e) { System.out.println("Hata:"+e.getMessage()); return false;}
			
		}
		
		public boolean deleteData(int id)
		{ 
			try
			{

				CallableStatement stm=(CallableStatement) con.prepareCall("{call udelete(?)}");		 
				stm.setInt(1, id);
				boolean hasResult =stm.execute();
				if(hasResult)
				{
					ResultSet rs=stm.getResultSet();
					System.out.println("Baþarýlý");
					
				}
				return true;
				
			}
			catch (Exception e) { System.out.println("Hata:"+e.getMessage()); return false;}
		
			}
		
		public ResultSet bak()
		{		
			try
			{
				        CallableStatement stm=(CallableStatement) con.prepareCall("{call hkontrol()}");
						boolean hasResult =stm.execute();
						if(hasResult){
						ResultSet rs=stm.getResultSet();
						System.out.println("Baþarýlý");
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
		public boolean idaldim(getset veri)
		{
			idm = veri.getId();
			return true;
		}
		
		

		
		public ResultSet select(getset veri)
		{
			try
			{CallableStatement stm=(CallableStatement) con.prepareCall("{call hselectdata(?)}");
			stm.setInt(1, idm);
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
		public boolean durumguncelle(getset veri)
		{   idm=veri.getId();
		    puan=veri.getPuan();
		    System.out.println(puan);
		    puan=puan+1;
		    System.out.println(puan);
		    try
   			{
   				CallableStatement statement=(CallableStatement) con.prepareCall("{call hupdate(?,?)}"); 
   				statement.setInt(1,idm); 
   				statement.setInt(2,puan); 

   				int result=statement.executeUpdate(); if(result>0) { System.out.println("Durum Güncellendi"); return true; } else { 
   				return false; } 

   			}
   			catch (Exception e) { System.out.println("Hata:"+e.getMessage()); return false;}
			
		}
		public boolean puanaz(getset veri)
		{   idm=veri.getId();
		System.out.println("hoca idsi"+idm);
		    puan=veri.getPuan();
		    System.out.println("bu kadar"+puan);
		    puan=puan-1;
		    System.out.println("bu kadar"+puan);
		    try
   			{
   				CallableStatement statement=(CallableStatement) con.prepareCall("{call hupdate(?,?)}"); 
   				statement.setInt(1,idm); 
   				statement.setInt(2,puan); 

   				int result=statement.executeUpdate(); if(result>0) { System.out.println("Durum Güncellendi"); return true; } else { 
   				return false; } 

   			}
   			catch (Exception e) { System.out.println("Hata:"+e.getMessage()); return false;}
			
		}
}
