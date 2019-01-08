package model;

public class QnAVO {

	private int QnA_Number;
	private String Title;
	private String Text;
	private String Rip;

	public QnAVO(int qnA_Number, String title, String text, String rip) {
		super();
		QnA_Number = qnA_Number;
		Title = title;
		Text = text;
		Rip = rip;
	}

	public QnAVO() {
	}

	public int getQnA_Number() {
		return QnA_Number;
	}

	public void setQnA_Number(int qnA_Number) {
		QnA_Number = qnA_Number;
	}

	public String getTitle() {
		return Title;
	}

	public void setTitle(String title) {
		Title = title;
	}

	public String getText() {
		return Text;
	}

	public void setText(String text) {
		Text = text;
	}

	public String getRip() {
		return Rip;
	}

	public void setRip(String rip) {
		Rip = rip;
	}
}