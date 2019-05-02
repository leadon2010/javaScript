package ajax.projectMini;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

/**
 * Servlet implementation class MiniControl
 */
@WebServlet("/MiniControl")
public class MiniControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MiniControl() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out = response.getWriter();

		String action = request.getParameter("action");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String uname = request.getParameter("uname");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		Member mem = new Member();
		mem.setId(id);
		mem.setPw(pw);
		mem.setName(uname);
		mem.setPhone(phone);
		mem.setAddress(address);
		MemberDAO dao = new MemberDAO();

		if ("".equals(action) || action == null) {
			out.println("<h1>No Action</h1>");

		} else if (action.equals("insert")) {
			System.out.println("insert call.");
			dao.insertMember(mem);

		} else if (action.equals("select")) {
			System.out.println("select call.");
			List<Member> list = dao.getMemberList();
			out.println(JSONArray.fromObject(list).toString());

		} else {
			out.println("<h1>Action Exception</h1>");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
