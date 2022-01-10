package kr.co.shop.notice;

public class NoticeDTO {

	private int noticeno;
	private String id;
	private String subject;
	private String content;
	private String photo;
	private String date;
	
	public NoticeDTO() {}
	
	public NoticeDTO(int noticeno, String id, String subject, String content, String photo, String date) {
		
		this.noticeno=noticeno;
		this.id=id;
		this.subject=subject;
		this.content=content;
		this.photo=photo;
		this.date=date;
		
	}

	public int getNoticeno() {
		return noticeno;
	}

	public void setNoticeno(int noticeno) {
		this.noticeno = noticeno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	
	
}


