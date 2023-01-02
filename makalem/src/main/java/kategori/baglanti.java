package kategori;
import java.beans.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.CallableStatement;
import kategori.getset;
public class baglanti {
	private String driver="com.mysql.jdbc.Driver";
	private String url="jdbc:mysql://localhost:3306/makale?useUnicode=true&characterEncoding=UTF-8";
    private java.sql.Statement stm;
	private Connection con ;
	private  ResultSet resultSet = null;
		String tur;
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
		
		public boolean deleteData(int id)
		{ 
		try
		{

			CallableStatement stm=(CallableStatement) con.prepareCall("{call kdelete(?)}");		 
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
		public boolean idaldim(getset veri)
		{
			idm = veri.getId();
			return true;
		}

		
		public ResultSet select(getset veri)
		{
			try
			{CallableStatement stm=(CallableStatement) con.prepareCall("{call kselectdata(?)}");
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
		
		public ResultSet selectAllData()
		{	
			try
			{
				CallableStatement stm=(CallableStatement) con.prepareCall("{call kselecttAllData()}");
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
		
		public boolean insertData(getset veri)
		{
	           tur=veri.getTur();
	           try { CallableStatement cs; cs=(CallableStatement) con.prepareCall("{call kekle(?)}"); 
	          
	           cs.setString(1,tur); 
	           cs.execute(); System.out.println("Baþarýlý"); return true; 
	           } 
	           catch (Exception e) { System.out.println("Hata:"+e.getMessage()); 
	           } return false; 

		}
		public boolean updateData(getset veri)
		{    tur=veri.getTur();
             id=veri.getId();
			
			try
			{
				CallableStatement statement=(CallableStatement) con.prepareCall("{call kupdate(?,?)}"); 
				statement.setInt(1,id); 
				statement.setString(2,tur);

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
		
		
		public boolean deleteData( getset veri)
		{ 
			try
			{

				CallableStatement stm=(CallableStatement) con.prepareCall("{call kdelete(?)}");		 
				stm.setInt(1, id);
				boolean hasResult =stm.execute();
				if(hasResult)
				{
					ResultSet rs=stm.getResultSet();
					System.out.println("Baþarýlý");
					return true;
				}
	    
				
			}
			catch (Exception e) { System.out.println("Hata:"+e.getMessage()); return false;}
			return false;	
			}

}
