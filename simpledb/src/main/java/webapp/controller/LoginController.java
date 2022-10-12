package webapp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import webapp.dao.LoginDAO;
import webapp.dao.LoginDAOImple;
import webapp.model.Login;

@WebServlet("/loginprocess")
public class LoginController extends HttpServlet {
	
	LoginDAO loginDAO = null;
	
	public LoginController() { 
		loginDAO = new LoginDAOImple();
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Login login = new Login();
		login.setEmail(request.getParameter("email"));
		login.setPassword(request.getParameter("password"));
		
		String result = loginDAO.loginCheck(login);
		// 1. 로그인 성공 이메일을 세션에 저장후 리스트 페이지로 이동
		if(result.equals("true")) {
			session.setAttribute("email", login.getEmail());
			response.sendRedirect("EmployeeController?action=LIST");
		} //2. 로그인 실패시 index.jsp 페이지로
		if(result.equals("false")) {
			response.sendRedirect("index.jsp?status=false");
		} //3. 에러시 index.jsp 페이지로
		if(result.equals("error")) {
			response.sendRedirect("index.jsp?status=error");
		}
	}
}



