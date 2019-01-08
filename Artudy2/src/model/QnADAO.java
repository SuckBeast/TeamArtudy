package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class QnADAO {

	Connection conn = null;
	PreparedStatement pst = null;
	ResultSet rs = null;

	public ArrayList<QnAVO> QnAALL(String Select) {
		ArrayList<QnAVO> QnAList = new ArrayList<QnAVO>();
		conn = null;
		pst = null;
		rs = null;

		try {
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "test1";
			String password = "1234";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, password);
			String sql = "";

			if (Select == null) {
				sql = "SELECT * FROM QNA";
				pst = conn.prepareStatement(sql);
			} else {
				sql = "SELECT * FROM QNA where qna_number = ?";
				pst = conn.prepareStatement(sql);
				pst.setString(1, Select);
			}
			rs = pst.executeQuery();

			while (rs.next()) {
				QnAVO qvo = new QnAVO();
				qvo.setQnA_Number(rs.getInt(1));
				qvo.setTitle(rs.getString(2));
				qvo.setText(rs.getString(3));
				QnAList.add(qvo);
			}
			return QnAList;
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
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e) {
			}
		}
		return QnAList;
	}

	public ArrayList<QnAVO> QnAALL() {
		return null;
	}

	public void QnARepple(String Rip, int QnA_Number) {
		conn = null;
		pst = null;

		try {
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "test1";
			String password = "1234";
			String sql = "UPDATE QNA SET RIPPLE=? WHERE QNA_NUMBER=?";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, password);
			pst = conn.prepareStatement(sql);
			pst.setString(1, Rip);
			pst.setInt(2, QnA_Number);
			pst.executeUpdate();

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
		}
	}
}
