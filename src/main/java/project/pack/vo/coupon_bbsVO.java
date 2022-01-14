package project.pack.vo;

public class coupon_bbsVO {
	
	private int num;
	private String title;
	private String content;
	private String memberId;
	private String createdate;
	private String isdelete;
	private String bulletPoint;
	private int start;
	private int count;
	
	//게시글 총 갯수 초기값 설정 (sql인덱스는 0부터 시작)
	//오라클에는 LIMIT대신 ROWNUM
	public coupon_bbsVO() {
		this.start = 0;
		this.count = 5;
	}


	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getCreatedate() {
		return createdate;
	}

	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}

	public String getIsdelete() {
		return isdelete;
	}

	public void setIsdelete(String isdelete) {
		this.isdelete = isdelete;
	}

	public String getBulletPoint() {
		return bulletPoint;
	}

	public void setBulletPoint(String bulletPoint) {
		this.bulletPoint = bulletPoint;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	
	
	

}
