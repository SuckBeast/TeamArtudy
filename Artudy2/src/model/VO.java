package model;

public class VO {
	private String title;
	private String id;
	private String content;
	private String pw;
	

	
	
	public VO(String title, String id, String content) {
		super();
		this.title = title;
		this.id = id;
		this.content = content;
	}
	public VO(String title, String id, String content, String pw) {
		super();
		this.title = title;
		this.id = id;
		this.content = content;
		this.pw = pw;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}


}
