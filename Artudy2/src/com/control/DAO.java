package com.control;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;



public class DAO {


public int textInsert(String text, String name) {
	Connection conn = null;
	PreparedStatement pstmt = null;
	int cnt=0;
	try {
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String user = "test1";
		String password = "1234";
		String sql = "insert into reply values(SEQ_R.NEXTVAL,?,?)";
		// 1.jdbc 드라이버 로딩
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, password);
		// 2.sql실행
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, text);
		pstmt.setString(2, name);

		cnt = pstmt.executeUpdate();
		return cnt;
		
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		// 오류발생과는 상관없이 무조건 실행

		try {
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	return cnt;
}
public ArrayList<String> findText(String name) {

	Connection conn = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
	ArrayList<String> result=new ArrayList<String>();
	
	
	try {
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "test1";
		String password = "1234";
		String sql="";
		sql="SELECT * FROM REPLY WHERE REF=? ORDER BY NUM DESC";
		
		
		
		
		// 1.JDBC 드라이버 로딩
		Class.forName("oracle.jdbc.driver.OracleDriver");

		conn = DriverManager.getConnection(url, user, password);
		// 2. DBMS 연결
		pst = conn.prepareStatement(sql);
		pst.setString(1, name);
		
		// 3. SQL 실행 후 처리
		rs = pst.executeQuery();
		
		while(rs.next()) {
			result.add(rs.getString("TEXT"));
			
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
public int count(String name) {
	Connection conn = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
	int cnt=0;
	try {
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "test1";
		String password = "1234";
		String sql="";
		
		sql="SELECT COUNT(*) FROM REPLY WHERE REF=?";
		
		
		
		
		// 1.JDBC 드라이버 로딩
		Class.forName("oracle.jdbc.driver.OracleDriver");

		conn = DriverManager.getConnection(url, user, password);
		// 2. DBMS 연결
		pst = conn.prepareStatement(sql);
		pst.setString(1, name);
		
		// 3. SQL 실행 후 처리
		rs = pst.executeQuery();
		
		if(rs.next()) {
			cnt=rs.getInt(1);
			
		}

		return cnt;

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
	return cnt;
}
}
