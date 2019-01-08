package model;

import java.awt.Component;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.JOptionPane;

public class DAO {

	public int insert(VO vo) {

		Connection conn = null;
		PreparedStatement pst = null;
		int cnt = 0;

		try {
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "test1";
			String password = "1234";
			String sql = "INSERT INTO BOARD VALUES(board_num.nextval ,?,?,?,?,sysdate)";
			// 1. JDBC����̹� �ε�
			Class.forName("oracle.jdbc.driver.OracleDriver");

			conn = (Connection) DriverManager.getConnection(url, user, password);
			// 2.SQL �����غ�
			pst = conn.prepareStatement(sql);
			pst.setString(1, vo.getId());
			pst.setString(2, vo.getPw());
			pst.setString(3, vo.getTitle());
			pst.setString(4, vo.getContent());

			// 3. SQL ���� �� ó��
			cnt = pst.executeUpdate();

			return cnt;

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// �����߻����� ��� ���� ������ ����Ǵ� ����

			try {
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

	public int delete(int num) {

		Connection conn = null;
		PreparedStatement pst = null;
		int cnt = 0;

		try {
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "test1";
			String password = "1234";
			String sql = "delete from board where board_num = ?";
			// 1. JDBC����̹� �ε�
			Class.forName("oracle.jdbc.driver.OracleDriver");

			conn = (Connection) DriverManager.getConnection(url, user, password);
			// 2.SQL �����غ�
			pst = conn.prepareStatement(sql);
			pst.setInt(1, num);

			// 3. SQL ���� �� ó��
			cnt = pst.executeUpdate();

			return cnt;

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// �����߻����� ��� ���� ������ ����Ǵ� ����

			try {
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

	public int update(VO vo, String num) {

		Connection conn = null;
		PreparedStatement pst = null;

		int cnt = 0;
		try {
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "test1";
			String password = "1234";
			String sql = "update board set title = ?, content = ? where board_num = ?";
			// 1. JDBC����̹� �ε�
			Class.forName("oracle.jdbc.driver.OracleDriver");

			conn = (Connection) DriverManager.getConnection(url, user, password);
			// 2.SQL �����غ�

			pst = conn.prepareStatement(sql);
			pst.setString(1, vo.getTitle());
			pst.setString(2, vo.getContent());
			pst.setString(3, num);

			// 3. SQL ���� �� ó��
			cnt = pst.executeUpdate();
			System.out.print(cnt);
			return cnt;

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// �����߻����� ��� ���� ������ ����Ǵ� ����

			try {
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

	public boolean pwcheck(String mem_id, String pw) {

		boolean check = false;
		Connection conn = null;
		PreparedStatement pst = null;

		String temp;

		ResultSet rs = null;
		try {
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "test1";
			String password = "1234";
			String sql = "select pw from board where board_num=?";
			// 1. JDBC����̹� �ε�
			Class.forName("oracle.jdbc.driver.OracleDriver");

			conn = (Connection) DriverManager.getConnection(url, user, password);
			// 2.SQL �����غ�

			pst = conn.prepareStatement(sql);
			pst.setString(1, mem_id);

			// 3. SQL ���� �� ó��
			rs = pst.executeQuery();
			if (rs.next()) {
				temp = rs.getString(1);
				if (temp.equals(pw)) {

					check = true;
				} else {
					JOptionPane.showMessageDialog(null, "��й�ȣ�� Ʋ�Ƚ��ϴ�!", "��������", JOptionPane.ERROR_MESSAGE);
					
				}
			}

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// �����߻����� ��� ���� ������ ����Ǵ� ����

			try {
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
		return check;

	}

}
