package project.pack.vo;


public class restaurent_canidateVO {
	
	int candiNum;
	String candidate;
	int candiCnt;
	String candiImg;
	String candiIntro;
	String candiAddr;
	String candiMenu;
	
	public restaurent_canidateVO() {
		// TODO Auto-generated constructor stub
	}

	public restaurent_canidateVO(int candiNum, String candidate, int candiCnt,
			String candiImg, String candiIntro, String candiAddr,
			String candiMenu) {
		this.candiNum = candiNum;
		this.candidate = candidate;
		this.candiCnt = candiCnt;
		this.candiImg = candiImg;
		this.candiIntro = candiIntro;
		this.candiAddr = candiAddr;
		this.candiMenu = candiMenu;
	}

	public int getCandiNum() {
		return candiNum;
	}

	public void setCandiNum(int candiNum) {
		this.candiNum = candiNum;
	}

	public String getCandidate() {
		return candidate;
	}

	public void setCandidate(String candidate) {
		this.candidate = candidate;
	}

	public int getCandiCnt() {
		return candiCnt;
	}

	public void setCandiCnt(int candiCnt) {
		this.candiCnt = candiCnt;
	}

	public String getCandiImg() {
		return candiImg;
	}

	public void setCandiImg(String candiImg) {
		this.candiImg = candiImg;
	}

	public String getCandiIntro() {
		return candiIntro;
	}

	public void setCandiIntro(String candiIntro) {
		this.candiIntro = candiIntro;
	}

	public String getCandiAddr() {
		return candiAddr;
	}

	public void setCandiAddr(String candiAddr) {
		this.candiAddr = candiAddr;
	}

	public String getCandiMenu() {
		return candiMenu;
	}

	public void setCandiMenu(String candiMenu) {
		this.candiMenu = candiMenu;
	}
	
	
	

	
	
	
	
}
