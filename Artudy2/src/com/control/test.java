package com.control;

public class test {

	public static void main(String[] args) {
		String[] tag= {"culture","person"};
		String buket="";
		
		
		for(int i=0;tag.length>i;i++) {
			buket+="%?%";
			if(tag.length>1&&i!=(tag.length-1)) {
				buket+=",";
			}
		}
		String sql = "SELECT ART_NAME, ART_IMG, ART_TAG FROM ART WHERE ART_TAG LIKE '"+buket+"'";
		System.out.println(sql);
	}

}
