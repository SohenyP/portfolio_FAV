package project.pack.vo;

public class account_reservationVO {

	private String memberBid;
	private String memberName;
	private String restauName;
	private String restauAddr;
	private String reservationDate;
	private String reservationDate2;
	private String memberContact;
	private String personnel;
	private String status;
	private String memberOid;
	private String charge;
	private String reservationNum;
	
	public account_reservationVO() {
		// TODO Auto-generated constructor stub
	}

	public account_reservationVO(String memberBid, String memberName, String restauName, String restauAddr,
			String reservationDate, String reservationDate2, String memberContact, String personnel, String status,
			String memberOid, String charge, String reservationNum) {
		this.memberBid = memberBid;
		this.memberName = memberName;
		this.restauName = restauName;
		this.restauAddr = restauAddr;
		this.reservationDate = reservationDate;
		this.reservationDate2 = reservationDate2;
		this.memberContact = memberContact;
		this.personnel = personnel;
		this.status = status;
		this.memberOid = memberOid;
		this.charge = charge;
		this.reservationNum = reservationNum;
	}

	public String getMemberBid() {
		return memberBid;
	}

	public void setMemberBid(String memberBid) {
		this.memberBid = memberBid;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
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

	public String getReservationDate() {
		return reservationDate;
	}

	public void setReservationDate(String reservationDate) {
		this.reservationDate = reservationDate;
	}

	public String getReservationDate2() {
		return reservationDate2;
	}

	public void setReservationDate2(String reservationDate2) {
		this.reservationDate2 = reservationDate2;
	}

	public String getMemberContact() {
		return memberContact;
	}

	public void setMemberContact(String memberContact) {
		this.memberContact = memberContact;
	}

	public String getPersonnel() {
		return personnel;
	}

	public void setPersonnel(String personnel) {
		this.personnel = personnel;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getMemberOid() {
		return memberOid;
	}

	public void setMemberOid(String memberOid) {
		this.memberOid = memberOid;
	}

	public String getCharge() {
		return charge;
	}

	public void setCharge(String charge) {
		this.charge = charge;
	}

	public String getReservationNum() {
		return reservationNum;
	}

	public void setReservationNum(String reservationNum) {
		this.reservationNum = reservationNum;
	}
	
	
	
	
}
