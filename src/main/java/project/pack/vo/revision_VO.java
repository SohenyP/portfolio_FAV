package project.pack.vo;

public class revision_VO {

	private String newId;
	private String newPw;
	private String newEmail;
	private String newPhone;
	
	public revision_VO() {
		// TODO Auto-generated constructor stub
	}

	public revision_VO(String newId, String newPw, String newEmail, String newPhone) {
	
		this.newId = newId;
		this.newPw = newPw;
		this.newEmail = newEmail;
		this.newPhone = newPhone;
	}

	
	
	public String getNewId() {
		return newId;
	}

	public void setNewId(String newId) {
		this.newId = newId;
	}

	public String getNewPw() {
		return newPw;
	}

	public void setNewPw(String newPw) {
		this.newPw = newPw;
	}

	public String getNewEmail() {
		return newEmail;
	}

	public void setNewEmail(String newEmail) {
		this.newEmail = newEmail;
	}

	public String getNewPhone() {
		return newPhone;
	}

	public void setNewPhone(String newPhone) {
		this.newPhone = newPhone;
	}
	
	
	
	
}
