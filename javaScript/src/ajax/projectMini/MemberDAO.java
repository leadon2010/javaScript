package ajax.projectMini;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import common.DbCon;

public class MemberDAO {
	Connection conn = DbCon.connect();
	PreparedStatement pstmt;

	public void insertMember(Member memb) {
		String sql = "insert into mini_member(id, pw, name, phone, address) values(?,?,?,?,?)";
		int r = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(++r, memb.getId());
			pstmt.setString(++r, memb.getPw());
			pstmt.setString(++r, memb.getName());
			pstmt.setString(++r, memb.getPhone());
			pstmt.setString(++r, memb.getAddress());

			int row = pstmt.executeUpdate();
			System.out.println(row + " 건 입력되었습니다.");

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
}
