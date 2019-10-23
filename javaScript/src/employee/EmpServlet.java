package employee;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 * Servlet implementation class EmpServlet
 */
@WebServlet("/EmpServlet")
public class EmpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EmpServlet() {
		super();
	}

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// response.getWriter().append("Served at: ").append(request.getContextPath());

		String action = request.getParameter("action");
		EmpDAO dao = new EmpDAO();

		if (action == null) {

		} else if (action.equals("del")) {
			String empid = request.getParameter("empId");
			System.out.println(empid);

			String returnStr = dao.delEmployee(empid);
			System.out.println(returnStr);
			response.getWriter().println(returnStr);

		} else if (action.equals("list")) {
			List<Employee> list = new ArrayList<Employee>();
			JSONObject jsonObj = null;
			JSONArray jsonAry = new JSONArray();

			list = dao.getEmplsList();
			for (Employee emp : list) {
				jsonObj = new JSONObject();
				jsonObj.put("employeeId", emp.getEmployeeId());
				jsonObj.put("hireDate", emp.getHireDate());
				jsonObj.put("lastName", emp.getLastName());
				jsonObj.put("salary", emp.getSalary());
				jsonObj.put("firstName", emp.getFirstName());
				jsonAry.add(jsonObj);
			}
			JSONObject json = new JSONObject();
			json.put("datas", jsonAry);
			PrintWriter pw = response.getWriter();
			pw.println(json.toString());

		} else if (action.equals("insert")) {
			String lastName = request.getParameter("lastName");
			String email = request.getParameter("email");
			String hireDate = request.getParameter("hireDate");
			String jobId = request.getParameter("jobId");

			Employee emp = new Employee(lastName, hireDate, email, jobId);

			dao.insertEmployee(emp);

		} else if (action.equals("update")) {
			String empId = request.getParameter("empId");
			String salary = request.getParameter("salary");
			Employee emp = new Employee();
			emp.setEmployeeId(empId);
			emp.setSalary(Integer.parseInt(salary));
			dao.updateEmployee(emp);

		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
