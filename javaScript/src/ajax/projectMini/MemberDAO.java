package ajax.projectMini;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.DbCon;

public class MemberDAO {
	Connection conn = DbCon.connect();
	PreparedStatement pstmt;

	public String deleteRow(String id) {
		String sql = "delete from mini_member where id = ?";
		int r = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			r = pstmt.executeUpdate();
			System.out.println(r + " 건이 삭제되었습니다.");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (r > 0)
			return "OK";
		else
			return "NG";
	}

	public List<Member> getMemberList() {
		String sql = "select * from mini_member order by 1";
		List<Member> list = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Member mem = new Member();
				mem.setId(rs.getString("id"));
				mem.setPw(rs.getString("pw"));
				mem.setName(rs.getString("name"));
				mem.setPhone(rs.getString("phone"));
				mem.setAddress(rs.getString("address"));
				list.add(mem);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

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
