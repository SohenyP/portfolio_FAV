package project.pack.vo;

public class account_memberVO {

	String rowNum;
	String memberId;
	String memberPw;
	String memberName;
	String memberEmail;
	String memberContact;
	String memberAgree;
	String memberType;
	String joinDate;
	
	public account_memberVO() {
		// TODO Auto-generated constructor stub
	}
	

	public account_memberVO(String rowNum, String memberId, String memberPw, String memberName, String memberEmail,
			String memberContact, String memberAgree, String memberType, String joinDate) {
		super();
		this.rowNum = rowNum;
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberName = memberName;
		this.memberEmail = memberEmail;
		this.memberContact = memberContact;
		this.memberAgree = memberAgree;
		this.memberType = memberType;
		this.joinDate = joinDate;
	}

	
	public String getRowNum() {
		return rowNum;
	}

	public void setRowNum(String rowNum) {
		this.rowNum = rowNum;
	}


	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPw() {
		return memberPw;
	}

	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberContact() {
		return memberContact;
	}

	public void setMemberContact(String memberContact) {
		this.memberContact = memberContact;
	}

	public String getMemberAgree() {
		return memberAgree;
	}

	public void setMemberAgree(String memberAgree) {
		this.memberAgree = memberAgree;
	}
	public String getMemberType() {
		return memberType;
	}


	public void setMemberType(String memberType) {
		this.memberType = memberType;
	}


	public String getJoinDate() {
		return joinDate;
	}


	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}
	
	
	
	
	
	
	
	
}
