package project.pack.vo;

public class restaurent_voteVO {
	
	private int candiNum;
	private String candidate;
	private String memberId;
	
	public restaurent_voteVO() {
		// TODO Auto-generated constructor stub
	}

	public restaurent_voteVO(int candiNum, String candidate, String memberId) {
		this.candiNum = candiNum;
		this.candidate = candidate;
		this.memberId = memberId;
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

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
	
	
	

}
