package model;

public class adminVO {

	
	private String name;
	private String content;
	private String tag;
	private String dir;
	
	
	
	public adminVO(String name, String content, String tag, String dir) {
		super();
		this.name = name;
		this.content = content;
		this.tag = tag;
		this.dir = dir;
	}
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public String getDir() {
		return dir;
	}
	public void setDir(String dir) {
		this.dir = dir;
	}
	
	
	
}
