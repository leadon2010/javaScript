package loginTest;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import common.DbCon;

public class LoginDAO {

	public void insertLogin(String id, String pw, String name) {
		PreparedStatement pstmt = null;
		Connection conn = DbCon.connect();
		String sql = "insert into login_test values(?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, pw);
			int r = pstmt.executeUpdate();
			System.out.println(r + " row inserted.");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public String createRow(String id, String pw, String name) {
		CallableStatement cstmt = null;
		Connection conn = DbCon.connect();
		String retCode = "NG";
		try {
			cstmt = conn.prepareCall("{call create_row(?,?,?,?)}");
			cstmt.setString(1, id);
			cstmt.setString(2, pw);
			cstmt.setString(3, name);
			cstmt.registerOutParameter(4, java.sql.Types.VARCHAR);
			cstmt.execute();
			String retMsg = cstmt.getString(4);
			if (retMsg.equals("OK"))
				System.out.println("정상처리되었습니다.");
			else
				System.out.println("처리중 에러발생.");

			retCode = retMsg;

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return retCode;

	}

}
