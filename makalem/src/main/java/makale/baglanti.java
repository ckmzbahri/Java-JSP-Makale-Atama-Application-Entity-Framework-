package makale;
import java.beans.Statement;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import makale.getset;
import java.text.SimpleDateFormat;  
import java.util.Date;
public class baglanti {
	private String driver="com.mysql.jdbc.Driver";
	private String url="jdbc:mysql://localhost:3306/makale?useUnicode=true&characterEncoding=UTF-8";
    private java.sql.Statement stm;
	private Connection con ;
	private  ResultSet resultSet = null;
	 int id;
		String baslik;
		String icerik;
		String durum;
		String tarih;
		String tur;
		String yazar;
		String filtre;
		int puan;
		int idm;
		String inceleyen;
		String rapor;
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
		public ResultSet selectAllData()
		{	
			try
			{
				CallableStatement stm=(CallableStatement) con.prepareCall("{call mselecttAllData()}");
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
		public boolean VeriAldým(getset veri)
		{
			yazar = veri.getYazar();
			inceleyen=veri.getInceleyen();
			durum=veri.getDurum();
			return true;
		}
		public boolean IdAldým(getset veri)
		{
			id=veri.getId();
			return true;
		}

		public ResultSet selecttData()
		{
			try
			{CallableStatement stm=(CallableStatement) con.prepareCall("{call myselectdata(?)}");
			stm.setString(1, yazar);
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
		public ResultSet selecData()
		{
			try
			{CallableStatement stm=(CallableStatement) con.prepareCall("{call miselectdata(?)}");
			stm.setString(1, inceleyen);
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
		public boolean deleteData(int id)
		{ 
			try
			{

				CallableStatement stm=(CallableStatement) con.prepareCall("{call mdelete(?)}");		 
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
		public ResultSet selectData()
		{
			try
			{CallableStatement stm=(CallableStatement) con.prepareCall("{call mselectdata(?)}");
			stm.setInt(1, id);
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
		{      SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
               Date date = new Date();  
               id=veri.getId();
	           baslik=veri.getBaslik();
	           icerik=veri.getIcerik();
	           durum=veri.getDurum();
	           tarih=formatter.format(date);
	           tur=veri.getTur();
	           try
				{
					CallableStatement statement=(CallableStatement) con.prepareCall("{call mupdate(?,?,?,?,?)}"); 
					statement.setInt(1,id); 
					statement.setString(2,baslik);
					statement.setString(3,icerik);				
					statement.setString(4,tarih);
					statement.setString(5,tur);
					int result=statement.executeUpdate(); if(result>0) { System.out.println("Durum Güncellendi"); return true; } else { 
					return false; } 

				}
				catch (Exception e) { System.out.println("Hata:"+e.getMessage()); return false;}
	           
		}
		public boolean raporyayin(getset veri)
		{     
               rapor=veri.getRapor();
               System.out.println(rapor);
               id=veri.getId();

               try
   			{
   				CallableStatement statement=(CallableStatement) con.prepareCall("{call rupdate(?,?)}"); 
   				statement.setInt(1,id); 
   				statement.setString(2,rapor);

   				int result=statement.executeUpdate(); if(result>0) { System.out.println("Durum Güncellendi"); return true; } else { 
   				return false; } 

   			}
   			catch (Exception e) { System.out.println("Hata:"+e.getMessage()); return false;}
	           
		}
		public boolean insertData(getset veri)
		{   
		       SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
	           Date date = new Date();  
	           baslik=veri.getBaslik();
	           icerik=veri.getIcerik();
	           durum=veri.getDurum();
	           tarih=formatter.format(date);
	           tur=veri.getTur();
	           yazar=veri.getYazar();
	       
	           try { CallableStatement cs; cs=(CallableStatement) con.prepareCall("{call mekle(?,?,?,?,?,?)}"); 
		          
	           cs.setString(1,baslik); 
	           cs.setString(2,icerik); 
	           cs.setString(3,durum); 
	           cs.setString(4,tarih); 
	           cs.setString(5,tur); 
	           cs.setString(6,yazar); 
	           cs.execute(); System.out.println("Baþarýlý"); return true; 
	           } 
	           catch (Exception e) { System.out.println("Hata:"+e.getMessage()); 
	           } return false; 
			
		}
		public boolean ver(getset veri)
		{
			yazar=veri.getYazar();
			filtre = veri.getFiltre();
			inceleyen = veri.getInceleyen();
			return true;
		}
		public ResultSet filtrele()
		
		{
			try
			{CallableStatement stm=(CallableStatement) con.prepareCall("{call mfiltrele(?,?)}");
			stm.setString(1, filtre);
			stm.setString(2, yazar);
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
public ResultSet uzmanfiltrele()
		
		{
	try
	{CallableStatement stm=(CallableStatement) con.prepareCall("{call ufiltrele(?,?)}");
	stm.setString(1, filtre);
	stm.setString(2, inceleyen);
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
      public ResultSet editorfiltrele()
		
		{
    		try
    		{CallableStatement stm=(CallableStatement) con.prepareCall("{call efiltrele(?)}");
    		stm.setString(1, filtre);
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
		
		public boolean idaldim(getset veri)
		{
			idm = veri.getId();
			return true;
		}
		
		public ResultSet select(getset veri)
		{
			try
			{CallableStatement stm=(CallableStatement) con.prepareCall("{call mmselectdata(?)}");
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
		
		public boolean uzmanbelirle(getset veri)
		{   idm=veri.getId();
		System.out.println(idm);
			tur=veri.getTur();
			return true;
		}
		public ResultSet atamaislemi()
		{
			try
			{CallableStatement stm=(CallableStatement) con.prepareCall("{call hbelirle(?)}");
			stm.setString(1, tur);
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
		    inceleyen=veri.getInceleyen();

		    try
			{
				CallableStatement statement=(CallableStatement) con.prepareCall("{call dupdate(?,?)}"); 
				statement.setInt(1,idm); 
				statement.setString(2,inceleyen);

				int result=statement.executeUpdate(); if(result>0) { System.out.println("Durum Güncellendi"); return true; } else { 
				return false; } 

			}
			catch (Exception e) { System.out.println("Hata:"+e.getMessage()); return false;}
			
		}
		public boolean gericevir(getset veri)
		{   idm=veri.getId();
		    inceleyen=veri.getInceleyen();
		    try
			{
				CallableStatement statement=(CallableStatement) con.prepareCall("{call gericevir(?)}"); 
				statement.setInt(1,idm); 
				

				int result=statement.executeUpdate(); if(result>0) { System.out.println("Durum Güncellendi"); return true; } else { 
				return false; } 

			}
			catch (Exception e) { System.out.println("Hata:"+e.getMessage()); return false;}
			
		}
		public boolean kabul(getset veri)
		{   idm=veri.getId();
		    inceleyen=veri.getInceleyen();
		    try
			{
				CallableStatement statement=(CallableStatement) con.prepareCall("{call kabul(?)}"); 
				statement.setInt(1,idm); 
				

				int result=statement.executeUpdate(); if(result>0) { System.out.println("Durum Güncellendi"); return true; } else { 
				return false; } 

			}
			catch (Exception e) { System.out.println("Hata:"+e.getMessage()); return false;}
			
		}

		
		
		
	
}
