package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.User;

@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user = request.getParameter("user");
		
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("user : "+ user);
		out.println("</html>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		User user = new User(email, password);
		System.out.println(user);
		if(user.validate()) {
			//localhost:8080/Forms
			request.setAttribute("email", email); //request객체에 email을 전달
			request.getRequestDispatcher("/welcome.jsp").forward(request, response);
		} else {
			request.setAttribute("error", user.getMessage());
			request.getRequestDispatcher("/form1.jsp").forward(request, response);
		}
	}

}
