package model;

public class MemberVO {
	
	private String ADMIN_PW;

	public MemberVO(String aDMIN_PW) {
		super();
		ADMIN_PW = aDMIN_PW;
	}

	public String getADMIN_PW() {
		return ADMIN_PW;
	}

	public void setADMIN_PW(String aDMIN_PW) {
		ADMIN_PW = aDMIN_PW;
	}

}
