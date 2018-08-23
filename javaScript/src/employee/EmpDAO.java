package employee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.DbCon;

public class EmpDAO {

	public List<Employee> getEmpList(String name) {
		DbCon con = new DbCon();
		Connection conn = con.connect();
		Employee emp;
		List<Employee> list = new ArrayList<>();

		String sql = "select first_name, last_name, salary from employees where first_name like '%'||'" + name + "'||'%'";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			System.out.println(sql + " kkkkkkkkkkkkkkkk");
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
		}
		return list;
	}
}
