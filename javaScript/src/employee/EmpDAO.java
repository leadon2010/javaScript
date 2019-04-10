package employee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import common.DbCon;

public class EmpDAO {
	PreparedStatement pstmt = null;

	public String getUserInfo(String id, String pw) {
		Connection conn = DbCon.connect();
		String sql = "select * from member_hr where user_id = ? and user_pw = ?";
		String returnInfo = "";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				returnInfo += rs.getString("first_name") + ", ";
				returnInfo += rs.getString("last_name");
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
		System.out.println(returnInfo);
		return returnInfo;

	}

	public void delEmployee(String id) {
		Connection conn = DbCon.connect();
		try {
			pstmt = conn.prepareStatement("delete from employee_temp where employee_id = " + id);
			int r = pstmt.executeUpdate();
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
	}

	public List<Employee> getEmplsList() {
		Connection conn = DbCon.connect();
		List<Employee> list = new ArrayList<>();
		Employee emp;
		String sql = "select * from employee_temp order by employee_id desc";
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				emp = new Employee();
				emp.setFirstName(rs.getString("first_name"));
				emp.setLastName(rs.getString("last_name"));
				emp.setEmployeeId(rs.getInt("employee_id"));
				emp.setSalary(rs.getInt("salary"));
				emp.setHireDate(rs.getString("hire_date"));
				list.add(emp);
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

	public List<Employee> getEmpList(String name) {
		Connection conn = DbCon.connect();
		Employee emp;
		List<Employee> list = new ArrayList<>();

		String sql = "select first_name, last_name, salary from employees where first_name like '%'||'" + name
				+ "'||'%'";
		try {
			pstmt = conn.prepareStatement(sql);
			System.out.println(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				emp = new Employee();
				emp.setFirstName(rs.getString("first_name"));
				emp.setLastName(rs.getString("last_name"));
				emp.setSalary(rs.getInt("salary"));
				list.add(emp);
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

	public List<Map<String, Object>> getEmpPerDept() {
		Connection conn = DbCon.connect();
		Map<String, Object> map;
		List<Map<String, Object>> list = new ArrayList<>();
		String sql = "SELECT d.department_name ,COUNT(*) cnt FROM employees e JOIN departments d ON e.department_id = d.department_id "
				+ "WHERE  e.department_id IS NOT NULL GROUP  BY d.department_name";
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				map = new HashMap<String, Object>();
				map.put(rs.getString("department_name"), rs.getInt("cnt"));
				list.add(map);
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
}
