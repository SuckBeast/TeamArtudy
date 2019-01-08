package com.control;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class galleryDAO {
	public ArrayList<artInfo> tagSelect(String[] tag) {

		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		ArrayList<artInfo> result=new ArrayList<artInfo>();
		try {
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "test1";
			String password = "1234";
			String sql="";
			String temp="";
			if(tag.length==1) {
				sql="SELECT ART_NAME, ART_DIR FROM ART WHERE ART_TAG LIKE '%"+tag[0]+"%'";
			}else {
				temp="SELECT ART_NAME, ART_DIR, ART_TAG FROM ART WHERE ART_TAG LIKE '%"+tag[0]+"%'";
				for (int i = 1; i < tag.length-1; i++) {
					temp="SELECT ART_NAME, ART_DIR, ART_TAG FROM ("+temp+") WHERE ART_TAG LIKE '%"+tag[i]+"%'";
				}
				sql="SELECT ART_NAME, ART_DIR FROM ("+temp+") WHERE ART_TAG LIKE '%"+tag[tag.length-1]+"%'";
			}
			// 1.JDBC 드라이버 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, password);
			// 2. DBMS 연결
			pst = conn.prepareStatement(sql);
			// 3. SQL 실행 후 처리
			rs = pst.executeQuery();

			while(rs.next()) {
				artInfo artinfo=new artInfo();
				artinfo.setArt_name(rs.getString("ART_NAME"));
				artinfo.setArt_dir(rs.getString("ART_DIR"));
				result.add(artinfo);
			}

			return result;

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 오류발생과는 상관 없이 무조선 실행되는 영역

			try {
				if (rs != null) {
					rs.close();
				}
				if (pst != null) {
					pst.close();
				}
				if (conn != null) {
					conn.close();
				}

			} catch (SQLException e) {
				e.printStackTrace();

			}
		}
		return result;

	}

	public artInfo selectInfo(String name) {

		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		artInfo result=new artInfo();
		
		
		try {
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "test1";
			String password = "1234";
			String sql="";
			sql="SELECT * FROM ART WHERE ART_NAME=?";
			
			
			
			
			// 1.JDBC 드라이버 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");

			conn = DriverManager.getConnection(url, user, password);
			// 2. DBMS 연결
			pst = conn.prepareStatement(sql);
			pst.setString(1, name);
			
			// 3. SQL 실행 후 처리
			rs = pst.executeQuery();
			
			if(rs.next()) {
				result.setArt_name(rs.getString("ART_NAME"));
				result.setArt_dir(rs.getString("ART_DIR"));
				result.setArt_content(rs.getString("ART_CONTENT"));
				result.setArt_tag(rs.getString("ART_TAG"));
				result.setArt_producer(rs.getString("ART_PRODUCER"));
				result.setArt_year(rs.getString("ART_YEAR"));
				result.setArt_name_en(rs.getString("ART_NAME_EN"));
				result.setArt_collection(rs.getString("ART_COLLECTION"));
			}

			return result;

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 오류발생과는 상관 없이 무조선 실행되는 영역

			try {
				if (rs != null) {
					rs.close();
				}
				if (pst != null) {
					pst.close();
				}
				if (conn != null) {
					conn.close();
				}

			} catch (SQLException e) {
				e.printStackTrace();

			}
		}
		return result;
		
	}

	public ArrayList<artInfo> imgSearch(String name) {

		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		ArrayList<artInfo> result=new ArrayList<artInfo>();
		
		
		try {
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "test1";
			String password = "1234";
			String sql="SELECT ART_NAME, ART_DIR FROM ART WHERE ART_NAME LIKE '%"+name+"%'";
			// 1.JDBC 드라이버 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");

			conn = DriverManager.getConnection(url, user, password);
			// 2. DBMS 연결
			pst = conn.prepareStatement(sql);
			
			// 3. SQL 실행 후 처리
			rs = pst.executeQuery();

			while(rs.next()) {
				artInfo artinfo=new artInfo();
				artinfo.setArt_name(rs.getString("ART_NAME"));
				artinfo.setArt_dir(rs.getString("ART_DIR"));
				result.add(artinfo);
			}

			return result;

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 오류발생과는 상관 없이 무조선 실행되는 영역

			try {
				if (rs != null) {
					rs.close();
				}
				if (pst != null) {
					pst.close();
				}
				if (conn != null) {
					conn.close();
				}

			} catch (SQLException e) {
				e.printStackTrace();

			}
		}
		return result;

	}
	
}
