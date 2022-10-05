package demo;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// localhost/MVC/Controller
@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		
		String page = null;
		if(action == null) {
			page = "/error.jsp";
		} else if (action.equals("login")) {
			page = "/login.jsp";
		} else if (action.equals("about")) {
			page = "/about.jsp";
		} else {
			page = "/index.jsp";
		}
		//프로젝트경로 http://localhost/MVC/page
		getServletContext().getRequestDispatcher(page).forward(request, response);
	}

}
