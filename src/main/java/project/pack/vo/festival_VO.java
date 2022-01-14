package project.pack.vo;

public class festival_VO {
	/*
	 * f_fore_id String AUTO_INCREMENT PRIMARY KEY,
	 * f_fore_city VARCHAR(10) NOT NULL,
	 * f_fore_site VARCHAR(70) NOT NULL,
	 * f_fore_title VARCHAR(20) NOT NULL
	 */
	

	String id;
	String city;
	String site;
	String title;
	String table;
	
	public festival_VO() {
		// TODO Auto-generated constructor stub
	}	

	public festival_VO(String id, String city, String site, String title, String table) {
		super();
		this.id = id;
		this.city = city;
		this.site = site;
		this.title = title;
		this.table = table;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getSite() {
		return site;
	}

	public void setSite(String site) {
		this.site = site;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTable() {
		return table;
	}

	public void setTable(String table) {
		this.table = table;
	}
	
	
	
	
}
