package durum;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.beans.Statement;
import java.sql.CallableStatement;

import durum.getset;

public class baglanti {
	private String driver="com.mysql.jdbc.Driver";
	private String url="jdbc:mysql://localhost:3306/makale?useUnicode=true&characterEncoding=UTF-8";
    private java.sql.Statement stm;
	private Connection con ;
	private  ResultSet resultSet = null;
	    int id;
		String baslik;
		String icerik;
		String foto;
		String konum;
		String tur;
		String aranan;
		String filtre;
		
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
		
		public ResultSet selecttAllData()
		{	
			try
			{
				CallableStatement stm=(CallableStatement) con.prepareCall("{call dselecttAllData()}");
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
			return resultSet;
		}


		public boolean IdAldým(getset veri)
		{
			id=veri.getId();
			return true;
		}
		public ResultSet dselecttData(getset veri)
		{
			try
			{CallableStatement stm=(CallableStatement) con.prepareCall("{call dselecttData(?)}");
	        boolean hasResult =stm.execute();
	        if(hasResult){
	        ResultSet rs=stm.getResultSet();
	        System.out.println("Baþarýlý");
	        return rs;
			}}
			catch (Exception e) { System.out.println("Hata:"+e.getMessage());
				
			}
			return resultSet;
		}
		
		

		

		
	
}
