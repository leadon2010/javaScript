package ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AjaxParam
 */
@WebServlet("/AjaxParam")
public class AjaxParam extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AjaxParam() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		Map<String, String[]> map = request.getParameterMap();
		map.forEach((k, v) -> System.out.println(k + ", " + map.get(k)));
		PrintWriter out = response.getWriter();
		out.println("end");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
