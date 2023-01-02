package makale;

public class getset {
	  private String baslik;
	  private String icerik;
	  private String tur;
	  private String durum;
	  private String tarih;
	  private String yazar;
	  private String filtre;
	  private String inceleyen;
	  private String rapor;
	  int puan;
	  
	  public int getPuan() {
		return puan;
	}
	public void setPuan(int puan) {
		this.puan = puan;
	}
	public String getInceleyen() {
		return inceleyen;
	}
	public void setInceleyen(String inceleyen) {
		this.inceleyen = inceleyen;
	}
	public String getRapor() {
		return rapor;
	}
	public void setRapor(String rapor) {
		this.rapor = rapor;
	}
	public String getYazar()
	
	{
		return yazar;
	}
	public String getFiltre() {
		return filtre;
	}
	public void setFiltre(String filtre) {
		this.filtre = filtre;
	}
	public void setYazar(String yazar) {
		this.yazar = yazar;
	}
	int id;
	public String getBaslik() {
		return baslik;
	}
	public void setBaslik(String baslik) {
		this.baslik = baslik;
	}
	public String getIcerik() {
		return icerik;
	}
	public void setIcerik(String icerik) {
		this.icerik = icerik;
	}
	public String getTur() {
		return tur;
	}
	public void setTur(String tur) {
		this.tur = tur;
	}
	public String getDurum() {
		return durum;
	}
	public void setDurum(String durum) {
		this.durum = durum;
	}
	public String getTarih() {
		return tarih;
	}
	public void setTarih(String tarih) {
		this.tarih = tarih;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
}
