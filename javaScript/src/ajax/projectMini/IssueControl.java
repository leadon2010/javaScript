package ajax.projectMini;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/IssueControl")
public class IssueControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public IssueControl() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		String action = request.getParameter("action");
		PrintWriter out = response.getWriter();

		if (action == null || action.equals("")) {
			out.println("no action.");

		} else if (action.equals("issue")) {
			out.println("invalid action.");

		} else {
			out.println("invalid action.");

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
