package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AdminDAO {

	
	public int product_process(String name, String content, String tag, String dir ) {
		Connection conn = null;
		PreparedStatement pst = null;
		// jdbc 드라이버 로딩
		int cnt = 0;
		try {
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "test1";
			String password = "1234";
			String sql = "INSERT INTO product VALUES(?, ?, ?, ?)";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, password);
			
			// sql문 실행 후 처리
			pst = conn.prepareStatement(sql);
			pst.setString(1, name);
			pst.setString(2, content);
			pst.setString(3, tag);
			pst.setString(4, dir);
			cnt = pst.executeUpdate();

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pst != null) {
					pst.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
			}
			return cnt;
		}
	}
		
		public int product_delete(String name) {
			Connection conn = null;
			PreparedStatement pst = null;
			// jdbc 드라이버 로딩
			int cnt = 0;
			try {
				String url = "jdbc:oracle:thin:@localhost:1521:xe";
				String user = "test1";
				String password = "1234";
				String sql = "delete from product where name = ?";
				Class.forName("oracle.jdbc.driver.OracleDriver");
				conn = DriverManager.getConnection(url, user, password);
				
				// sql문 실행 후 처리
				pst = conn.prepareStatement(sql);
				pst.setString(1, name);
				
				cnt = pst.executeUpdate();

			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					if (pst != null) {
						pst.close();
					}
					if (conn != null) {
						conn.close();
					}
				} catch (Exception e) {
				}
				return cnt;
			}
		
		
	}
	
	
	
	
}
