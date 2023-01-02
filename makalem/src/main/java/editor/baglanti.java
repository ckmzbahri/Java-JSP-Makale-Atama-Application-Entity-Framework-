package editor;
import java.beans.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.beans.Statement;
import java.sql.CallableStatement;
import editor.getset;
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
		
		public baglanti() {
			   try {
					Class.forName(driver);
					 System.out.println("JDBC surucu basari ile y�klendi.");
				} catch (ClassNotFoundException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}	  
				try{
					con=DriverManager.getConnection(url,"root","bahri123@1");System.out.println("Veritaban�na ba�lan�ld�.");
					}
				catch (Exception e) { 
					System.out.println("Veri Taban�na Ba�lan�lamad�. Hata:"+e.getMessage()); System.exit(0);
					}
				try {
					stm=con.createStatement();
					
					}
				catch (Exception e) { System.out.println("sfdfsdfsdf");
						System.out.println("Hata:"+e.getMessage()); System.exit(0); 	
					}
		}
		public boolean VeriAld�m(getset veri)
		{
			kullanici = veri.getKullanici();
			return true;
		}
		
		public ResultSet selectData(String kullanici)
		{
			try
		{
				CallableStatement stm=(CallableStatement) con.prepareCall("{call eselectData(?)}");		 
				stm.setString(1, kullanici);
				boolean hasResult =stm.execute();
				if(hasResult)
				{
					ResultSet rs=stm.getResultSet();
					System.out.println("Ba�ar�l�");
					return rs;
				}
	    }
		catch (Exception e) 
			{ 
			System.out.println("Hata:"+e.getMessage());
			
		    }		
			return resultSet;}
		
		
		
		
		
		public boolean updateData(getset veri)
		{   
			kullanici = veri.getKullanici();
			ad = veri.getAd();
			soyad=veri.getSoyad();
			mail=veri.getMail();
			sifre=veri.getSifre();
			try
			{
				CallableStatement statement=(CallableStatement) con.prepareCall("{call editorguncelle(?,?,?,?,?)}"); 
				statement.setString(1,ad); 
				statement.setString(2,soyad); 
				statement.setString(3,kullanici); 
				statement.setString(4,sifre); 
				statement.setString(5,mail);

				int result=statement.executeUpdate(); if(result>0) { System.out.println("Durum G�ncellendi"); return true; } else { 
				return false; } 

			}
			catch (Exception e) { System.out.println("Hata:"+e.getMessage()); return false;}
			
		}
		
		public ResultSet editorkasf()
		{		
			try
			{
				        CallableStatement stm=(CallableStatement) con.prepareCall("{call editorkasf()}");
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
