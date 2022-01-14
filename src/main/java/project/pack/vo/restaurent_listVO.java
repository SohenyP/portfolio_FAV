package project.pack.vo;


public class restaurent_listVO {
	

	int rowNum;
	String restauName;
	String restauAddr;
	double restauLat;
	double restauLng;
	String restauCity;
	String restauImg1;
	String restauImg2;
	String restauImg3;
	String restauStyle;
	String restauMenu;
	String memberId;
	
	public restaurent_listVO() {
		// TODO Auto-generated constructor stub
	}

	public restaurent_listVO(int rowNum, String restauName, String restauAddr, double restauLat, double restauLng,
			String restauCity, String restauImg1, String restauImg2, String restauImg3, String restauStyle,
			String restauMenu, String memberId) {
		this.rowNum = rowNum;
		this.restauName = restauName;
		this.restauAddr = restauAddr;
		this.restauLat = restauLat;
		this.restauLng = restauLng;
		this.restauCity = restauCity;
		this.restauImg1 = restauImg1;
		this.restauImg2 = restauImg2;
		this.restauImg3 = restauImg3;
		this.restauStyle = restauStyle;
		this.restauMenu = restauMenu;
		this.memberId = memberId;
	}

	public int getRowNum() {
		return rowNum;
	}

	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}

	public String getRestauName() {
		return restauName;
	}

	public void setRestauName(String restauName) {
		this.restauName = restauName;
	}

	public String getRestauAddr() {
		return restauAddr;
	}

	public void setRestauAddr(String restauAddr) {
		this.restauAddr = restauAddr;
	}

	public double getRestauLat() {
		return restauLat;
	}

	public void setRestauLat(double restauLat) {
		this.restauLat = restauLat;
	}

	public double getRestauLng() {
		return restauLng;
	}

	public void setRestauLng(double restauLng) {
		this.restauLng = restauLng;
	}

	public String getRestauCity() {
		return restauCity;
	}

	public void setRestauCity(String restauCity) {
		this.restauCity = restauCity;
	}

	public String getRestauImg1() {
		return restauImg1;
	}

	public void setRestauImg1(String restauImg1) {
		this.restauImg1 = restauImg1;
	}

	public String getRestauImg2() {
		return restauImg2;
	}

	public void setRestauImg2(String restauImg2) {
		this.restauImg2 = restauImg2;
	}

	public String getRestauImg3() {
		return restauImg3;
	}

	public void setRestauImg3(String restauImg3) {
		this.restauImg3 = restauImg3;
	}

	public String getRestauStyle() {
		return restauStyle;
	}

	public void setRestauStyle(String restauStyle) {
		this.restauStyle = restauStyle;
	}

	public String getRestauMenu() {
		return restauMenu;
	}

	public void setRestauMenu(String restauMenu) {
		this.restauMenu = restauMenu;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
	
	
}
