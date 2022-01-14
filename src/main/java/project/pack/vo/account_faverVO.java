package project.pack.vo;

public class account_faverVO {
	 
	
	String memberId;
	String memberPw;
	String memberName;
	String memberEmail;
	String memberContact;
	String memberBirth;
	String memberAgree;
	String joinDate;
	
	public account_faverVO() {
		// TODO Auto-generated constructor stub
	}
	

	public account_faverVO(String memberId, String memberPw, String memberName, String memberEmail,
			String memberContact, String memberBirth, String memberAgree, String joinDate) {
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberName = memberName;
		this.memberEmail = memberEmail;
		this.memberContact = memberContact;
		this.memberBirth = memberBirth;
		this.memberAgree = memberAgree;
		this.joinDate = joinDate;
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

	public String getMemberBirth() {
		return memberBirth;
	}

	public void setMemberBirth(String memberBirth) {
		this.memberBirth = memberBirth;
	}

	public String getMemberAgree() {
		return memberAgree;
	}

	public void setMemberAgree(String memberAgree) {
		this.memberAgree = memberAgree;
	}


	public String getJoinDate() {
		return joinDate;
	}


	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}
	
	


	
}
